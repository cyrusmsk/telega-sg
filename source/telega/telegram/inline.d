module telega.telegram.inline;

import std.typecons : Nullable;
import std.meta : AliasSeq;
import telega.botapi : BotApi, TelegramMethod, HTTPMethod;
import telega.telegram.basic : ParseMode, InlineKeyboardMarkup, InputMessageContent, User, Location;
import telega.serialization : JsonableAlgebraicProxy;
import asdf.serialization : serdeOptional;

struct InlineQuery
{
    string id;
    User from;
    @serdeOptional
    Nullable!Location location;
    string query;
    string offset;
}

alias InlineQueryResultStructs = AliasSeq!(
    InlineQueryResultArticle, InlineQueryResultPhoto, InlineQueryResultGif, InlineQueryResultMpeg4Gif,
    InlineQueryResultVideo, InlineQueryResultAudio, InlineQueryResultVoice, InlineQueryResultDocument,
    InlineQueryResultLocation, InlineQueryResultVenue, InlineQueryResultContact, InlineQueryResultGame,
    InlineQueryResultCachedPhoto, InlineQueryResultCachedGif, InlineQueryResultCachedMpeg4Gif,
    InlineQueryResultCachedSticker, InlineQueryResultCachedDocument, InlineQueryResultCachedVideo,
    InlineQueryResultCachedVoice, InlineQueryResultCachedAudio
);

alias InlineQueryResult = JsonableAlgebraicProxy!InlineQueryResultStructs;

mixin template InlineQueryFields()
{
    @serdeOptional
    Nullable!InlineKeyboardMarkup reply_markup;
    @serdeOptional
    Nullable!InputMessageContent  input_message_content;
}

struct InlineQueryResultArticle
{
    string type = "article";
    string id;
    string title;
    @serdeOptional
    Nullable!string url;
    @serdeOptional
    Nullable!bool hide_url;
    @serdeOptional
    Nullable!string description;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!uint thumb_width;
    @serdeOptional
    Nullable!uint thumb_height;

    @serdeOptional
    Nullable!InlineKeyboardMarkup reply_markup;
    InputMessageContent  input_message_content; // can't be nullable
}

struct InlineQueryResultPhoto
{
    string type = "photo";
    string id;
    string photo_url;
    string thumb_url;
    @serdeOptional
    Nullable!uint photo_width;
    @serdeOptional
    Nullable!uint photo_height;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string description;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultGif
{
    string type = "gif";
    string id;
    string gif_url;
    @serdeOptional
    Nullable!uint gif_width;
    @serdeOptional
    Nullable!uint gif_height;
    @serdeOptional
    Nullable!uint gif_duration;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultMpeg4Gif
{
    string type ="mpeg4_gif";
    string id;
    string mpeg4_url;
    @serdeOptional
    Nullable!uint mpeg4_width;
    @serdeOptional
    Nullable!uint mpeg4_height;
    @serdeOptional
    Nullable!uint mpeg4_duration;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultVideo
{
    string type ="video";
    string id;
    string video_url;
    string mime_type;
    string thumb_url;
    string title;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;
    @serdeOptional
    Nullable!uint video_width;
    @serdeOptional
    Nullable!uint video_height;
    @serdeOptional
    Nullable!uint video_duration;
    @serdeOptional
    Nullable!string description;

    mixin InlineQueryFields;
}

struct InlineQueryResultAudio
{
    string    type = "audio";
    string    id;
    string    audio_url;
    string    title;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;
    @serdeOptional
    Nullable!string    performer;
    @serdeOptional
    Nullable!uint      audio_duration;

    mixin InlineQueryFields;
}

struct InlineQueryResultVoice
{
    string    type = "voice";
    string    id;
    string    voice_url;
    string    title;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;
    @serdeOptional
    Nullable!uint      voice_duration;

    mixin InlineQueryFields;
}

struct InlineQueryResultDocument
{
    string    type = "document";
    string    id;
    string    title;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;
    @serdeOptional
    Nullable!string    document_url;
    @serdeOptional
    Nullable!string    mime_type;
    @serdeOptional
    Nullable!string    description;
    @serdeOptional
    Nullable!string    thumb_url;
    @serdeOptional
    Nullable!uint      thumb_width;
    @serdeOptional
    Nullable!uint      thumb_height;

    mixin InlineQueryFields;
}

struct InlineQueryResultLocation
{
    string type = "location";
    string id;
    float latitude;
    float longitude;
    string title;
    @serdeOptional
    Nullable!uint live_period;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!uint thumb_width;
    @serdeOptional
    Nullable!uint thumb_height;

    mixin InlineQueryFields;
}

struct InlineQueryResultVenue
{
    string type = "venue";
    string id;
    float latitude;
    float longitude;
    string title;
    string address;
    @serdeOptional
    Nullable!string foursquare_id;
    @serdeOptional
    Nullable!string foursquare_type;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!uint thumb_width;
    @serdeOptional
    Nullable!uint thumb_height;

    mixin InlineQueryFields;
}

struct InlineQueryResultContact
{
    string type = "contact";
    string id;
    string phone_number;
    string first_name;
    @serdeOptional
    Nullable!string last_name;
    @serdeOptional
    Nullable!string vcard;
    @serdeOptional
    Nullable!string thumb_url;
    @serdeOptional
    Nullable!uint thumb_width;
    @serdeOptional
    Nullable!uint thumb_height;

    mixin InlineQueryFields;
}

struct InlineQueryResultGame
{
    string type = "game";
    string id;
    string game_short_name;
    @serdeOptional
    Nullable!InlineKeyboardMarkup reply_markup;
}


struct InlineQueryResultCachedPhoto
{
    string type = "photo";
    string id;
    string photo_file_id;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string description;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedGif
{
    string type = "gif";
    string id;
    string gif_file_id;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedMpeg4Gif
{
    string type = "mpeg4_gif";
    string id;
    string mpeg4_file_id;
    @serdeOptional
    Nullable!string title;
    @serdeOptional
    Nullable!string caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedSticker
{
    string type = "sticker";
    string id;
    string sticker_file_id;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedDocument
{
    string type = "document";
    string    id;
    string    title;
    string    document_file_id;
    @serdeOptional
    Nullable!string    description;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedVideo
{
    string type = "video";
    string    id;
    string    video_file_id;
    string    title;
    @serdeOptional
    Nullable!string    description;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

struct InlineQueryResultCachedVoice
{
    string type = "voice";
    string    id;
    string    voice_file_id;
    string    title;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}


struct InlineQueryResultCachedAudio
{
    string type = "audio";
    string    id;
    string    audio_file_id;
    @serdeOptional
    Nullable!string    caption;
    @serdeOptional
    Nullable!ParseMode parse_mode;

    mixin InlineQueryFields;
}

// methods

struct AnswerInlineQueryMethod
{
    mixin TelegramMethod!"/answerInlineQuery";

    string              inline_query_id;
    InlineQueryResult[] results;
    uint                cache_time;
    bool                is_personal;
    string              next_offset;
    string              switch_pm_text;
    string              switch_pm_parameter;
}

bool answerInlineQuery(BotApi api, ref AnswerInlineQueryMethod m)
{
    return api.callMethod!bool(m);
}

bool answerInlineQuery(BotApi api, string inlineQueryId, InlineQueryResult[] results)
{
    AnswerInlineQueryMethod m = {
        inline_query_id : inlineQueryId,
        results : results
    };

    return api.answerInlineQuery(m);
}

unittest
{
    import telega.telegram.basic : BotApiMock;

    auto api = new BotApiMock(null);

    InlineQueryResult[] iqr = new InlineQueryResult[20];

    iqr[0] = InlineQueryResultArticle();
    iqr[1] = InlineQueryResultPhoto();
    iqr[2] = InlineQueryResultGif();
    iqr[3] = InlineQueryResultMpeg4Gif();
    iqr[4] = InlineQueryResultVideo();
    iqr[5] = InlineQueryResultAudio();
    iqr[6] = InlineQueryResultVoice();
    iqr[7] = InlineQueryResultDocument();
    iqr[8] = InlineQueryResultLocation();
    iqr[9] = InlineQueryResultVenue();
    iqr[10] = InlineQueryResultContact();
    iqr[11] = InlineQueryResultGame();
    iqr[12] = InlineQueryResultCachedPhoto();
    iqr[13] = InlineQueryResultCachedGif();
    iqr[14] = InlineQueryResultCachedMpeg4Gif();
    iqr[15] = InlineQueryResultCachedSticker();
    iqr[16] = InlineQueryResultCachedDocument();
    iqr[17] = InlineQueryResultCachedVideo();
    iqr[18] = InlineQueryResultCachedVoice();
    iqr[19] = InlineQueryResultCachedAudio();

    api.answerInlineQuery("answer-inline-query", iqr);
}
