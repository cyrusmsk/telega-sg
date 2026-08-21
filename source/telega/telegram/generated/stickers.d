// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.stickers;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;

/++ This object represents a sticker. +/
struct Sticker
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”. The type of the sticker is independent from its format, which is determined by the fields is_animated and is_video.
    string type;
    /// Sticker width
    long width;
    /// Sticker height
    long height;
    /// True, if the sticker is animated
    bool is_animated;
    /// True, if the sticker is a video sticker
    bool is_video;
    /// Sticker thumbnail in the .WEBP or .JPG format
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
    /// Emoji associated with the sticker
    @serdeOptional
    Nullable!(string) emoji;
    /// Name of the sticker set to which the sticker belongs
    @serdeOptional
    Nullable!(string) set_name;
    /// For premium regular stickers, premium animation for the sticker
    @serdeOptional
    Nullable!(File) premium_animation;
    /// For mask stickers, the position where the mask should be placed
    @serdeOptional
    Nullable!(MaskPosition) mask_position;
    /// For custom emoji stickers, unique identifier of the custom emoji
    @serdeOptional
    Nullable!(string) custom_emoji_id;
    /// True, if the sticker must be repainted to a text color in messages, the color of the Telegram Premium badge in emoji status, white color on chat photos, or another appropriate color in other places
    @serdeOptional
    Nullable!(bool) needs_repainting;
    /// File size in bytes
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a sticker set. +/
struct StickerSet
{
    /// Sticker set name
    string name;
    /// Sticker set title
    string title;
    /// Type of stickers in the set, currently one of “regular”, “mask”, “custom_emoji”
    string sticker_type;
    /// List of all set stickers
    Sticker[] stickers;
    /// Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
}

/++ This object describes the position on faces where a mask should be placed by default. +/
struct MaskPosition
{
    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    string point;
    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    double x_shift;
    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    double y_shift;
    /// Mask scaling coefficient. For example, 2.0 means double size.
    double scale;
}

/++ This object describes a sticker to be added to a sticker set. +/
struct InputSticker
{
    /// The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new file using multipart/form-data under <file_attach_name> name. Animated and video stickers can't be uploaded via HTTP URL. More information on Sending Files »
    string sticker;
    /// Format of the added sticker, must be one of “static” for a .WEBP or .PNG image, “animated” for a .TGS animation, “video” for a .WEBM video
    string format;
    /// List of 1-20 emoji associated with the sticker
    string[] emoji_list;
    /// Position where the mask should be placed on faces. For “mask” stickers only.
    @serdeOptional
    Nullable!(MaskPosition) mask_position;
    /// List of 0-20 search keywords for the sticker with total length of up to 64 characters. For “regular” and “custom_emoji” stickers only.
    @serdeOptional
    Nullable!(string[]) keywords;
}

/++ Use this method to send static .WEBP, animated .TGS, or video .WEBM stickers. On success, the sent Message is returned. +/
struct SendStickerMethod
{
    mixin TelegramMethod!"/sendSticker";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .WEBP sticker from the Internet, or upload a new .WEBP, .TGS, or .WEBM sticker using multipart/form-data. More information on Sending Files ». Video and animated stickers can't be sent via an HTTP URL.
    string sticker;
    /// Emoji associated with the sticker; only for just uploaded stickers
    @serdeOptional
    Nullable!(string) emoji;
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
    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    @serdeOptional
    Nullable!(SuggestedPostParameters) suggested_post_parameters;
    /// Description of the message to reply to
    @serdeOptional
    Nullable!(ReplyParameters) reply_parameters;
    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    @serdeOptional
    Nullable!(ReplyMarkup) reply_markup;
}

/++ Use this method to send static .WEBP, animated .TGS, or video .WEBM stickers. On success, the sent Message is returned. +/
Message sendSticker(BotApi api, SendStickerMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to get a sticker set. On success, a StickerSet object is returned. +/
struct GetStickerSetMethod
{
    mixin TelegramMethod!"/getStickerSet";
    /// Name of the sticker set
    string name;
}

/++ Use this method to get a sticker set. On success, a StickerSet object is returned. +/
StickerSet getStickerSet(BotApi api, GetStickerSetMethod method)
{
    return api.callMethod!(StickerSet)(method);
}

/++ Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects. +/
struct GetCustomEmojiStickersMethod
{
    mixin TelegramMethod!"/getCustomEmojiStickers";
    /// A JSON-serialized list of custom emoji identifiers. At most 200 custom emoji identifiers can be specified.
    string[] custom_emoji_ids;
}

/++ Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects. +/
Sticker[] getCustomEmojiStickers(BotApi api, GetCustomEmojiStickersMethod method)
{
    return api.callMethod!(Sticker[])(method);
}

/++ Use this method to upload a file with a sticker for later use in the createNewStickerSet, addStickerToSet, or replaceStickerInSet methods (the file can be used multiple times). Returns the uploaded File on success. +/
struct UploadStickerFileMethod
{
    mixin TelegramMethod!"/uploadStickerFile";
    /// User identifier of sticker file owner
    long user_id;
    /// A file with the sticker in .WEBP, .PNG, .TGS, or .WEBM format. See https://core.telegram.org/stickers for technical requirements. More information on Sending Files »
    InputFile sticker;
    /// Format of the sticker, must be one of “static”, “animated”, “video”
    string sticker_format;
}

/++ Use this method to upload a file with a sticker for later use in the createNewStickerSet, addStickerToSet, or replaceStickerInSet methods (the file can be used multiple times). Returns the uploaded File on success. +/
File uploadStickerFile(BotApi api, UploadStickerFileMethod method)
{
    return api.callMethod!(File)(method);
}

/++ Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success. +/
struct CreateNewStickerSetMethod
{
    mixin TelegramMethod!"/createNewStickerSet";
    /// User identifier of created sticker set owner
    long user_id;
    /// Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in "_by_<bot_username>". <bot_username> is case insensitive. 1-64 characters.
    string name;
    /// Sticker set title, 1-64 characters
    string title;
    /// A JSON-serialized list of 1-50 initial stickers to be added to the sticker set
    InputSticker[] stickers;
    /// Type of stickers in the set, pass “regular”, “mask”, or “custom_emoji”. By default, a regular sticker set is created.
    @serdeOptional
    Nullable!(string) sticker_type;
    /// Pass True if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context; for custom emoji sticker sets only
    @serdeOptional
    Nullable!(bool) needs_repainting;
}

/++ Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success. +/
bool createNewStickerSet(BotApi api, CreateNewStickerSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to add a new sticker to a set created by the bot. Emoji sticker sets can have up to 200 stickers. Other sticker sets can have up to 120 stickers. Returns True on success. +/
struct AddStickerToSetMethod
{
    mixin TelegramMethod!"/addStickerToSet";
    /// User identifier of sticker set owner
    long user_id;
    /// Sticker set name
    string name;
    /// A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set isn't changed.
    InputSticker sticker;
}

/++ Use this method to add a new sticker to a set created by the bot. Emoji sticker sets can have up to 200 stickers. Other sticker sets can have up to 120 stickers. Returns True on success. +/
bool addStickerToSet(BotApi api, AddStickerToSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success. +/
struct SetStickerPositionInSetMethod
{
    mixin TelegramMethod!"/setStickerPositionInSet";
    /// File identifier of the sticker
    string sticker;
    /// New sticker position in the set, zero-based
    long position;
}

/++ Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success. +/
bool setStickerPositionInSet(BotApi api, SetStickerPositionInSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a sticker from a set created by the bot. Returns True on success. +/
struct DeleteStickerFromSetMethod
{
    mixin TelegramMethod!"/deleteStickerFromSet";
    /// File identifier of the sticker
    string sticker;
}

/++ Use this method to delete a sticker from a set created by the bot. Returns True on success. +/
bool deleteStickerFromSet(BotApi api, DeleteStickerFromSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to replace an existing sticker in a sticker set with a new one. The method is equivalent to calling deleteStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns True on success. +/
struct ReplaceStickerInSetMethod
{
    mixin TelegramMethod!"/replaceStickerInSet";
    /// User identifier of the sticker set owner
    long user_id;
    /// Sticker set name
    string name;
    /// File identifier of the replaced sticker
    string old_sticker;
    /// A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set remains unchanged.
    InputSticker sticker;
}

/++ Use this method to replace an existing sticker in a sticker set with a new one. The method is equivalent to calling deleteStickerFromSet, then addStickerToSet, then setStickerPositionInSet. Returns True on success. +/
bool replaceStickerInSet(BotApi api, ReplaceStickerInSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success. +/
struct SetStickerEmojiListMethod
{
    mixin TelegramMethod!"/setStickerEmojiList";
    /// File identifier of the sticker
    string sticker;
    /// A JSON-serialized list of 1-20 emoji associated with the sticker
    string[] emoji_list;
}

/++ Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success. +/
bool setStickerEmojiList(BotApi api, SetStickerEmojiListMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success. +/
struct SetStickerKeywordsMethod
{
    mixin TelegramMethod!"/setStickerKeywords";
    /// File identifier of the sticker
    string sticker;
    /// A JSON-serialized list of 0-20 search keywords for the sticker with total length of up to 64 characters
    @serdeOptional
    Nullable!(string[]) keywords;
}

/++ Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success. +/
bool setStickerKeywords(BotApi api, SetStickerKeywordsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success. +/
struct SetStickerMaskPositionMethod
{
    mixin TelegramMethod!"/setStickerMaskPosition";
    /// File identifier of the sticker
    string sticker;
    /// A JSON-serialized object with the position where the mask should be placed on faces. Omit the parameter to remove the mask position.
    @serdeOptional
    Nullable!(MaskPosition) mask_position;
}

/++ Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success. +/
bool setStickerMaskPosition(BotApi api, SetStickerMaskPositionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set the title of a created sticker set. Returns True on success. +/
struct SetStickerSetTitleMethod
{
    mixin TelegramMethod!"/setStickerSetTitle";
    /// Sticker set name
    string name;
    /// Sticker set title, 1-64 characters
    string title;
}

/++ Use this method to set the title of a created sticker set. Returns True on success. +/
bool setStickerSetTitle(BotApi api, SetStickerSetTitleMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success. +/
struct SetStickerSetThumbnailMethod
{
    mixin TelegramMethod!"/setStickerSetThumbnail";
    /// Sticker set name
    string name;
    /// User identifier of the sticker set owner
    long user_id;
    /// A .WEBP or .PNG image with the thumbnail, must be up to 128 kilobytes in size and have a width and height of exactly 100px, or a .TGS animation with a thumbnail up to 32 kilobytes in size (see https://core.telegram.org/stickers#animation-requirements for animated sticker technical requirements), or a .WEBM video with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#video-requirements for video sticker technical requirements. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files ». Animated and video sticker set thumbnails can't be uploaded via HTTP URL. If omitted, then the thumbnail is dropped and the first sticker is used as the thumbnail.
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Format of the thumbnail, must be one of “static” for a .WEBP or .PNG image, “animated” for a .TGS animation, or “video” for a .WEBM video
    string format;
}

/++ Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success. +/
bool setStickerSetThumbnail(BotApi api, SetStickerSetThumbnailMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success. +/
struct SetCustomEmojiStickerSetThumbnailMethod
{
    mixin TelegramMethod!"/setCustomEmojiStickerSetThumbnail";
    /// Sticker set name
    string name;
    /// Custom emoji identifier of a sticker from the sticker set; pass an empty string to drop the thumbnail and use the first sticker as the thumbnail
    @serdeOptional
    Nullable!(string) custom_emoji_id;
}

/++ Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success. +/
bool setCustomEmojiStickerSetThumbnail(BotApi api, SetCustomEmojiStickerSetThumbnailMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a sticker set that was created by the bot. Returns True on success. +/
struct DeleteStickerSetMethod
{
    mixin TelegramMethod!"/deleteStickerSet";
    /// Sticker set name
    string name;
}

/++ Use this method to delete a sticker set that was created by the bot. Returns True on success. +/
bool deleteStickerSet(BotApi api, DeleteStickerSetMethod method)
{
    return api.callMethod!(bool)(method);
}
