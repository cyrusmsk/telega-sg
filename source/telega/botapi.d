module telega.botapi;

import std.array : Appender;

import vibe.core.log;
import asdf : Asdf;
import asdf.serialization : deserialize, serdeProxy, serdeOptional, SerdeException, deserializeScopedString;
import std.typecons : Nullable;
import std.exception : enforce;
import telega.exception : TelegramException;
import std.traits : isSomeString, isIntegral;
import telega.http : HttpClient;
import telega.serialization : serializeToJsonString, JsonableAlgebraicProxy;

version (unittest)
{
    import telega.test : assertEquals;
}

enum HTTPMethod
{
	GET,
	POST
}

@serdeProxy!ChatIdProxy
struct ChatId
{
    import std.conv;

    string id;

    private bool _isString = true;

    alias id this;

    this(long id)
    {
        this.id = id.to!string;
        _isString = false;
    }

    this(string id)
    {
        this.id = id;
    }

    void opAssign(long id)
    {
        this.id = id.to!string;
        _isString = false;
    }

    void opAssign(string id)
    {
        this.id = id;
        _isString = true;
    }

    @property
    bool isString()
    {
        return _isString;
    }

    long opCast(T)()
        if (is(T == long))
    {
        if (_isString) {
            return 0;
        }

        return id.to!long;
    }
}

struct ChatIdProxy
{
    ChatId id;

    this(ChatId id)
    {
        this.id = id;
    }

    ChatId opCast(T : ChatId)()
    {
        return id;
    }

    SerdeException deserializeFromAsdf(Asdf v)
    {
        string id;

        if (auto err = deserializeScopedString(v, id)) {
            return err;
        }
        this.id = ChatId(id);

        return null;
    }
}

/// A file to be uploaded to Telegram via multipart/form-data.
struct InputFile
{
    import asdf.serialization : serdeIgnore;

    /// Name reported to Telegram, shown in the chat and used by the server
    /// to guess the content type
    @serdeIgnore
    string filename = "file";

    /// Raw file contents
    @serdeIgnore
    const(ubyte)[] content;

    this(string filename, const(ubyte)[] content)
    {
        this.filename = filename;
        this.content = content;
    }

    /// True when no file contents were attached
    bool isNull() const pure nothrow @nogc @safe
    {
        return content.length == 0;
    }
}

///
unittest
{
    // fields are transport-only and never leak into JSON bodies
    InputFile file = InputFile("photo.png", cast(const(ubyte)[])"png-bytes");

    serializeToJsonString(file)
        .assertEquals("{}");
}

/++
Method argument documented as "InputFile or String": holds either an
already uploaded file_id, an HTTP URL for Telegram to fetch, or raw
contents wrapped in InputFile (transported as multipart/form-data).
+/
struct FileToSend
{
    private string _reference;
    private InputFile _upload;

    this(string reference)
    {
        this._reference = reference;
    }

    this(InputFile upload)
    {
        this._upload = upload;
    }

    void opAssign(string reference)
    {
        this._reference = reference;
        this._upload = InputFile.init;
    }

    void opAssign(InputFile upload)
    {
        this._reference = null;
        this._upload = upload;
    }

    /// True when the argument is a file_id or an HTTP URL
    bool isString() const pure nothrow @nogc @safe
    {
        return _upload.isNull;
    }

    /// True when the argument carries contents to upload
    bool isUpload() const pure nothrow @nogc @safe
    {
        return !_upload.isNull;
    }

    /// file_id or HTTP URL; only meaningful when isString()
    string stringValue() const pure @nogc @safe
    {
        return _reference;
    }

    /// Upload payload; only meaningful when isUpload()
    InputFile inputValue() const pure @nogc @safe
    {
        return _upload;
    }

    SerdeException deserializeFromAsdf(Asdf v)
    {
        return deserializeScopedString(v, this._reference);
    }

    void serialize(S)(ref S serializer)
    {
        if (isUpload()) {
            throw new SerdeException(
                "telega: FileToSend holding an InputFile can only be sent via multipart transport");
        }

        serializer.putValue(_reference);
    }
}

///
unittest
{
    import std.exception : assertThrown;

    FileToSend url = FileToSend("https://example.com/cat.png");

    url.isString
        .assertEquals(true);
    serializeToJsonString(url)
        .assertEquals(`"https://example.com/cat.png"`);

    // both construction and assignment accept either form
    url = "file-id-42";
    url.isString
        .assertEquals(true);
    url.stringValue
        .assertEquals("file-id-42");

    url = InputFile("cat.png", cast(const(ubyte)[])"png-bytes");
    url.isUpload
        .assertEquals(true);
    url.inputValue.filename
        .assertEquals("cat.png");

    // uploads have no JSON representation; transport must use multipart
    assertThrown!SerdeException(serializeToJsonString(url));
}

///
unittest
{
    import asdf.serialization : deserialize;

    auto arg = deserialize!FileToSend(`"file-id-or-url"`);

    arg.isString
        .assertEquals(true);
    arg.stringValue
        .assertEquals("file-id-or-url");
}


/++
Splits a member type into its element type plus flags telling whether the
element is InputFile, FileToSend, or neither — looking through Nullable
and arrays of either.
+/
template unpackInputFile(S)
{
    import std.typecons : Nullable;

    static if (is(S : Nullable!Inner, Inner)) {
        alias Elem = Inner;
    } else static if (is(S : E[], E)) {
        alias Elem = E;
    } else {
        alias Elem = S;
    }

    enum bool isInputFile = is(Elem == InputFile);
    enum bool isFileToSend = is(Elem == FileToSend);
    enum bool isFileField = isInputFile || isFileToSend;
}

///
unittest
{
    import std.typecons : Nullable;

    unpackInputFile!(Nullable!(InputFile)).isInputFile
        .assertEquals(true);
    unpackInputFile!(InputFile[]).isInputFile
        .assertEquals(true);
    unpackInputFile!(string).isInputFile
        .assertEquals(false);
    unpackInputFile!(Nullable!(long)).isInputFile
        .assertEquals(false);

    unpackInputFile!(Nullable!(FileToSend)).isFileToSend
        .assertEquals(true);
    unpackInputFile!(FileToSend).isFileField
        .assertEquals(true);
    unpackInputFile!(string[]).isFileField
        .assertEquals(false);
}

/// True when the aggregate has at least one member holding an InputFile or a FileToSend
template hasInputFileMember(S)
    if (is(S == struct))
{
    import std.meta : staticIndexOf, staticMap;
    import std.traits : FieldNameTuple;
    template pred(string name)
    {
        enum bool pred = unpackInputFile!(typeof(__traits(getMember, S.init, name))).isFileField;
    }

    enum bool hasInputFileMember = staticIndexOf!(true, staticMap!(pred, FieldNameTuple!S)) >= 0;
}

unittest
{
    import std.typecons : Nullable;

    struct With
    {
        string chat_id;
        Nullable!(InputFile) photo;
    }

    struct Without
    {
        string chat_id;
        long message_id;
    }

    hasInputFileMember!With
        .assertEquals(true);
    hasInputFileMember!Without
        .assertEquals(false);
}

unittest
{
    ChatId chatId;

    chatId = 45;
    chatId.isString()
        .assertEquals(false);

    chatId = "@chat";
    chatId.isString()
        .assertEquals(true);

    string chatIdString = chatId;
    chatIdString
        .assertEquals("@chat");

    long chatIdNum = cast(long)chatId;
    chatIdNum
        .assertEquals(0);

    chatId = 42;

    chatIdNum = cast(long)chatId;
    chatIdNum
        .assertEquals(42);

    string chatIdFunc(ChatId id)
    {
        return id;
    }

    chatIdFunc(cast(ChatId)"abc")
        .assertEquals("abc");
    chatIdFunc(cast(ChatId)45)
        .assertEquals("45");
}

unittest
{
    ChatId c = deserialize!ChatId(`"@chatname"`);

    c.id
        .assertEquals("@chatname");
}


class TelegramBotApiException : TelegramException
{
    /// Telegram bot API code (not to be confused with HTTP codes)
    ushort code;

    this(ushort code, string description, string file = __FILE__, size_t line = __LINE__,
         Throwable next = null) @nogc @safe pure nothrow
    {
        this.code = code;
        super(description, next, file, line);
    }
}

enum isTelegramId(T) = isSomeString!T || isIntegral!T || is(T == ChatId);

mixin template TelegramMethod(string path, HTTPMethod method = HTTPMethod.POST)
{
    import asdf.serialization : serdeIgnore;

    public:
        @serdeIgnore
        immutable string      _path       = path;

        @serdeIgnore
        immutable HTTPMethod  _httpMethod = method;
}

/// UDA for telegram methods
struct Method
{
    string path;
}

/++
Encodes a method struct as a multipart/form-data body for file uploads.

Every other member is sent as a form field holding its JSON
representation (this is what Telegram expects for structured values like
ChatId or InlineKeyboardMarkup); InputFile members become binary parts,
FileToSend members become either a field (file_id / HTTP URL) or a binary
part depending on what they hold.
Null members are skipped, mirroring the JSON request encoding.
+/
package void buildMultipartBody(M)(M method, out string contentType, out const(ubyte)[] body)
    if (is(M == struct))
{
    import std.array : appender;
    import std.traits : FieldNameTuple, hasUDA;
    import std.uuid : randomUUID;
    import asdf.serialization : serdeGetKeysIn, serdeIgnore;

    immutable boundary = "telega-" ~ randomUUID.toString;
    contentType = "multipart/form-data; boundary=" ~ boundary;

    auto out_ = appender!(ubyte[]);

    foreach (memberName; FieldNameTuple!M) {
        static if (hasUDA!(__traits(getMember, M, memberName), serdeIgnore)) {
            continue;
        } else {
            alias MemberType = typeof(__traits(getMember, method, memberName));

            immutable keys = serdeGetKeysIn!(M, memberName);
            immutable wireKey = keys.length ? keys[0] : memberName;

            static if (unpackInputFile!MemberType.isInputFile) {
                foreach (ref file; inputFilesOf!(memberName)(method)) {
                    if (file.isNull) {
                        continue;
                    }
                    formPart(out_, boundary, wireKey, file);
                }
            } else static if (unpackInputFile!MemberType.isFileToSend) {
                foreach (ref arg; fileArgsOf!(memberName)(method)) {
                    if (arg.isUpload) {
                        formPart(out_, boundary, wireKey, arg.inputValue);
                    } else {
                        fieldPart(out_, boundary, wireKey, serializeToJsonString(arg.stringValue));
                    }
                }
            } else {
                auto value = __traits(getMember, method, memberName);

                static if (is(MemberType : Nullable!Inner, Inner)) {
                    if (value.isNull) {
                        continue;
                    }
                }

                fieldPart(out_, boundary, wireKey, serializeToJsonString(value));
            }
        }
    }

    out_ ~= cast(const(ubyte)[]) ("--" ~ boundary ~ "--\r\n");

    body = out_.data;
}

private:

/// Returns the InputFile stored in one member, skipping empty values.
private InputFile[] inputFilesOf(string memberName, M)(ref M method)
{
    import std.typecons : Nullable;

    static if (is(typeof(__traits(getMember, method, memberName)) : Nullable!Inner, Inner)) {
        if (!__traits(getMember, method, memberName).isNull) {
            return [__traits(getMember, method, memberName).get];
        }

        return [];
    } else {
        return [__traits(getMember, method, memberName)];
    }
}

/// Returns the FileToSend stored in one member, skipping empty values.
private FileToSend[] fileArgsOf(string memberName, M)(ref M method)
{
    import std.typecons : Nullable;

    static if (is(typeof(__traits(getMember, method, memberName)) : Nullable!Inner, Inner)) {
        if (!__traits(getMember, method, memberName).isNull) {
            return [__traits(getMember, method, memberName).get];
        }

        return [];
    } else {
        return [__traits(getMember, method, memberName)];
    }
}

/++
True when any member actually carries upload payload at runtime:
a non-empty InputFile or a FileToSend holding one. Members that are
plain (non-nullable) InputFile always count — they have no string
representation to fall back to.
+/
package bool carriesUpload(M)(ref M method)
{
    import std.traits : FieldNameTuple;
    import std.typecons : Nullable;

    foreach (memberName; FieldNameTuple!M) {
        alias MemberType = typeof(__traits(getMember, method, memberName));

        static if (unpackInputFile!MemberType.isInputFile) {
            static if (is(MemberType : Nullable!Inner, Inner)) {
                if (!__traits(getMember, method, memberName).isNull
                        && !__traits(getMember, method, memberName).get.isNull) {
                    return true;
                }
            } else {
                return true;
            }
        } else static if (unpackInputFile!MemberType.isFileToSend) {
            static if (is(MemberType : Nullable!Inner, Inner)) {
                if (!__traits(getMember, method, memberName).isNull
                        && __traits(getMember, method, memberName).get.isUpload) {
                    return true;
                }
            } else {
                if (__traits(getMember, method, memberName).isUpload) {
                    return true;
                }
            }
        }
    }

    return false;
}

private void fieldPart(ref Appender!(ubyte[]) out_, string boundary,
                       string name, string jsonValue)
{
    out_ ~= cast(const(ubyte)[]) ("--" ~ boundary ~ "\r\n"
        ~ "Content-Disposition: form-data; name=\"" ~ name ~ "\"\r\n\r\n"
        ~ jsonValue ~ "\r\n");
}

private void formPart(ref Appender!(ubyte[]) out_, string boundary,
                      string name, InputFile file)
{
    import std.array : Appender;

    out_ ~= cast(const(ubyte)[]) ("--" ~ boundary ~ "\r\n"
        ~ "Content-Disposition: form-data; name=\"" ~ name ~ "\"; filename=\""
        ~ file.filename ~ "\"\r\n"
        ~ "Content-Type: application/octet-stream\r\n\r\n");
    out_ ~= file.content;
    out_ ~= cast(const(ubyte)[]) "\r\n";
}

public:

unittest
{
    import std.algorithm.searching : canFind, startsWith;
    import asdf.serialization : serdeKeys;
    import std.typecons : Nullable;

    struct SetPhotoMethod
    {
        mixin TelegramMethod!"/setChatPhoto";

        ChatId chat_id;
        InputFile photo;
        @serdeKeys("from")
        string from_;
        Nullable!(long) duration;
    }

    SetPhotoMethod m;
    m.chat_id = "@chatname";
    m.photo = InputFile("pic.png", cast(const(ubyte)[])"png-data");
    m.from_ = "42";

    string contentType;
    const(ubyte)[] body;

    buildMultipartBody(m, contentType, body);

    contentType.startsWith("multipart/form-data; boundary=telega-")
        .assertEquals(true);

    string text = cast(string) body;

    text.canFind(`Content-Disposition: form-data; name="chat_id"`)
        .assertEquals(true);
    text.canFind(`"@chatname"`)
        .assertEquals(true);
    text.canFind(`Content-Disposition: form-data; name="from"`)
        .assertEquals(true);
    text.canFind(`Content-Disposition: form-data; name="photo"; filename="pic.png"`)
        .assertEquals(true);
    text.canFind("Content-Type: application/octet-stream\r\n\r\npng-data")
        .assertEquals(true);
    text.canFind("null")
        .assertEquals(false);
}

unittest
{
    struct NoFilesMethod
    {
        mixin TelegramMethod!"/getMe";
    }

    hasInputFileMember!NoFilesMethod
        .assertEquals(false);
}

/******************************************************************/
/*                          Telegram API                          */
/******************************************************************/

enum BaseApiUrl = "https://api.telegram.org/bot";

class BotApi
{
    private:
        string baseUrl;
        string apiUrl;

        ulong requestCounter = 1;

        struct MethodResult(T)
        {
            bool   ok;
            T      result;

            @serdeOptional
            ushort error_code;

            @serdeOptional
            string description;
        }

    protected:
        HttpClient httpClient;

        /// True when a test injected its own transport
        version(unittest) bool httpClientInjected;

    public:
        this(string token, string baseUrl = BaseApiUrl, HttpClient httpClient = null)
        {
            this.baseUrl = baseUrl;
            this.apiUrl = baseUrl ~ token;

            if (httpClient is null) {
                version(TelegaVibedDriver) {
                    import telega.drivers.vibe;

                    httpClient = new VibedHttpClient();
                } else version(TelegaRequestsDriver) {
                    import telega.drivers.requests;

                    httpClient = new RequestsHttpClient();
                } else {
                    assert(false, `No HTTP client is set, maybe you should enable "default" configuration?`);
                }
            } else {
                version(unittest) httpClientInjected = true;
            }
            this.httpClient = httpClient;
        }

        T callMethod(T, M)(M method)
        {
            T result;

            logDebug("[%d] Requesting %s", requestCounter, method._path);

            version(unittest)
            {
                import std.stdio;

                try {
                    serializeToJsonString(method).writeln();
                } catch (Exception e) {
                    // method carries an upload payload: body will be multipart
                    "(multipart body)".writeln();
                }

                // stop here unless a test injected its own HttpClient,
                // so unittests never touch the network
                if (!httpClientInjected) {
                    return result;
                }
            }

            string answer;

            if (method._httpMethod == HTTPMethod.POST) {
                // multipart is required only when some member actually
                // carries upload payload; string-only requests stay JSON
                bool multipart = false;

                static if (hasInputFileMember!M) {
                    multipart = carriesUpload(method);
                }

                if (multipart) {
                    string contentType;
                    const(ubyte)[] body;

                    buildMultipartBody(method, contentType, body);
                    logDebugV("[%d] Sending multipart body (%d bytes)", requestCounter, body.length);

                    answer = httpClient.sendPostRequestRaw(apiUrl ~ method._path, contentType, body);
                } else {
                    string bodyJson = serializeToJsonString(method);
                    logDebugV("[%d] Sending body:\n  %s", requestCounter, bodyJson);

                    answer = httpClient.sendPostRequestJson(apiUrl ~ method._path, bodyJson);
                }
            } else {
                answer = httpClient.sendGetRequest(apiUrl ~ method._path);
            }

            logDebugV("[%d] Data received:\n %s", requestCounter, answer);

            auto json = answer.deserialize!(MethodResult!T);

            enforce(json.ok == true, new TelegramBotApiException(json.error_code, json.description));

            result = json.result;
            requestCounter++;

            return result;
        }
}

version (unittest)
{
    /// Records which transport was used and replies with a canned result
    private class RecordingHttpClient : HttpClient
    {
        string sentJson;
        string sentContentType;
        const(ubyte)[] sentRawBody;

        string sendGetRequest(string url)
        {
            assert(false, "GET is not expected in this test");
        }

        string sendPostRequestJson(string url, string bodyJson)
        {
            this.sentJson = bodyJson;

            return `{"ok":true,"result":true}`;
        }

        string sendPostRequestRaw(string url, string contentType, in ubyte[] body)
        {
            this.sentContentType = contentType;
            this.sentRawBody = cast(const(ubyte)[]) body;

            return `{"ok":true,"result":true}`;
        }
    }
}

/// Methods holding a FileToSend upload switch to multipart transport
unittest
{
    import std.algorithm.searching : canFind, startsWith;

    auto http = new RecordingHttpClient();
    auto api = new BotApi("42:token", BaseApiUrl, http);

    struct SendPhoto
    {
        mixin TelegramMethod!"/sendPhoto";

        ChatId chat_id;
        FileToSend photo;
    }

    SendPhoto m;
    m.chat_id = "@chatname";
    m.photo = InputFile("cat.png", cast(const(ubyte)[])"png-bytes");

    api.callMethod!bool(m);

    http.sentContentType.startsWith("multipart/form-data; boundary=telega-")
        .assertEquals(true);

    string text = cast(string) http.sentRawBody;

    text.canFind(`name="photo"; filename="cat.png"`)
        .assertEquals(true);
    text.canFind("png-bytes")
        .assertEquals(true);
}

/// FileToSend holding a file_id or URL stays on the JSON path
unittest
{
    auto http = new RecordingHttpClient();
    auto api = new BotApi("42:token", BaseApiUrl, http);

    struct SendPhoto
    {
        mixin TelegramMethod!"/sendPhoto";

        ChatId chat_id;
        FileToSend photo;
    }

    SendPhoto m;
    m.chat_id = "@chatname";
    m.photo = "https://example.com/cat.png";

    api.callMethod!bool(m);

    http.sentJson
        .assertEquals(`{"chat_id":"@chatname","photo":"https://example.com/cat.png"}`);
    http.sentContentType
        .assertEquals(null);
}
