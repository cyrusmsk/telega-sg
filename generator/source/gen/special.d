module gen.special;

import std.algorithm.searching : canFind;
import std.string : toLower;

/**
Generated module names. Modules follow the documentation page sections;
entities from the two large generic sections land in "basic".
*/
enum KNOWN_MODULES = [
    "basic", "updmessages", "stickers", "rich", "inline",
    "payments", "passport", "games", "poll", "webhook",
];

private struct Hint
{
    string keyword;
    string moduleName;
}

/// Documentation section title (lowercased) -> generated module
private immutable Hint[] SECTION_HINTS = [
    Hint("updating messages", "updmessages"),
    Hint("stickers", "stickers"),
    Hint("rich messages", "rich"),
    Hint("inline mode", "inline"),
    Hint("payments", "payments"),
    Hint("passport", "passport"),
    Hint("games", "games"),
    Hint("poll", "poll"),
];

/**
Entities living in the generic documentation sections but belonging
to a dedicated module for historical (legacy layout) reasons.
*/
private immutable string[string] NAME_MODULE_OVERRIDES = [
    // updates & webhook cluster
    "Update": "webhook",
    "WebhookInfo": "webhook",
    "getUpdates": "webhook",
    "setWebhook": "webhook",
    "deleteWebhook": "webhook",
    "getWebhookInfo": "webhook",
    // polls
    "Poll": "poll",
    "PollOption": "poll",
    "PollAnswer": "poll",
    "PollMedia": "poll",
    "InputPollOption": "poll",
    "InputPollOptionMedia": "poll",
    "sendPoll": "poll",
    "stopPoll": "poll",
    // games
    "Game": "games",
    "Animation": "games",
    "CallbackGame": "games",
    "GameHighScore": "games",
    "sendGame": "games",
    "setGameScore": "games",
    "getGameHighScores": "games",
];

string moduleOf(string entityName, string section)
{
    if (auto p = entityName in NAME_MODULE_OVERRIDES) {
        return *p;
    }

    auto s = section.toLower;

    foreach (immutable entry; SECTION_HINTS) {
        if (s.canFind(entry.keyword)) {
            return entry.moduleName;
        }
    }

    return "basic";
}

/**
Hand-written enums emitted verbatim (docs describe their values in prose,
not in a machine readable form).
Keyed by target module.
*/
immutable string[string] ENUM_BLOCKS = [
    "basic": import("enums/basic.d.snippet"),
    "poll": import("enums/poll.d.snippet"),
];

/**
Families documented only through parameter unions ("A or B or C") -
there is no dedicated page heading for them.
*/
immutable string[][] MANUAL_FAMILIES = [
    ["ReplyMarkup", "InlineKeyboardMarkup", "ReplyKeyboardMarkup", "ReplyKeyboardRemove", "ForceReply"],
];
