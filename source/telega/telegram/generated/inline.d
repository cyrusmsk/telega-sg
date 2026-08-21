// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.inline;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;
import telega.telegram.generated.payments;
import telega.telegram.generated.rich;

/++ This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results. +/
struct InlineQuery
{
    /// Unique identifier for this query
    string id;
    /// Sender
    User from;
    /// Text of the query (up to 256 characters)
    string query;
    /// Offset of the results to be returned, can be controlled by the bot
    string offset;
    /// Type of the chat from which the inline query was sent. Can be either “sender” for a private chat with the inline query sender, “private”, “group”, “supergroup”, or “channel”. The chat type should be always known for requests sent from official clients and most third-party clients, unless the request was sent from a secret chat.
    @serdeOptional
    Nullable!(string) chat_type;
    /// Sender location, only for bots that request user location
    @serdeOptional
    Nullable!(Location) location;
}

/++ Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed. +/
struct AnswerInlineQueryMethod
{
    mixin TelegramMethod!"/answerInlineQuery";
    /// Unique identifier for the answered query
    string inline_query_id;
    /// A JSON-serialized Array of results for the inline query
    InlineQueryResult[] results;
    /// The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
    @serdeOptional
    Nullable!(long) cache_time;
    /// Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query.
    @serdeOptional
    Nullable!(bool) is_personal;
    /// Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination. Offset length can't exceed 64 bytes.
    @serdeOptional
    Nullable!(string) next_offset;
    /// A JSON-serialized object describing a button to be shown above inline query results
    @serdeOptional
    Nullable!(InlineQueryResultsButton) button;
}

/++ Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed. +/
bool answerInlineQuery(BotApi api, AnswerInlineQueryMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ This object represents a button to be shown above inline query results. You must use exactly one of the optional fields. +/
struct InlineQueryResultsButton
{
    /// Label text on the button
    string text;
    /// Description of the Web App that will be launched when the user presses the button. The Web App will be able to switch back to the inline mode using the method switchInlineQuery inside the Web App.
    @serdeOptional
    Nullable!(WebAppInfo) web_app;
    /// Deep-linking parameter for the /start message sent to the bot when a user presses the button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a 'Connect your YouTube account' button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an OAuth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
    @serdeOptional
    Nullable!(string) start_parameter;
}

alias InlineQueryResult = JsonableAlgebraicProxy!(InlineQueryResultArticle, InlineQueryResultAudio, InlineQueryResultCachedAudio, InlineQueryResultCachedDocument, InlineQueryResultCachedGif, InlineQueryResultCachedMpeg4Gif, InlineQueryResultCachedPhoto, InlineQueryResultCachedSticker, InlineQueryResultCachedVideo, InlineQueryResultCachedVoice, InlineQueryResultContact, InlineQueryResultDocument, InlineQueryResultGame, InlineQueryResultGif, InlineQueryResultLocation, InlineQueryResultMpeg4Gif, InlineQueryResultPhoto, InlineQueryResultVenue, InlineQueryResultVideo, InlineQueryResultVoice);

/++ Represents a link to an article or web page. +/
struct InlineQueryResultArticle
{
    /// Type of the result, must be article
    string type;
    /// Unique identifier for this result, 1-64 Bytes
    string id;
    /// Title of the result
    string title;
    /// Content of the message to be sent
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// URL of the result
    @serdeOptional
    Nullable!(string) url;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Url of the thumbnail for the result
    @serdeOptional
    Nullable!(string) thumbnail_url;
    /// Thumbnail width
    @serdeOptional
    Nullable!(long) thumbnail_width;
    /// Thumbnail height
    @serdeOptional
    Nullable!(long) thumbnail_height;
}

/++ Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo. +/
struct InlineQueryResultPhoto
{
    /// Type of the result, must be photo
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL of the photo. Photo must be in JPEG format. Photo size must not exceed 5MB.
    string photo_url;
    /// URL of the thumbnail for the photo
    string thumbnail_url;
    /// Width of the photo
    @serdeOptional
    Nullable!(long) photo_width;
    /// Height of the photo
    @serdeOptional
    Nullable!(long) photo_height;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Caption of the photo to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the photo caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the photo
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation. +/
struct InlineQueryResultGif
{
    /// Type of the result, must be gif
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL for the GIF file
    string gif_url;
    /// Width of the GIF
    @serdeOptional
    Nullable!(long) gif_width;
    /// Height of the GIF
    @serdeOptional
    Nullable!(long) gif_height;
    /// Duration of the GIF in seconds
    @serdeOptional
    Nullable!(long) gif_duration;
    /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    string thumbnail_url;
    /// MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”.
    @serdeOptional
    Nullable!(string) thumbnail_mime_type;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the GIF animation
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation. +/
struct InlineQueryResultMpeg4Gif
{
    /// Type of the result, must be mpeg4_gif
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL for the MPEG4 file
    string mpeg4_url;
    /// Video width
    @serdeOptional
    Nullable!(long) mpeg4_width;
    /// Video height
    @serdeOptional
    Nullable!(long) mpeg4_height;
    /// Video duration in seconds
    @serdeOptional
    Nullable!(long) mpeg4_duration;
    /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    string thumbnail_url;
    /// MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”.
    @serdeOptional
    Nullable!(string) thumbnail_mime_type;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the video animation
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++
Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.

If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using input_message_content.
+/
struct InlineQueryResultVideo
{
    /// Type of the result, must be video
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL for the embedded video player or video file
    string video_url;
    /// MIME type of the content of the video URL, “text/html” or “video/mp4”
    string mime_type;
    /// URL of the thumbnail (JPEG only) for the video
    string thumbnail_url;
    /// Title for the result
    string title;
    /// Caption of the video to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the video caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Video width
    @serdeOptional
    Nullable!(long) video_width;
    /// Video height
    @serdeOptional
    Nullable!(long) video_height;
    /// Video duration in seconds
    @serdeOptional
    Nullable!(long) video_duration;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio. +/
struct InlineQueryResultAudio
{
    /// Type of the result, must be audio
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL for the audio file
    string audio_url;
    /// Title
    string title;
    /// Caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Performer
    @serdeOptional
    Nullable!(string) performer;
    /// Audio duration in seconds
    @serdeOptional
    Nullable!(long) audio_duration;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the audio
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message. +/
struct InlineQueryResultVoice
{
    /// Type of the result, must be voice
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid URL for the voice recording
    string voice_url;
    /// Recording title
    string title;
    /// Caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the voice message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Recording duration in seconds
    @serdeOptional
    Nullable!(long) voice_duration;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the voice recording
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method. +/
struct InlineQueryResultDocument
{
    /// Type of the result, must be document
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// Title for the result
    string title;
    /// Caption of the document to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the document caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// A valid URL for the file
    string document_url;
    /// MIME type of the content of the file, either “application/pdf” or “application/zip”
    string mime_type;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the file
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
    /// URL of the thumbnail (JPEG only) for the file
    @serdeOptional
    Nullable!(string) thumbnail_url;
    /// Thumbnail width
    @serdeOptional
    Nullable!(long) thumbnail_width;
    /// Thumbnail height
    @serdeOptional
    Nullable!(long) thumbnail_height;
}

/++ Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location. +/
struct InlineQueryResultLocation
{
    /// Type of the result, must be location
    string type;
    /// Unique identifier for this result, 1-64 Bytes
    string id;
    /// Location latitude in degrees
    double latitude;
    /// Location longitude in degrees
    double longitude;
    /// Location title
    string title;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
    /// Period in seconds during which the location can be updated, must be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely
    @serdeOptional
    Nullable!(long) live_period;
    /// For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    @serdeOptional
    Nullable!(long) heading;
    /// For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    @serdeOptional
    Nullable!(long) proximity_alert_radius;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the location
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
    /// Url of the thumbnail for the result
    @serdeOptional
    Nullable!(string) thumbnail_url;
    /// Thumbnail width
    @serdeOptional
    Nullable!(long) thumbnail_width;
    /// Thumbnail height
    @serdeOptional
    Nullable!(long) thumbnail_height;
}

/++ Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue. +/
struct InlineQueryResultVenue
{
    /// Type of the result, must be venue
    string type;
    /// Unique identifier for this result, 1-64 Bytes
    string id;
    /// Latitude of the venue location in degrees
    double latitude;
    /// Longitude of the venue location in degrees
    double longitude;
    /// Title of the venue
    string title;
    /// Address of the venue
    string address;
    /// Foursquare identifier of the venue if known
    @serdeOptional
    Nullable!(string) foursquare_id;
    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    @serdeOptional
    Nullable!(string) foursquare_type;
    /// Google Places identifier of the venue
    @serdeOptional
    Nullable!(string) google_place_id;
    /// Google Places type of the venue. (See supported types.)
    @serdeOptional
    Nullable!(string) google_place_type;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the venue
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
    /// Url of the thumbnail for the result
    @serdeOptional
    Nullable!(string) thumbnail_url;
    /// Thumbnail width
    @serdeOptional
    Nullable!(long) thumbnail_width;
    /// Thumbnail height
    @serdeOptional
    Nullable!(long) thumbnail_height;
}

/++ Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact. +/
struct InlineQueryResultContact
{
    /// Type of the result, must be contact
    string type;
    /// Unique identifier for this result, 1-64 Bytes
    string id;
    /// Contact's phone number
    string phone_number;
    /// Contact's first name
    string first_name;
    /// Contact's last name
    @serdeOptional
    Nullable!(string) last_name;
    /// Additional data about the contact in the form of a vCard, 0-2048 bytes
    @serdeOptional
    Nullable!(string) vcard;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the contact
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
    /// Url of the thumbnail for the result
    @serdeOptional
    Nullable!(string) thumbnail_url;
    /// Thumbnail width
    @serdeOptional
    Nullable!(long) thumbnail_width;
    /// Thumbnail height
    @serdeOptional
    Nullable!(long) thumbnail_height;
}

/++ Represents a Game. +/
struct InlineQueryResultGame
{
    /// Type of the result, must be game
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// Short name of the game
    string game_short_name;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo. +/
struct InlineQueryResultCachedPhoto
{
    /// Type of the result, must be photo
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier of the photo
    string photo_file_id;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Caption of the photo to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the photo caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the photo
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation. +/
struct InlineQueryResultCachedGif
{
    /// Type of the result, must be gif
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier for the GIF file
    string gif_file_id;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the GIF animation
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation. +/
struct InlineQueryResultCachedMpeg4Gif
{
    /// Type of the result, must be mpeg4_gif
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier for the MPEG4 file
    string mpeg4_file_id;
    /// Title for the result
    @serdeOptional
    Nullable!(string) title;
    /// Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the video animation
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker. +/
struct InlineQueryResultCachedSticker
{
    /// Type of the result, must be sticker
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier of the sticker
    string sticker_file_id;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the sticker
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. +/
struct InlineQueryResultCachedDocument
{
    /// Type of the result, must be document
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// Title for the result
    string title;
    /// A valid file identifier for the file
    string document_file_id;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Caption of the document to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the document caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the file
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video. +/
struct InlineQueryResultCachedVideo
{
    /// Type of the result, must be video
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier for the video file
    string video_file_id;
    /// Title for the result
    string title;
    /// Short description of the result
    @serdeOptional
    Nullable!(string) description;
    /// Caption of the video to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the video caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the video
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message. +/
struct InlineQueryResultCachedVoice
{
    /// Type of the result, must be voice
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier for the voice message
    string voice_file_id;
    /// Voice message title
    string title;
    /// Caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the voice message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the voice message
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

/++ Represents a link to an MP3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio. +/
struct InlineQueryResultCachedAudio
{
    /// Type of the result, must be audio
    string type;
    /// Unique identifier for this result, 1-64 bytes
    string id;
    /// A valid file identifier for the audio file
    string audio_file_id;
    /// Caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Inline keyboard attached to the message
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
    /// Content of the message to be sent instead of the audio
    // TODO(telega-generator): family type 'InputMessageContent' can't be deserialized yet
}

alias InputMessageContent = JsonableAlgebraicProxy!(InputContactMessageContent, InputInvoiceMessageContent, InputLocationMessageContent, InputRichMessageContent, InputTextMessageContent, InputVenueMessageContent);

/++ Represents the content of a text message to be sent as the result of an inline query. +/
struct InputTextMessageContent
{
    /// Text of the message to be sent, 1-4096 characters
    string message_text;
    /// Mode for parsing entities in the message text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in message text, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Link preview generation options for the message
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
}

/++ Represents the content of a rich message to be sent as the result of an inline query. +/
struct InputRichMessageContent
{
    /// The message to be sent
    InputRichMessage rich_message;
}

/++ Represents the content of a location message to be sent as the result of an inline query. +/
struct InputLocationMessageContent
{
    /// Latitude of the location in degrees
    double latitude;
    /// Longitude of the location in degrees
    double longitude;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
    /// Period in seconds during which the location can be updated, must be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely
    @serdeOptional
    Nullable!(long) live_period;
    /// For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    @serdeOptional
    Nullable!(long) heading;
    /// For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    @serdeOptional
    Nullable!(long) proximity_alert_radius;
}

/++ Represents the content of a venue message to be sent as the result of an inline query. +/
struct InputVenueMessageContent
{
    /// Latitude of the venue in degrees
    double latitude;
    /// Longitude of the venue in degrees
    double longitude;
    /// Name of the venue
    string title;
    /// Address of the venue
    string address;
    /// Foursquare identifier of the venue, if known
    @serdeOptional
    Nullable!(string) foursquare_id;
    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    @serdeOptional
    Nullable!(string) foursquare_type;
    /// Google Places identifier of the venue
    @serdeOptional
    Nullable!(string) google_place_id;
    /// Google Places type of the venue. (See supported types.)
    @serdeOptional
    Nullable!(string) google_place_type;
}

/++ Represents the content of a contact message to be sent as the result of an inline query. +/
struct InputContactMessageContent
{
    /// Contact's phone number
    string phone_number;
    /// Contact's first name
    string first_name;
    /// Contact's last name
    @serdeOptional
    Nullable!(string) last_name;
    /// Additional data about the contact in the form of a vCard, 0-2048 bytes
    @serdeOptional
    Nullable!(string) vcard;
}

/++ Represents the content of an invoice message to be sent as the result of an inline query. +/
struct InputInvoiceMessageContent
{
    /// Product name, 1-32 characters
    string title;
    /// Product description, 1-255 characters
    string description;
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    string payload;
    /// Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    @serdeOptional
    Nullable!(string) provider_token;
    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    string currency;
    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    LabeledPrice[] prices;
    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    @serdeOptional
    Nullable!(long) max_tip_amount;
    /// A JSON-serialized Array of suggested amounts of tip in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    @serdeOptional
    Nullable!(long[]) suggested_tip_amounts;
    /// A JSON-serialized object for data about the invoice, which will be shared with the payment provider. A detailed description of the required fields should be provided by the payment provider.
    @serdeOptional
    Nullable!(string) provider_data;
    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    @serdeOptional
    Nullable!(string) photo_url;
    /// Photo size in bytes
    @serdeOptional
    Nullable!(long) photo_size;
    /// Photo width
    @serdeOptional
    Nullable!(long) photo_width;
    /// Photo height
    @serdeOptional
    Nullable!(long) photo_height;
    /// Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_name;
    /// Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_phone_number;
    /// Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_email;
    /// Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_shipping_address;
    /// Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_phone_number_to_provider;
    /// Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_email_to_provider;
    /// Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) is_flexible;
}

/++
Represents a result of an inline query that was chosen by the user and sent to their chat partner.

Note: It is necessary to enable inline feedback via @BotFather in order to receive these objects in updates.
+/
struct ChosenInlineResult
{
    /// The unique identifier for the result that was chosen
    string result_id;
    /// The user that chose the result
    User from;
    /// Sender location, only for bots that require user location
    @serdeOptional
    Nullable!(Location) location;
    /// Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// The query that was used to obtain the result
    string query;
}
