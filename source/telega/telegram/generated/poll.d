// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.poll;

import asdf.serialization : serdeOptional, serdeKeys;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;
import telega.telegram.generated.games;
import telega.telegram.generated.stickers;

/// Type of a poll
enum PollType : string
{
    @serdeKeys("quiz")
    Quiz    = "quiz",

    @serdeKeys("regular")
    Regular = "regular"
}

/++ At most one of the optional fields can be present in any given object. +/
struct PollMedia
{
    /// Media is an animation, information about the animation
    @serdeOptional
    Nullable!(Animation) animation;
    /// Media is an audio file, information about the file; currently, can't be received in a poll option
    @serdeOptional
    Nullable!(Audio) audio;
    /// Media is a general file, information about the file; currently, can't be received in a poll option
    @serdeOptional
    Nullable!(Document) document;
    /// The HTTP link attached to the poll option
    @serdeOptional
    Nullable!(string) link;
    /// Media is a live photo, information about the live photo
    @serdeOptional
    Nullable!(LivePhoto) live_photo;
    /// Media is a shared location, information about the location
    @serdeOptional
    Nullable!(Location) location;
    /// Media is a photo, available sizes of the photo
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
    /// Media is a sticker, information about the sticker; currently, for poll options only
    @serdeOptional
    Nullable!(Sticker) sticker;
    /// Media is a venue, information about the venue
    @serdeOptional
    Nullable!(Venue) venue;
    /// Media is a video, information about the video
    @serdeOptional
    Nullable!(Video) video;
}

alias InputPollOptionMedia = JsonableAlgebraicProxy!(InputMediaAnimation, InputMediaLink, InputMediaLivePhoto, InputMediaLocation, InputMediaPhoto, InputMediaSticker, InputMediaVenue, InputMediaVideo);

/++ This object contains information about one answer option in a poll. +/
struct PollOption
{
    /// Unique identifier of the option, persistent on option addition and deletion
    string persistent_id;
    /// Option text, 1-100 characters
    string text;
    /// Special entities that appear in the option text. Currently, only custom emoji entities are allowed in poll option texts
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
    /// Media added to the poll option
    @serdeOptional
    Nullable!(PollMedia) media;
    /// Number of users who voted for this option; may be 0 if unknown
    long voter_count;
    /// User who added the option; omitted if the option wasn't added by a user after poll creation
    @serdeOptional
    Nullable!(User) added_by_user;
    /// Chat that added the option; omitted if the option wasn't added by a chat after poll creation
    @serdeOptional
    Nullable!(Chat) added_by_chat;
    /// Point in time (Unix timestamp) when the option was added; omitted if the option existed in the original poll
    @serdeOptional
    Nullable!(long) addition_date;
}

/++ This object contains information about one answer option in a poll to be sent. +/
struct InputPollOption
{
    /// Option text, 1-100 characters
    string text;
    /// Mode for parsing entities in the text. See formatting options for more details. Currently, only custom emoji entities are allowed.
    @serdeOptional
    Nullable!(string) text_parse_mode;
    /// A JSON-serialized list of special entities that appear in the poll option text. It can be specified instead of text_parse_mode.
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
    /// Media added to the poll option
    // TODO(telega-generator): family type 'InputPollOptionMedia' can't be deserialized yet
}

/++ This object represents an answer of a user in a non-anonymous poll. +/
struct PollAnswer
{
    /// Unique poll identifier
    string poll_id;
    /// The chat that changed the answer to the poll, if the voter is anonymous
    @serdeOptional
    Nullable!(Chat) voter_chat;
    /// The user that changed the answer to the poll, if the voter isn't anonymous
    @serdeOptional
    Nullable!(User) user;
    /// 0-based identifiers of chosen answer options. May be empty if the vote was retracted.
    long[] option_ids;
    /// Persistent identifiers of the chosen answer options. May be empty if the vote was retracted.
    string[] option_persistent_ids;
}

/++ This object contains information about a poll. +/
struct Poll
{
    /// Unique poll identifier
    string id;
    /// Poll question, 1-300 characters
    string question;
    /// Special entities that appear in the question. Currently, only custom emoji entities are allowed in poll questions
    @serdeOptional
    Nullable!(MessageEntity[]) question_entities;
    /// List of poll options
    PollOption[] options;
    /// Total number of users that voted in the poll
    long total_voter_count;
    /// True, if the poll is closed
    bool is_closed;
    /// True, if the poll is anonymous
    bool is_anonymous;
    /// Poll type, currently can be “regular” or “quiz”
    string type;
    /// True, if the poll allows multiple answers
    bool allows_multiple_answers;
    /// True, if the poll allows to change the chosen answer options
    bool allows_revoting;
    /// True if voting is limited to users who have been members of the chat where the poll was originally sent for more than 24 hours
    bool members_only;
    /// A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which users can vote in the poll. The country code “FT” is used for users with anonymous numbers. If omitted, then users from any country can participate in the poll.
    @serdeOptional
    Nullable!(string[]) country_codes;
    /// Array of 0-based identifiers of the correct answer options. Available only for polls in quiz mode which are closed or were sent (not forwarded) by the bot or to the private chat with the bot.
    @serdeOptional
    Nullable!(long[]) correct_option_ids;
    /// Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    @serdeOptional
    Nullable!(string) explanation;
    /// Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
    @serdeOptional
    Nullable!(MessageEntity[]) explanation_entities;
    /// Media added to the quiz explanation
    @serdeOptional
    Nullable!(PollMedia) explanation_media;
    /// Amount of time in seconds the poll will be active after creation
    @serdeOptional
    Nullable!(long) open_period;
    /// Point in time (Unix timestamp) when the poll will be automatically closed
    @serdeOptional
    Nullable!(long) close_date;
    /// Description of the poll; for polls inside the Message object only
    @serdeOptional
    Nullable!(string) description;
    /// Special entities like usernames, URLs, bot commands, etc. that appear in the description
    @serdeOptional
    Nullable!(MessageEntity[]) description_entities;
    /// Media added to the poll description; for polls inside the Message object only
    @serdeOptional
    Nullable!(PollMedia) media;
}

/++ Use this method to send a native poll. On success, the sent Message is returned. +/
struct SendPollMethod
{
    mixin TelegramMethod!"/sendPoll";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username. Polls can't be sent to channel direct messages chats.
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Poll question, 1-300 characters
    string question;
    /// Mode for parsing entities in the question. See formatting options for more details. Currently, only custom emoji entities are allowed.
    @serdeOptional
    Nullable!(string) question_parse_mode;
    /// A JSON-serialized list of special entities that appear in the poll question. It can be specified instead of question_parse_mode.
    @serdeOptional
    Nullable!(MessageEntity[]) question_entities;
    /// A JSON-serialized list of 1-12 answer options
    InputPollOption[] options;
    /// True, if the poll needs to be anonymous, defaults to True
    @serdeOptional
    Nullable!(bool) is_anonymous;
    /// Poll type, “quiz” or “regular”, defaults to “regular”
    @serdeOptional
    Nullable!(string) type;
    /// Pass True if the poll allows multiple answers, defaults to False
    @serdeOptional
    Nullable!(bool) allows_multiple_answers;
    /// Pass True if the poll allows to change chosen answer options, defaults to False for quizzes and to True for regular polls
    @serdeOptional
    Nullable!(bool) allows_revoting;
    /// Pass True if the poll options must be shown in random order
    @serdeOptional
    Nullable!(bool) shuffle_options;
    /// Pass True if answer options can be added to the poll after creation; not supported for anonymous polls and quizzes
    @serdeOptional
    Nullable!(bool) allow_adding_options;
    /// Pass True if poll results must be shown only after the poll closes
    @serdeOptional
    Nullable!(bool) hide_results_until_closes;
    /// Pass True if voting is limited to users who have been members of the chat where the poll is being sent for more than 24 hours; for channel chats only
    @serdeOptional
    Nullable!(bool) members_only;
    /// A JSON-serialized list of 0-12 two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which users can vote in the poll; for channel chats only. Use “FT” as a country code to allow users with anonymous numbers to vote. If omitted or empty, then users from any country can participate in the poll.
    @serdeOptional
    Nullable!(string[]) country_codes;
    /// A JSON-serialized list of monotonically increasing 0-based identifiers of the correct answer options, required for polls in quiz mode
    @serdeOptional
    Nullable!(long[]) correct_option_ids;
    /// Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
    @serdeOptional
    Nullable!(string) explanation;
    /// Mode for parsing entities in the explanation. See formatting options for more details.
    @serdeOptional
    Nullable!(string) explanation_parse_mode;
    /// A JSON-serialized list of special entities that appear in the poll explanation. It can be specified instead of explanation_parse_mode.
    @serdeOptional
    Nullable!(MessageEntity[]) explanation_entities;
    /// Media added to the quiz explanation
    @serdeOptional
    Nullable!(InputPollMedia) explanation_media;
    /// Amount of time in seconds the poll will be active after creation, 5-2628000. Can't be used together with close_date.
    @serdeOptional
    Nullable!(long) open_period;
    /// Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 2628000 seconds in the future. Can't be used together with open_period.
    @serdeOptional
    Nullable!(long) close_date;
    /// Pass True if the poll needs to be immediately closed. This can be useful for poll preview.
    @serdeOptional
    Nullable!(bool) is_closed;
    /// Description of the poll to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) description;
    /// Mode for parsing entities in the poll description. See formatting options for more details.
    @serdeOptional
    Nullable!(string) description_parse_mode;
    /// A JSON-serialized list of special entities that appear in the poll description, which can be specified instead of description_parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) description_entities;
    /// Media added to the poll description
    @serdeOptional
    Nullable!(InputPollMedia) media;
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
    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    @serdeOptional
    Nullable!(ReplyMarkup) reply_markup;
}

/++ Use this method to send a native poll. On success, the sent Message is returned. +/
Message sendPoll(BotApi api, SendPollMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned. +/
struct StopPollMethod
{
    mixin TelegramMethod!"/stopPoll";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Identifier of the original message with the poll
    long message_id;
    /// A JSON-serialized object for a new message inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned. +/
Poll stopPoll(BotApi api, StopPollMethod method)
{
    return api.callMethod!(Poll)(method);
}
