module gen.emitter;

import gen.model : TelegramApi, TelegramEntity, EntityType, Field, DocType;
import gen.special : moduleOf, ENUM_BLOCKS, MANUAL_FAMILIES;
import std.string : format, toLower, join, capitalize;
import std.array : appender, array;
import std.algorithm.sorting : sort;
import std.algorithm.iteration : map, filter;
import std.algorithm.searching : canFind;
import std.range : empty;
import std.string : splitLines, replace, strip;
import std.array : split;

/**
Generates module file contents. Returns fileName (without ".d") -> D source code.
*/
string[string] emitModules(TelegramApi api, string[] enabledModules)
{
    auto ctx = new GenerationContext(api);

    foreach (entity; api.entities) {
        auto mod = moduleOf(entity.name, entity.section);

        if (!enabledModules.empty && !enabledModules.canFind(mod)) {
            continue;
        }

        ctx.entities ~= entity;
    }

    string[string] files;

    foreach (moduleName; ctx.usedModules) {
        files[moduleName] = ctx.emitModule(moduleName);
    }

    files["package"] = emitPackage(ctx);

    return files;
}

private:

/// Minimal line collector
struct FileEmitter
{
    private string[] lines;

    void put(string line)
    {
        lines ~= line;
    }

    string data()
    {
        import std.array : join;

        return lines.join("\n") ~ "\n";
    }
}


enum KNOWN_MODULE_ORDER = [
    "basic", "updmessages", "stickers", "rich", "inline",
    "payments", "passport", "games", "poll", "webhook",
];

/**
Everything known about a resolved documentation type.
*/
struct ResolvedType
{
    /// D type expression without Nullability wrapper ("long", "PhotoSize[]", "ChatId")
    string dType;
    /// Referenced generated entity names
    string[] refs;
    /// Type could not be resolved - field must be skipped with a TODO note
    bool unresolved;
    /// JsonableAlgebraicProxy family alias (serialization only)
    bool isFamilyAlias;
}

class GenerationContext
{
    TelegramApi api;
    /// Selected entities in document order
    TelegramEntity[] entities;
    /// Entity name -> generated module (all known entities, selected or not)
    string[string] moduleByName;
    /// Anchor id -> entity name
    string[string] nameById;
    /// Set when some emitted code references InputFile
    bool inputfileReferenced;
    /// Value-type containment edges between custom types (cycle detection):
    /// container -> embedded type names
    string[][string] valueEdges;

    this(TelegramApi api)
    {
        this.api = api;

        foreach (entity; api.entities) {
            moduleByName[entity.name] = moduleOf(entity.name, entity.section);
            nameById[entity.id] = entity.name;
        }
    }

    string[] usedModules()
    {
        bool[string] used;

        foreach (entity; entities) {
            used[moduleOf(entity.name, entity.section)] = true;
        }

        return KNOWN_MODULE_ORDER.filter!(m => m in used).array;
    }

    TelegramEntity findEntity(string name)
    {
        foreach (entity; api.entities) {
            if (entity.name == name) {
                return entity;
            }
        }

        return null;
    }

    void warn(string msg)
    {
        api.warn(msg);
    }

    string emitModule(string moduleName)
    {
        auto out_ = FileEmitter();

        out_.put(format("// Generated from Telegram Bot API %s documentation by telega-api-generator.", api.apiVersion));
        out_.put("// Do not edit manually!");
        out_.put("");
        out_.put(format("module telega.telegram.generated.%s;", moduleName));
        out_.put("");

        ModuleRefs refs;

        if (moduleName in ENUM_BLOCKS) {
            refs.hasSerdeKeys = true;
        }

        foreach (entity; entities) {
            if (moduleOf(entity.name, entity.section) != moduleName) {
                continue;
            }

            collectImports(entity, refs);
        }

        foreach (line; refs.importLines()) {
            out_.put(line);
        }

        // InputFile is referenced by the docs but never defined on its own page
        if (moduleName == "basic" && inputfileReferenced && findEntity("InputFile") is null) {
            out_.put("");
            out_.put("/// This object represents the contents of a file to be uploaded.");
            out_.put("/// Must be posted using multipart/form-data in the usual way.");
            out_.put("struct InputFile");
            out_.put("{");
            out_.put("}");
        }

        if (auto p = moduleName in ENUM_BLOCKS) {
            out_.put("");
            foreach (line; (*p).splitLines()) {
                out_.put(line);
            }
        }

        foreach (entity; entities) {
            if (moduleOf(entity.name, entity.section) != moduleName) {
                continue;
            }

            out_.put("");
            foreach (line; emitEntity(entity, refs)) {
                out_.put(line);
            }
        }

        if (moduleName == "basic") {
            foreach (family; MANUAL_FAMILIES) {
                out_.put("");
                foreach (line; emitManualFamily(family)) {
                    out_.put(line);
                }
            }
        }

        return out_.data;
    }

    void collectImports(TelegramEntity entity, ref ModuleRefs refs)
    {
        if (entity.kind == EntityType.method) {
            refs.needsBotApi = true;
        }

        foreach (field; entity.fields) {
            collectFieldType(entity, field, refs);
        }

        if (entity.kind == EntityType.method && !entity.returnType.baseName.empty) {
            auto mod = moduleOf(entity.name, entity.section);
            auto r = resolveDocType(entity.returnType);

            foreach (name; r.refs) {
                noteRef(name, refs, mod);
            }

            if (r.dType == "ChatId") {
                refs.needsBotApi = true;
            }
        }
    }

    void collectFieldType(TelegramEntity entity, Field field, ref ModuleRefs refs)
    {
        auto mod = moduleOf(entity.name, entity.section);

        if (field.optional) {
            refs.hasOptional = true;
        }

        if (isDKeyword(field.name)) {
            refs.hasSerdeKeys = true;
        }

        auto r = resolveDocType(field.docType);

        foreach (name; r.refs) {
            noteRef(name, refs, mod);
        }

        if (r.dType == "ChatId") {
            refs.needsBotApi = true;
        }

        // record plain (non-array) value embedding for cycle detection
        if (!r.unresolved && !r.isFamilyAlias) {
            auto bare = stripArraySuffix(r.dType);

            if ((bare in moduleByName) !is null) {
                valueEdges[entity.name] ~= bare;
            }
        }
    }

    /// True when embedding typeName inside containerName creates a value cycle
    bool createsCycle(string containerName, string typeName)
    {
        bool[string] visited;

        return reaches(typeName, containerName, visited);
    }

    bool reaches(in string from_, in string target, ref bool[string] visited)
    {
        import std.algorithm.searching : canFind;

        if (from_ == target) {
            return true;
        }

        if ((from_ in visited) !is null) {
            return false;
        }

        visited[from_] = true;

        if (auto p = from_ in valueEdges) {
            foreach (next; *p) {
                if (reaches(next, target, visited)) {
                    return true;
                }
            }
        }

        return false;
    }

    void noteRef(string name, ref ModuleRefs refs, string currentModule)
    {
        if (name == "InputFile") {
            inputfileReferenced = true;
        }

        foreach (family; MANUAL_FAMILIES) {
            if (name == family[0]) {
                if (currentModule != "basic") {
                    refs.externalModules["basic"] = true;
                }
                return;
            }
        }

        if (auto p = name in moduleByName) {
            if (*p != currentModule) {
                refs.externalModules[*p] = true;
            }
        }
    }

    string[] emitEntity(TelegramEntity entity, ref ModuleRefs refs)
    {
        if (entity.isEmptyObject) {
            auto lines = ddoc(entity.description);
            lines ~= format("struct %s", entity.name);
            lines ~= "{";
            lines ~= "}";
            return lines;
        }

        if (entity.isFamily) {
            return emitFamily(entity);
        }

        final switch (entity.kind) with (EntityType) {
            case EntityType.type:
                return emitType(entity, refs);
            case EntityType.method:
                return emitMethod(entity, refs);
        }
    }

    string[] emitFamily(TelegramEntity entity)
    {
        string[] members;

        foreach (id; entity.familyMembers) {
            if (auto p = id in nameById) {
                members ~= *p;
            } else {
                warn(format("%s: family member '%s' not found", entity.name, id));
            }
        }

        if (members.length < 2) {
            warn(format("%s: family has less than two known members, skipped", entity.name));
            return [];
        }

        auto lines = ddoc(entity.description);
        lines ~= format("alias %s = JsonableAlgebraicProxy!(%s);", entity.name, members.join(", "));
        return lines;
    }

    string[] emitType(TelegramEntity entity, ref ModuleRefs refs)
    {
        string[] lines = ddoc(entity.description);
        lines ~= format("struct %s", entity.name);
        lines ~= "{";

        foreach (field; entity.fields) {
            foreach (line; emitField(entity, field, false, refs)) {
                lines ~= line;
            }
        }

        lines ~= "}";
        return lines;
    }

    string[] emitMethod(TelegramEntity entity, ref ModuleRefs refs)
    {
        import std.ascii : toUpper;

        auto methodStructName = cast(char) entity.name[0].toUpper() ~ entity.name[1 .. $] ~ "Method";
        string[] lines = ddoc(entity.description);

        lines ~= format("struct %s", methodStructName);
        lines ~= "{";
        lines ~= format("    mixin TelegramMethod!\"/%s\";", entity.name);

        foreach (field; entity.fields) {
            foreach (line; emitField(entity, field, true, refs)) {
                lines ~= line;
            }
        }

        lines ~= "}";
        lines ~= "";

        // wrapper function
        auto ret = resolveDocType(entity.returnType);

        if (ret.unresolved) {
            warn(format("%s: unresolved return type, wrapper omitted", entity.name));
            return lines;
        }

        if (ret.isFamilyAlias) {
            warn(format("%s: family return type %s, wrapper omitted", entity.name, ret.dType));
            return lines;
        }

        foreach (line; ddoc(entity.description)) {
            lines ~= line;
        }

        lines ~= format("%s %s(BotApi api, %s method)", ret.dType, entity.name, methodStructName);
        lines ~= "{";
        lines ~= format("    return api.callMethod!(%s)(method);", ret.dType);
        lines ~= "}";

        return lines;
    }

    string[] emitField(TelegramEntity entity, Field field, bool isMethodParam, ref ModuleRefs refs)
    {
        auto r = resolveDocType(field.docType);

        auto mod = moduleOf(entity.name, entity.section);

        foreach (name; r.refs) {
            noteRef(name, refs, mod);
        }

        if (r.dType == "ChatId") {
            refs.needsBotApi = true;
        }

        string[] lines;

        if (!field.description.empty) {
            lines ~= "    " ~ singleLineDdoc(field.description);
        }

        // D keywords can't be used as identifiers - rename with a trailing
        // underscore and keep the original JSON key via @serdeKeys
        string declName = field.name;

        if (isDKeyword(declName)) {
            refs.hasSerdeKeys = true;
            lines ~= format("    @serdeKeys(\"%s\")", field.name);
            declName ~= "_";
        }

        if (r.unresolved) {
            warn(format("%s.%s: unresolved type, field skipped", entity.name, field.name));
            lines ~= format("    // TODO(telega-generator): unsupported type for field '%s'", field.name);
            return lines;
        }

        if (r.isFamilyAlias && !isMethodParam) {
            warn(format("%s.%s: family type %s is not supported on response objects, field skipped",
                    entity.name, field.name, r.dType));
            lines ~= format("    // TODO(telega-generator): family type '%s' can't be deserialized yet", r.dType);
            return lines;
        }

        if (!isMethodParam) {
            import std.string : endsWith;

            auto bare = r.dType;

            while (bare.endsWith("[]")) {
                bare = bare[0 .. $ - 2];
            }

            if ((bare in moduleByName) !is null && createsCycle(entity.name, bare)) {
                warn(format("%s.%s: recursive value type %s, field skipped",
                        entity.name, field.name, r.dType));
                lines ~= format("    // TODO(telega-generator): recursive reference to '%s' can't be embedded by value", bare);
                return lines;
            }
        }

        if (field.optional) {
            refs.hasOptional = true;
            lines ~= "    @serdeOptional";
            lines ~= format("    Nullable!(%s) %s;", r.dType, declName);
        } else {
            lines ~= format("    %s %s;", r.dType, declName);
        }

        return lines;
    }

    ResolvedType resolveDocType(DocType docType)
    {
        if (docType.isUnion) {
            return resolveUnion(docType.unionOf);
        }

        // comma-and separated unions written as a single cell,
        // e.g. "InputMediaAudio, InputMediaDocument and InputMediaVideo"
        if (docType.baseName.canFind(", ") && docType.baseName.canFind(" and ")) {
            auto flat = docType.baseName.replace(" and ", ", ");
            auto parts = flat.split(", ")
                .map!strip
                .filter!(p => p.length > 0)
                .array;

            if (parts.length >= 2) {
                auto r = resolveUnion(parts);

                if (!r.unresolved) {
                    return r;
                }
            }
        }

        auto r = resolveBase(docType.baseName);

        if (r.unresolved) {
            return r;
        }

        foreach (_; 0 .. docType.arrayDepth) {
            r.dType ~= "[]";
        }

        return r;
    }

    ResolvedType resolveBase(string baseName)
    {
        ResolvedType r;

        switch (baseName) {
            case "Integer":
                r.dType = "long";
                return r;
            case "Float":
            case "Float number":
                r.dType = "double";
                return r;
            case "String":
                r.dType = "string";
                return r;
            case "Boolean":
            case "True":
                r.dType = "bool";
                return r;
            case "Link":
                r.dType = "string";
                return r;
            case "InputFile":
                r.dType = "InputFile";
                r.refs ~= "InputFile";
                return r;
            default:
                break;
        }

        auto entity = findEntity(baseName);

        if (entity !is null) {
            r.dType = baseName;
            r.refs ~= baseName;
            r.isFamilyAlias = entity.isFamily;
            return r;
        }

        r.unresolved = true;
        return r;
    }

    ResolvedType resolveUnion(string[] parts)
    {
        ResolvedType r;

        if (parts == ["Integer", "String"]) {
            r.dType = "ChatId";
            return r;
        }

        if (parts == ["InputFile", "String"]) {
            r.dType = "string";
            return r;
        }

        foreach (family; MANUAL_FAMILIES) {
            if (sameMembers(parts, family[1 .. $])) {
                r.dType = family[0];
                r.isFamilyAlias = true;
                return r;
            }
        }

        foreach (candidate; api.entities) {
            if (!candidate.isFamily) {
                continue;
            }

            bool all;

            foreach (part; parts) {
                if (!candidate.familyMembers.canFind(part.toLower)) {
                    all = false;
                    break;
                }
                all = true;
            }

            if (all) {
                r.dType = candidate.name;
                r.refs ~= candidate.name;
                r.isFamilyAlias = true;
                return r;
            }
        }

        r.unresolved = true;
        return r;
    }
}

bool sameMembers(in string[] a, in string[] b)
{
    if (a.length != b.length) {
        return false;
    }

    foreach (x; a) {
        if (!b.canFind(x)) {
            return false;
        }
    }

    return true;
}

/// Import requirements gathered while emitting one module
struct ModuleRefs
{
    bool needsBotApi;
    bool hasOptional;
    bool hasSerdeKeys;
    bool[string] externalModules;

    string[] importLines()
    {
        string[] lines;

        if (hasOptional) {
            import std.array : array;

            string[] serde = ["serdeOptional"];

            if (hasSerdeKeys) {
                serde ~= "serdeKeys";
            }

            lines ~= "import asdf.serialization : " ~ serde.join(", ") ~ ";";
            lines ~= "import std.typecons : Nullable;";
        }

        if (needsBotApi) {
            lines ~= "import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;";
        }

        lines ~= "import telega.serialization : JsonableAlgebraicProxy;";

        auto mods = externalModules.keys;
        mods.sort();

        foreach (m; mods) {
            lines ~= format("import telega.telegram.generated.%s;", m);
        }

        return lines;
    }
}

string[] ddoc(in string[] paragraphs)
{
    string[] lines;

    if (paragraphs.empty) {
        return lines;
    }

    if (paragraphs.length == 1) {
        lines ~= "/++ " ~ escapeDdoc(paragraphs[0]) ~ " +/";
        return lines;
    }

    lines ~= "/++";
    foreach (p; paragraphs) {
        lines ~= escapeDdoc(p);
        lines ~= "";
    }

    // drop trailing empty line
    if (lines[$ - 1].empty) {
        lines = lines[0 .. $ - 1];
    }

    lines ~= "+/";
    return lines;
}

string singleLineDdoc(string text)
{
    return "/// " ~ escapeDdoc(text);
}

string escapeDdoc(string text)
{
    import std.array : replace;

    return text.replace("$", "$$");
}

string emitPackage(GenerationContext ctx)
{
    import std.format : format;

    auto out_ = FileEmitter();

    out_.put(format("// Generated from Telegram Bot API %s documentation by telega-api-generator.", ctx.api.apiVersion));
    out_.put("// Do not edit manually!");
    out_.put("//");
    out_.put("// Module layout follows the documentation page sections:");
    out_.put("// basic       - 'Available types' + 'Available methods'");
    out_.put("// updmessages - 'Updating messages'");
    out_.put("// stickers    - 'Stickers'");
    out_.put("// rich        - 'Rich messages'");
    out_.put("// inline      - 'Inline mode'");
    out_.put("// payments    - 'Payments'");
    out_.put("// passport    - 'Telegram Passport'");
    out_.put("// games       - 'Games'");
    out_.put("// poll/webhook - thematic overrides for legacy parity");
    out_.put("");
    out_.put("module telega.telegram.generated;");
    out_.put("");

    foreach (m; ctx.usedModules) {
        out_.put(format("public import telega.telegram.generated.%s;", m));
    }

    return out_.data;
}

/// D reserved words that may appear as documentation field names
enum D_KEYWORDS = [
    "abstract", "alias", "align", "asm", "assert", "auto", "body", "break",
    "case", "cast", "catch", "class", "const", "continue", "debug", "default",
    "delegate", "delete", "deprecated", "do", "else", "enum", "export",
    "extern", "false", "final", "finally", "for", "foreach",
    "foreach_reverse", "function", "goto", "if", "import", "in", "inout",
    "interface", "invariant", "is", "lazy", "macro", "mixin", "module", "new",
    "nothrow", "null", "out", "override", "package", "pragma", "private",
    "protected", "public", "pure", "ref", "return", "scope", "shared",
    "static", "struct", "super", "switch", "synchronized", "template", "this",
    "throw", "true", "try", "typedef", "typeid", "typeof", "ubyte", "ucent",
    "uint", "ulong", "union", "unittest", "ushort", "version", "void",
    "volatile", "wchar", "while", "with",
];

bool isDKeyword(string s)
{
    return D_KEYWORDS.canFind(s);
}

string[] emitManualFamily(in string[] family)
{
    import gen.special : MANUAL_FAMILIES;

    string[] lines;

    lines ~= format("/// Alias for the %s family of objects", family[0]);
    lines ~= format("alias %s = JsonableAlgebraicProxy!(%s);", family[0], family[1 .. $].join(", "));
    return lines;
}

string stripArraySuffix(string t)
{
    import std.string : endsWith;

    auto result = t;

    while (result.endsWith("[]")) {
        result = result[0 .. $ - 2];
    }

    return result;
}
