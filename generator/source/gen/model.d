module gen.model;

import std.array : Appender;

enum EntityType
{
    type,
    method
}

/// Parsed documentation type expression, e.g. "Array of Array of PhotoSize"
struct DocType
{
    /// Base type name as written in docs: "Integer", "String", "True", "Message", ...
    /// May be empty for unions of multiple distinct types.
    string baseName;

    /// Number of "Array of" prefixes
    ubyte arrayDepth;

    /// True when docs declare a union "A or B or C"
    bool isUnion;

    /// Union members (raw base names) when isUnion
    string[] unionOf;
}

struct Field
{
    string name;
    DocType docType;
    /// Types: description had "Optional." marker. Methods: Required column != "Yes".
    bool optional;
    string description;
}

class TelegramEntity
{
    EntityType kind;
    /// Anchor id, e.g. "sendmessage"
    string id;
    /// Entity name, e.g. "sendMessage" / "Message"
    string name;
    /// Title of the enclosing h3 section
    string section;
    /// Cleaned description paragraphs (before the table)
    string[] description;
    Field[] fields;

    /// Heading had no table and describes an object holding no information
    bool isEmptyObject;
    /// Heading had no table but links to variant objects (abstract family)
    bool isFamily;
    /// Names of linked variant objects (for isFamily entities)
    string[] familyMembers;

    /// Resolved method return type as written in docs ("True", "Message", ...).
    /// Empty baseName without union means the return type was not recognized.
    DocType returnType;
}

class TelegramApi
{
    TelegramEntity[] entities;
    /// Unique section titles in document order
    string[] sections;
    /// Non-fatal problems collected during parsing/generation
    string[] warnings;
    /// Bot API version detected on the page, e.g. "10.2"
    string apiVersion;

    void warn(string msg)
    {
        warnings ~= msg;
    }
}
