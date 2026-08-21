// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.games;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;

/++ This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound). +/
struct Animation
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Video width as defined by the sender
    long width;
    /// Video height as defined by the sender
    long height;
    /// Duration of the video in seconds as defined by the sender
    long duration;
    /// Animation thumbnail as defined by the sender
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
    /// Original animation filename as defined by the sender
    @serdeOptional
    Nullable!(string) file_name;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ Use this method to send a game. On success, the sent Message is returned. +/
struct SendGameMethod
{
    mixin TelegramMethod!"/sendGame";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot in the format @username. Games can't be sent to channel direct messages chats and channel chats.
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Short name of the game, serves as the unique identifier for the game. Set up your games via @BotFather.
    string game_short_name;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    @serdeOptional
    Nullable!(bool) allow_paid_broadcast;
    /// Unique identifier of the message effect to be added to the message; for private chats only
    @serdeOptional
    Nullable!(string) message_effect_id;
    /// Description of the message to reply to
    @serdeOptional
    Nullable!(ReplyParameters) reply_parameters;
    /// A JSON-serialized object for an inline keyboard. If empty, one 'Play game_title' button will be shown. If not empty, the first button must launch the game.
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to send a game. On success, the sent Message is returned. +/
Message sendGame(BotApi api, SendGameMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers. +/
struct Game
{
    /// Title of the game
    string title;
    /// Description of the game
    string description;
    /// Photo that will be displayed in the game message in chats
    PhotoSize[] photo;
    /// Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
    @serdeOptional
    Nullable!(string) text;
    /// Special entities that appear in text, such as usernames, URLs, bot commands, etc.
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
    /// Animation that will be displayed in the game message in chats. Upload via BotFather.
    @serdeOptional
    Nullable!(Animation) animation;
}

struct CallbackGame
{
}

/++ Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False. +/
struct SetGameScoreMethod
{
    mixin TelegramMethod!"/setGameScore";
    /// User identifier
    long user_id;
    /// New score, must be non-negative
    long score;
    /// Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters.
    @serdeOptional
    Nullable!(bool) force;
    /// Pass True if the game message should not be automatically edited to include the current scoreboard
    @serdeOptional
    Nullable!(bool) disable_edit_message;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat.
    @serdeOptional
    Nullable!(long) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the sent message.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
}

/++ Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False. +/
bool setGameScore(BotApi api, SetGameScoreMethod method)
{
    return api.callMethod!(bool)(method);
}

/++
Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.

This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.
+/
struct GetGameHighScoresMethod
{
    mixin TelegramMethod!"/getGameHighScores";
    /// Target user id
    long user_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat.
    @serdeOptional
    Nullable!(long) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the sent message.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
}

/++
Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.

This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.
+/
GameHighScore[] getGameHighScores(BotApi api, GetGameHighScoresMethod method)
{
    return api.callMethod!(GameHighScore[])(method);
}

/++
This object represents one row of the high scores table for a game.

And that's about all we've got for now.If you've got any questions, please check out our Bot FAQ »
+/
struct GameHighScore
{
    /// Position in high score table for the game
    long position;
    /// User
    User user;
    /// Score
    long score;
}
