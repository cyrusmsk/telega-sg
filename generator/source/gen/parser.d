module gen.parser;

import parserino;
import gen.model : TelegramApi, TelegramEntity, EntityType, Field, DocType;
import gen.types : parseDocType, SKIPPED_SECTIONS;
import std.string : strip, icmp, toLower;
import std.array : split;
import std.algorithm.searching : canFind, startsWith;
import std.string : join;
import std.regex : matchFirst, match, ctRegex;
import std.range : empty;
import std.format : format;
import std.uni : isLower, isWhite;

/**
Parses the Telegram Bot API documentation page HTML into a TelegramApi model.

Note: parserino Element wrappers are reference counted but not safely copyable,
so this module never stores them - plain data is extracted eagerly.
*/
TelegramApi parseBotApiPage(string html)
{
    TelegramApi api = new TelegramApi;

    import std.regex : matchFirst, match, ctRegex;
    static enum versionRegex = ctRegex!(`Bot API\s+(\d+\.\d+)`);

    if (auto m = matchFirst(html, versionRegex)) {
        api.apiVersion = m[1].idup;
    }

    Document doc = Document(html);

    bool foundContent;

    foreach (candidate; doc.bySelector("div#dev_page_content")) {
        parseContent(candidate, api);
        foundContent = true;
        break;
    }

    if (!foundContent) {
        api.warn("div#dev_page_content not found on the page");
    }

    return api;
}

private:

void apiWarn(string msg)
{
    import core.thread;
    // warnings are collected by the caller via the api object; module-level helper
    // is not available here, so store nothing (kept for layout mismatch logging)
    import std.stdio : writeln;
    writeln("[warn] ", msg);
}

/// Data accumulated for the entity currently being walked
struct PendingEntity
{
    TelegramEntity entity;
    /// Description texts collected so far
    string[] paragraphs;
    bool haveTable;
    Field[] fields;
    /// Set when an extra unexpected table follows the main one
    bool extraTable;
    /// Anchors (#targets) linked anywhere in the entity region
    string[] links;
    /// Return type sniffed from description paragraphs (methods only)
    DocType returnType;
}

void parseContent(Element content, TelegramApi api)
{
    string section;
    bool sectionSkipped;

    PendingEntity pending;

    void flush()
    {
        if (pending.entity !is null) {
            completeEntity(pending, api);
        }
        pending = PendingEntity.init;
    }

    foreach (el; content.children) {
        auto tag = el.name;

        if (tag == "h3") {
            flush();
            section = el.innerText.strip();
            sectionSkipped = isSkippedSection(section);
            if (!sectionSkipped && !api.sections.canFind(section)) {
                api.sections ~= section.idup;
            }
        } else if (tag == "h4") {
            flush();
            if (!sectionSkipped && !section.empty) {
                pending.entity = makeEntity(el, section);
            }
        } else if (pending.entity !is null) {
            collectElement(el, pending);
        }
    }
    flush();
}

bool isIdentifier(string s)
{
    import std.ascii : isAlphaNum, isAlpha;

    if (s.empty || !isAlpha(s[0])) {
        return false;
    }

    foreach (c; s[1 .. $]) {
        if (!isAlphaNum(c)) {
            return false;
        }
    }

    return true;
}

bool isSkippedSection(string title)
{
    foreach (skipped; SKIPPED_SECTIONS) {
        if (!icmp(title, skipped)) {
            return true;
        }
    }

    return false;
}

TelegramEntity makeEntity(Element h4, string section)
{
    auto entity = new TelegramEntity;
    entity.section = section.idup;
    entity.name = h4.innerText.strip().idup;
    // Lowercase first letter means the entity describes a method
    entity.kind = entity.name.length && isLower(cast(dchar)entity.name[0])
        ? EntityType.method
        : EntityType.type;
    entity.id = entity.name.toLower().idup;

    foreach (anchor; h4.bySelector("a.anchor")) {
        entity.id = anchor.getAttribute("name").idup;
        break;
    }

    return entity;
}

void collectElement(Element el, ref PendingEntity pending)
{
    auto tag = el.name;

    foreach (a; el.bySelector("a[href^='#']")) {
        auto href = a.getAttribute("href");
        if (href.length > 1) {
            pending.links ~= href[1 .. $].idup;
        }
    }

    if (tag == "p" || tag == "blockquote") {
        if (pending.entity.kind == EntityType.method && pending.returnType.baseName.empty && !pending.returnType.isUnion) {
            sniffReturnType(el.innerHTML, pending.returnType);
        }

        auto text = cleanupText(el.innerText);
        if (!text.empty) {
            pending.paragraphs ~= text;
        }
    } else if (tag == "table") {
        if (!pending.haveTable) {
            pending.haveTable = true;
            parseTable(el, pending);
        } else {
            pending.extraTable = true;
        }
    }
}

void completeEntity(ref PendingEntity pending, TelegramApi api)
{
    auto entity = pending.entity;

    // Headings without a table are page prose, empty objects ("Currently holds
    // no information.") or abstract families linking to their variants
    if (!pending.haveTable) {
        handleTableless(pending, api);
        return;
    }

    // Valid entity names are D-like identifiers ("Message", "sendMessage");
    // rejects page prose headings like "Accent colors"
    if (!isIdentifier(entity.name)) {
        return;
    }

    if (pending.extraTable) {
        api.warn(format("%s: multiple tables found, extras were ignored", entity.name));
    }

    entity.description = pending.paragraphs.dup;
    entity.fields = pending.fields;
    entity.returnType = pending.returnType;

    api.entities ~= entity;
}

private enum emPrimitiveRegex = ctRegex!(`<em>(True|Integer|Boolean|String|Float)</em>[^.]*?(?:is returned|returned|on success)`, "i");
private enum trueReturnRegex = ctRegex!(`(?:on success[^.]*?)?true is returned|returns\s+(?:<[^>]+>\s*)*true\b`, "i");
private enum arrayReturnRegex = ctRegex!(`array of[^<]*(?:<a href="#[a-z0-9]+"[^>]*>([A-Z][A-Za-z0-9]+)</a>)`, "i");
private enum anyLinkRegex = ctRegex!(`<a href="#[a-z0-9]+"[^>]*>([A-Z][A-Za-z0-9]+)</a>`);

/**
Keeps only the sentences that talk about returning something.
Prevents method names mentioned mid-description from being mistaken
for the return type.
*/
string returnSentences(string html)
{
    import std.array : appender;

    auto out_ = appender!(char[])();

    foreach (sentence; split(html, ". ")) {
        if (sentence.toLower.canFind("return")) {
            out_ ~= sentence;
            out_ ~= ". ";
        }
    }

    auto result = cast(string) out_.data;
    return result.length ? result : html;
}

/**
Guesses the method return type from a description paragraph's HTML.
Leaves DocType untouched when nothing confident is found.
*/
void sniffReturnType(string html, ref DocType result)
{
    import std.regex : match, matchFirst;
    import std.string : toLower;

    html = returnSentences(html);
    auto lower = html.toLower();

    if (!lower.canFind("return")) {
        return;
    }

    if (auto m = matchFirst(html, emPrimitiveRegex)) {
        import std.string : capitalize;
        result.baseName = capitalize(m[1].toLower());
        return;
    }

    if (matchFirst(html, trueReturnRegex)) {
        result.baseName = "True";
        return;
    }

    if (auto m = matchFirst(html, arrayReturnRegex)) {
        result.arrayDepth = 1;
        result.baseName = m[1].idup;
        return;
    }

    // last anchor link in a sentence about returning something
    if (lower.canFind("returns") || lower.canFind("returned")) {
        string lastName;

        foreach (m; match(html, anyLinkRegex)) {
            lastName = m[1].idup;
        }

        if (!lastName.empty) {
            result.baseName = lastName;
        }
    }
}

void handleTableless(ref PendingEntity pending, TelegramApi api)
{
    auto entity = pending.entity;
    auto text = pending.paragraphs.join(" ").toLower();

    if (text.canFind("no information")) {
        entity.isEmptyObject = true;
        api.entities ~= entity;
        return;
    }

    // Family names must look like entity names; rejects headings such as
    // "Sending files" or "Formatting options"
    if (pending.links.length >= 2 && isIdentifier(entity.name)) {
        import std.algorithm.sorting : sort;
        import std.array : array;

        auto members = pending.links.dup.sort().release;

        string[] unique;
        foreach (m; members) {
            // drop duplicates and self references
            if (!unique.canFind(m) && m != entity.id) {
                unique ~= m;
            }
        }

        if (unique.length >= 2) {
            entity.isFamily = true;
            entity.familyMembers = unique;
            api.entities ~= entity;
            return;
        }
    }

    // regular page prose
}

void parseTable(Element table, ref PendingEntity pending)
{
    size_t columnCount;

    foreach (th; table.bySelector("thead th")) {
        columnCount++;
    }

    if (columnCount != 3 && columnCount != 4) {
        apiWarn(format("%s: unexpected table layout with %s columns", pending.entity.name, columnCount));
        return;
    }

    foreach (row; table.bySelector("tbody tr")) {
        string[] texts;

        foreach (cell; row.children) {
            texts ~= cell.innerText.idup;
        }

        if (texts.length != columnCount) {
            continue;
        }

        Field field;
        field.name = cleanupText(texts[0]);

        if (field.name.empty) {
            continue;
        }

        field.docType = parseDocType(texts[1]);

        if (columnCount == 3) {
            auto description = texts[2];
            field.optional = takesOptionalMarker(description);
            field.description = cleanupText(description);
        } else {
            field.optional = strip(texts[2]) != "Yes";
            field.description = cleanupText(texts[3]);
        }

        pending.fields ~= field;
    }
}

/**
Detects and strips the leading "Optional." marker in a description cell.
*/
bool takesOptionalMarker(ref string description)
{
    auto trimmed = description.strip();

    if (trimmed.length > 9 && icmp(trimmed[0 .. 8], "optional") == 0
            && trimmed[8] == '.') {
        description = trimmed[9 .. $];
        return true;
    }

    return false;
}

string cleanupText(string text)
{
    import std.array : appender;

    auto out_ = appender!(char[])();
    bool pendingSpace;

    foreach (dchar c; text) {
        if (isWhite(c)) {
            pendingSpace = out_.data.length > 0;
        } else {
            if (pendingSpace) {
                out_.put(' ');
                pendingSpace = false;
            }
            out_.put(c);
        }
    }

    return cast(string) out_.data;
}
