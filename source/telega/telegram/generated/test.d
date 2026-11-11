module telega.telegram.generated.test;

version (unittest)
{
    import telega.test : assertEquals;
    import telega.serialization : serializeToJsonString;
    import asdf.serialization : deserialize;
    import std.algorithm.searching : canFind, startsWith;
}

/// Replied message is accessible through the recursive Ref field
unittest
{
    import telega.telegram.generated.basic : Message;

    auto message = deserialize!Message(`{
        "message_id": 10,
        "date": 1700000000,
        "chat": {"id": 55, "type": "private", "first_name": "Cyrus"},
        "text": "the reply",
        "reply_to_message": {
            "message_id": 9,
            "date": 1699999900,
            "chat": {"id": 55, "type": "private", "first_name": "Cyrus"},
            "text": "the original"
        }
    }`);

    message.reply_to_message.isNull
        .assertEquals(false);
    message.reply_to_message.get().message_id
        .assertEquals(9L);
    message.reply_to_message.get().text.get()
        .assertEquals("the original");
    // nested recursion keeps working
    message.reply_to_message.get().reply_to_message.isNull
        .assertEquals(true);
}

/// Round-trip through JSON preserves the referenced object
unittest
{
    import telega.telegram.generated.basic : Message;

    auto message = deserialize!Message(`{"message_id":1,"date":2,
        "chat":{"id":3,"type":"supergroup"},"text":"hi",
        "reply_to_message":{"message_id":7,"date":8,
            "chat":{"id":3,"type":"supergroup"},"text":"orig"}}`);

    message.serializeToJsonString
        .assertEquals(`{"message_id":1,"date":2,"chat":{"id":3,"type":"supergroup"},"reply_to_message":{"message_id":7,"date":8,"chat":{"id":3,"type":"supergroup"},"text":"orig"},"text":"hi"}`);
}

/// Chat pinned message access stays intact
unittest
{
    import telega.telegram.generated.basic : ChatFullInfo;

    auto chat = deserialize!ChatFullInfo(`{
        "id": -100123,
        "accent_color_id": 3,
        "max_reaction_count": 100,
        "accepted_gift_types": {"unlimited_gifts": true, "limited_gifts": true,
            "unique_gifts": true, "gifts_from_channels": true, "premium_subscription": true},
        "type": "channel",
        "title": "news",
        "pinned_message": {"message_id": 5, "date": 6,
            "chat": {"id": -100123, "type": "channel", "title": "news"}, "text": "pinned"}
    }`);

    chat.pinned_message.get().text.get()
        .assertEquals("pinned");
}

/// Methods carrying InputFile switch callMethod to multipart transport
unittest
{
    import telega.botapi : InputFile, buildMultipartBody;
    import telega.telegram.generated.stickers : UploadStickerFileMethod;
    import telega.telegram.generated.webhook : SetWebhookMethod;

    UploadStickerFileMethod stickerUpload;
    stickerUpload.user_id = 42;
    stickerUpload.sticker = InputFile("cat.webp", cast(const(ubyte)[])"webp-bytes");
    stickerUpload.sticker_format = "static";

    string contentType;
    const(ubyte)[] body;

    buildMultipartBody(stickerUpload, contentType, body);

    contentType.startsWith("multipart/form-data; boundary=")
        .assertEquals(true);

    string text = cast(string) body;

    text.canFind(`name="user_id"`)
        .assertEquals(true);
    text.canFind("42")
        .assertEquals(true);
    text.canFind(`name="sticker"; filename="cat.webp"`)
        .assertEquals(true);
    text.canFind("webp-bytes")
        .assertEquals(true);

    // Nullable InputFile that was not set is omitted entirely
    SetWebhookMethod webhook;
    webhook.url = "https://example.com/hook";

    buildMultipartBody(webhook, contentType, body);
    text = cast(string) body;

    text.canFind(`name="url"`)
        .assertEquals(true);
    text.canFind(`name="certificate"`)
        .assertEquals(false);
}

/// Methods documented as 'InputFile or String' accept uploads through FileToSend
unittest
{
    import telega.botapi : BotApi, ChatId, FileToSend, InputFile, buildMultipartBody, carriesUpload;
    import telega.telegram.generated.basic : SendPhotoMethod;

    // raw upload: photo becomes a multipart binary part
    SendPhotoMethod upload;
    upload.chat_id = ChatId("@chatname");
    upload.photo = InputFile("cat.png", cast(const(ubyte)[])"png-bytes");
    upload.caption = "meow";

    carriesUpload(upload)
        .assertEquals(true);

    string contentType;
    const(ubyte)[] body;

    buildMultipartBody(upload, contentType, body);

    string text = cast(string) body;

    text.canFind(`name="chat_id"`)
        .assertEquals(true);
    text.canFind(`"@chatname"`)
        .assertEquals(true);
    text.canFind(`name="photo"; filename="cat.png"`)
        .assertEquals(true);
    text.canFind("\r\n\r\npng-bytes\r\n")
        .assertEquals(true);
    text.canFind(`name="caption"`)
        .assertEquals(true);

    // file_id / HTTP URL: stays a regular form field, no binary part
    SendPhotoMethod byUrl;
    byUrl.chat_id = ChatId("@chatname");
    byUrl.photo = FileToSend("https://example.com/cat.png");

    byUrl.serializeToJsonString
        .assertEquals(`{"chat_id":"@chatname","photo":"https://example.com/cat.png"}`);

    carriesUpload(byUrl)
        .assertEquals(false);

    buildMultipartBody(byUrl, contentType, body);
    text = cast(string) body;

    text.canFind(`name="photo"`)
        .assertEquals(true);
    text.canFind(`"https://example.com/cat.png"`)
        .assertEquals(true);
    text.canFind(`filename=`)
        .assertEquals(false);
}

/// Widget queries arrive through the update and expose the request data
unittest
{
    import telega.telegram.generated.basic : WidgetQueryTypeData;
    import telega.telegram.generated.webhook : Update;

    auto update = deserialize!Update(`{
        "update_id": 100000001,
        "widget_query": {
            "id": "8123456789012345678",
            "from": {"id": 111111111, "is_bot": false, "first_name": "Alice"},
            "chat": {"id": 111111111, "type": "private", "first_name": "Alice"},
            "message_id": 4242,
            "chat_instance": "901234567890123456",
            "type": {"type": "data"},
            "data": "vote:2"
        }
    }`);

    update.widget_query.isNull
        .assertEquals(false);

    auto query = update.widget_query.get;

    query.id.assertEquals("8123456789012345678");
    query.data.assertEquals("vote:2");
    query.type.holds!WidgetQueryTypeData.assertEquals(true);
    query.type.get!WidgetQueryTypeData.type.assertEquals("data");
    query.message_id.get.assertEquals(4242L);
    query.chat.get.id.assertEquals(111111111L);
}

/// Discriminated union fields are deserialized into the right member
unittest
{
    import telega.telegram.generated.basic :
        ReactionType, ReactionTypeCustomEmoji, ReactionTypeEmoji, ReactionTypePaid;

    auto emoji = deserialize!ReactionType(`{"type":"emoji","emoji":"👍"}`);

    emoji.holds!ReactionTypeEmoji
        .assertEquals(true);
    emoji.get!ReactionTypeEmoji.emoji
        .assertEquals("👍");

    auto custom = deserialize!ReactionType(`{"type":"custom_emoji","custom_emoji_id":"42"}`);

    custom.holds!ReactionTypeCustomEmoji
        .assertEquals(true);
    custom.get!ReactionTypeCustomEmoji.custom_emoji_id
        .assertEquals("42");

    auto paid = deserialize!ReactionType(`{"type":"paid"}`);

    paid.holds!ReactionTypePaid
        .assertEquals(true);
}

/// Structurally discriminated unions pick the member matching the JSON keys
unittest
{
    import telega.telegram.generated.basic :
        InaccessibleMessage, MaybeInaccessibleMessage, Message;

    auto inaccessible = deserialize!MaybeInaccessibleMessage(
        `{"chat":{"id":1,"type":"private"},"message_id":5,"date":0}`);

    inaccessible.holds!InaccessibleMessage
        .assertEquals(true);
    inaccessible.get!InaccessibleMessage.message_id
        .assertEquals(5L);

    auto regular = deserialize!MaybeInaccessibleMessage(`{
        "message_id": 7,
        "date": 1700000000,
        "chat": {"id": 1, "type": "private"},
        "text": "hello"
    }`);

    regular.holds!Message
        .assertEquals(true);
    regular.get!Message.text.get()
        .assertEquals("hello");
}

/// Input message content has no discriminator and is matched structurally
unittest
{
    import telega.telegram.generated.inline :
        InputLocationMessageContent, InputMessageContent, InputTextMessageContent;

    auto text = deserialize!InputMessageContent(`{"message_text":"hello"}`);

    text.holds!InputTextMessageContent
        .assertEquals(true);
    text.get!InputTextMessageContent.message_text
        .assertEquals("hello");

    auto location = deserialize!InputMessageContent(`{"latitude":1.5,"longitude":2.5}`);

    location.holds!InputLocationMessageContent
        .assertEquals(true);
    location.get!InputLocationMessageContent.latitude
        .assertEquals(1.5);
}

/// Members sharing a discriminator value are disambiguated by required fields
unittest
{
    import telega.telegram.generated.inline :
        InlineQueryResult, InlineQueryResultAudio, InlineQueryResultCachedAudio;

    auto audio = deserialize!InlineQueryResult(
        `{"type":"audio","id":"1","audio_url":"https://example.com/a.mp3","title":"A"}`);

    audio.holds!InlineQueryResultAudio
        .assertEquals(true);

    auto cached = deserialize!InlineQueryResult(
        `{"type":"audio","id":"1","audio_file_id":"file-id"}`);

    cached.holds!InlineQueryResultCachedAudio
        .assertEquals(true);
}

/// Request-side unions use their documented "must be" discriminator
unittest
{
    import telega.telegram.generated.basic : InputMedia, InputMediaPhoto;

    auto photo = deserialize!InputMedia(`{"type":"photo","media":"file-id"}`);

    photo.holds!InputMediaPhoto
        .assertEquals(true);
    photo.get!InputMediaPhoto.media
        .assertEquals("file-id");
}
