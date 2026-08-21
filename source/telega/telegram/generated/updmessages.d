// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.updmessages;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;
import telega.telegram.generated.rich;

/++ Use this method to edit text, rich and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
struct EditMessageTextMethod
{
    mixin TelegramMethod!"/editMessageText";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message to edit.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// New text of the message, 1-4096 characters after entity parsing; required if rich_message isn't specified
    @serdeOptional
    Nullable!(string) text;
    /// Mode for parsing entities in the message text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Link preview generation options for the message
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
    /// New rich content of the message; required if text isn't specified. Direct upload of new files isn't supported when an inline message is edited.
    @serdeOptional
    Nullable!(InputRichMessage) rich_message;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit text, rich and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
bool editMessageText(BotApi api, EditMessageTextMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
struct EditMessageCaptionMethod
{
    mixin TelegramMethod!"/editMessageCaption";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message to edit.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// New caption of the message, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media. Supported only for animation, photo and video messages.
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
bool editMessageCaption(BotApi api, EditMessageCaptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit animation, audio, document, live photo, photo, or video messages, or to replace a text or a rich message with a media. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo, a live photo, or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
struct EditMessageMediaMethod
{
    mixin TelegramMethod!"/editMessageMedia";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message to edit.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// A JSON-serialized object for the new media content of the message
    InputMedia media;
    /// A JSON-serialized object for a new inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit animation, audio, document, live photo, photo, or video messages, or to replace a text or a rich message with a media. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo, a live photo, or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
bool editMessageMedia(BotApi api, EditMessageMediaMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. +/
struct EditMessageLiveLocationMethod
{
    mixin TelegramMethod!"/editMessageLiveLocation";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message to edit.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// Latitude of new location
    double latitude;
    /// Longitude of new location
    double longitude;
    /// New period in seconds during which the location can be updated, starting from the message send date. If 0x7FFFFFFF is specified, then the location can be updated forever. Otherwise, the new value must not exceed the current live_period by more than a day, and the live location expiration date must remain within the next 90 days. If not specified, then live_period remains unchanged.
    @serdeOptional
    Nullable!(long) live_period;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
    /// Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    @serdeOptional
    Nullable!(long) heading;
    /// The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    @serdeOptional
    Nullable!(long) proximity_alert_radius;
    /// A JSON-serialized object for a new inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. +/
bool editMessageLiveLocation(BotApi api, EditMessageLiveLocationMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned. +/
struct StopMessageLiveLocationMethod
{
    mixin TelegramMethod!"/stopMessageLiveLocation";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message with live location to stop.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// A JSON-serialized object for a new inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned. +/
bool stopMessageLiveLocation(BotApi api, StopMessageLiveLocationMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit a checklist on behalf of a connected business account. On success, the edited Message is returned. +/
struct EditMessageChecklistMethod
{
    mixin TelegramMethod!"/editMessageChecklist";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    string business_connection_id;
    /// Unique identifier for the target chat or username of the target bot in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message
    long message_id;
    /// A JSON-serialized object for the new checklist
    InputChecklist checklist;
    /// A JSON-serialized object for the new inline keyboard for the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit a checklist on behalf of a connected business account. On success, the edited Message is returned. +/
Message editMessageChecklist(BotApi api, EditMessageChecklistMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
struct EditMessageReplyMarkupMethod
{
    mixin TelegramMethod!"/editMessageReplyMarkup";
    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Required if inline_message_id is not specified. Identifier of the message to edit.
    @serdeOptional
    Nullable!(long) message_id;
    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent. +/
bool editMessageReplyMarkup(BotApi api, EditMessageReplyMarkupMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit an ephemeral text message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
struct EditEphemeralMessageTextMethod
{
    mixin TelegramMethod!"/editEphemeralMessageText";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user who received the message
    long receiver_user_id;
    /// Identifier of the ephemeral message to edit
    long ephemeral_message_id;
    /// New text of the message, 1-4096 characters after entity parsing
    string text;
    /// Mode for parsing entities in the message text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Link preview generation options for the message
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit an ephemeral text message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
bool editEphemeralMessageText(BotApi api, EditEphemeralMessageTextMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit the media of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
struct EditEphemeralMessageMediaMethod
{
    mixin TelegramMethod!"/editEphemeralMessageMedia";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user who received the message
    long receiver_user_id;
    /// Identifier of the ephemeral message to edit
    long ephemeral_message_id;
    /// A JSON-serialized object for the new media content of the message. A new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL.
    InputMedia media;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit the media of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
bool editEphemeralMessageMedia(BotApi api, EditEphemeralMessageMediaMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit the caption of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
struct EditEphemeralMessageCaptionMethod
{
    mixin TelegramMethod!"/editEphemeralMessageCaption";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user who received the message
    long receiver_user_id;
    /// Identifier of the ephemeral message to edit
    long ephemeral_message_id;
    /// New caption of the message, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit the caption of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
bool editEphemeralMessageCaption(BotApi api, EditEphemeralMessageCaptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit only the reply markup of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
struct EditEphemeralMessageReplyMarkupMethod
{
    mixin TelegramMethod!"/editEphemeralMessageReplyMarkup";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user who received the message
    long receiver_user_id;
    /// Identifier of the ephemeral message to edit
    long ephemeral_message_id;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to edit only the reply markup of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned. +/
bool editEphemeralMessageReplyMarkup(BotApi api, EditEphemeralMessageReplyMarkupMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to approve a suggested post in a direct messages chat. The bot must have the 'can_post_messages' administrator right in the corresponding channel chat. Returns True on success. +/
struct ApproveSuggestedPostMethod
{
    mixin TelegramMethod!"/approveSuggestedPost";
    /// Unique identifier for the target direct messages chat
    long chat_id;
    /// Identifier of a suggested post message to approve
    long message_id;
    /// Point in time (Unix timestamp) when the post is expected to be published; omit if the date has already been specified when the suggested post was created. If specified, then the date must be not more than 2678400 seconds (30 days) in the future.
    @serdeOptional
    Nullable!(long) send_date;
}

/++ Use this method to approve a suggested post in a direct messages chat. The bot must have the 'can_post_messages' administrator right in the corresponding channel chat. Returns True on success. +/
bool approveSuggestedPost(BotApi api, ApproveSuggestedPostMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to decline a suggested post in a direct messages chat. The bot must have the 'can_manage_direct_messages' administrator right in the corresponding channel chat. Returns True on success. +/
struct DeclineSuggestedPostMethod
{
    mixin TelegramMethod!"/declineSuggestedPost";
    /// Unique identifier for the target direct messages chat
    long chat_id;
    /// Identifier of a suggested post message to decline
    long message_id;
    /// Comment for the creator of the suggested post; 0-128 characters
    @serdeOptional
    Nullable!(string) comment;
}

/++ Use this method to decline a suggested post in a direct messages chat. The bot must have the 'can_manage_direct_messages' administrator right in the corresponding channel chat. Returns True on success. +/
bool declineSuggestedPost(BotApi api, DeclineSuggestedPostMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Service messages about a supergroup, channel, or forum topic creation can't be deleted.- A dice message in a private chat can only be deleted if it was sent more than 24 hours ago.- Bots can delete outgoing messages in private chats, groups, and supergroups.- Bots can delete incoming messages in private chats.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages administrator right in a supergroup or a channel, it can delete any message there.- If the bot has can_manage_direct_messages administrator right in a channel, it can delete any message in the corresponding direct messages chat.Returns True on success. +/
struct DeleteMessageMethod
{
    mixin TelegramMethod!"/deleteMessage";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Identifier of the message to delete
    long message_id;
}

/++ Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Service messages about a supergroup, channel, or forum topic creation can't be deleted.- A dice message in a private chat can only be deleted if it was sent more than 24 hours ago.- Bots can delete outgoing messages in private chats, groups, and supergroups.- Bots can delete incoming messages in private chats.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages administrator right in a supergroup or a channel, it can delete any message there.- If the bot has can_manage_direct_messages administrator right in a channel, it can delete any message in the corresponding direct messages chat.Returns True on success. +/
bool deleteMessage(BotApi api, DeleteMessageMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete multiple messages simultaneously. If some of the specified messages can't be found, they are skipped. Returns True on success. +/
struct DeleteMessagesMethod
{
    mixin TelegramMethod!"/deleteMessages";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// A JSON-serialized list of 1-100 identifiers of messages to delete. See deleteMessage for limitations on which messages can be deleted.
    long[] message_ids;
}

/++ Use this method to delete multiple messages simultaneously. If some of the specified messages can't be found, they are skipped. Returns True on success. +/
bool deleteMessages(BotApi api, DeleteMessagesMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete an ephemeral message. Note that it is not guaranteed that the user will receive the message deletion event, especially if they are offline. Returns True on success. +/
struct DeleteEphemeralMessageMethod
{
    mixin TelegramMethod!"/deleteEphemeralMessage";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user who received the message
    long receiver_user_id;
    /// Identifier of the ephemeral message to delete
    long ephemeral_message_id;
}

/++ Use this method to delete an ephemeral message. Note that it is not guaranteed that the user will receive the message deletion event, especially if they are offline. Returns True on success. +/
bool deleteEphemeralMessage(BotApi api, DeleteEphemeralMessageMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to remove a reaction from a message in a group or a supergroup chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success. +/
struct DeleteMessageReactionMethod
{
    mixin TelegramMethod!"/deleteMessageReaction";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the target message
    long message_id;
    /// Identifier of the user whose reaction will be removed, if the reaction was added by a user
    @serdeOptional
    Nullable!(long) user_id;
    /// Identifier of the chat whose reaction will be removed, if the reaction was added by a chat
    @serdeOptional
    Nullable!(long) actor_chat_id;
}

/++ Use this method to remove a reaction from a message in a group or a supergroup chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success. +/
bool deleteMessageReaction(BotApi api, DeleteMessageReactionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success. +/
struct DeleteAllMessageReactionsMethod
{
    mixin TelegramMethod!"/deleteAllMessageReactions";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Identifier of the user whose reactions will be removed, if the reactions were added by a user
    @serdeOptional
    Nullable!(long) user_id;
    /// Identifier of the chat whose reactions will be removed, if the reactions were added by a chat
    @serdeOptional
    Nullable!(long) actor_chat_id;
}

/++ Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success. +/
bool deleteAllMessageReactions(BotApi api, DeleteAllMessageReactionsMethod method)
{
    return api.callMethod!(bool)(method);
}
