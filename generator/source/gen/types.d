module gen.types;

import gen.model : DocType;
import std.string : strip, indexOf;

/// Sections of the documentation page that contain no API entities
immutable string[] SKIPPED_SECTIONS = [
    "Recent changes",
    "Authorizing your bot",
    "Making requests",
    "Local Bot API Server",
    "Test Environment",
    "Formatting options",
];

/**
Converts a type expression from the documentation ("Array of Array of PhotoSize",
"Integer or String", "True", ...) into a structured DocType.
*/
DocType parseDocType(string expr)
{
    import std.algorithm.iteration : splitter;
    import std.array : array, join;

    DocType result;
    string s = strip(expr);

    while (s.startsWith("Array of ")) {
        result.arrayDepth++;
        s = strip(s["Array of ".length .. $]);
    }

    if (s.canFind(" or ")) {
        result.isUnion = true;
        foreach (part; s.splitter(" or ")) {
            result.unionOf ~= strip(part);
        }
    } else {
        result.baseName = s;
    }

    return result;
}

private:
bool canFind(string haystack, string needle)
{
    return indexOf(haystack, needle) >= 0;
}

bool startsWith(string s, string prefix)
{
    return s.length >= prefix.length && s[0 .. prefix.length] == prefix;
}

unittest
{
    import std.exception : assertThrown;

    auto t1 = parseDocType("Integer");
    assert(t1.baseName == "Integer" && t1.arrayDepth == 0 && !t1.isUnion);

    auto t2 = parseDocType("Array of Message");
    assert(t2.baseName == "Message" && t2.arrayDepth == 1);

    auto t3 = parseDocType("Array of Array of PhotoSize");
    assert(t3.baseName == "PhotoSize" && t3.arrayDepth == 2);

    auto t4 = parseDocType("Integer or String");
    assert(t4.isUnion && t4.unionOf == ["Integer", "String"]);

    auto t5 = parseDocType("True");
    assert(t5.baseName == "True");
}
