import vibe.core.log : setLogLevel, logInfo, LogLevel;
import std.process : environment;
import std.exception : enforce;

int main(string[] args)
{
    string botToken = environment.get("BOT_TOKEN");

    if (args.length > 1 && args[1] != null) {
        logInfo("Setting token from first argument");
        botToken = args[1];
        args = args[1 .. $];
    }

    enforce(botToken !is null, "Please provide bot token as a first argument or set BOT_TOKEN env variable");
    enforce(args.length >= 3,
        "Usage: photosender [BOT_TOKEN] <chat_id> <image file> [caption]");

    setLogLevel(LogLevel.diagnostic);

    uploadPhoto(botToken, args[1], args[2], args.length > 3 ? args[3] : null);

    return 0;
}

void uploadPhoto(string token, string chatId, string filePath, string caption)
{
    import std.array : empty;
    import std.file : read;
    import std.path : baseName;

    import telega.botapi : BotApi, ChatId, InputFile;
    import telega.telegram.generated.basic : SendPhotoMethod, sendPhoto;

    auto api = new BotApi(token);

    SendPhotoMethod m;
    m.chat_id = ChatId(chatId);
    m.photo = InputFile(baseName(filePath), cast(const(ubyte)[]) read(filePath));

    if (!caption.empty) {
        m.caption = caption;
    }

    auto message = sendPhoto(api, m);

    logInfo("Photo uploaded (%s bytes), sent as message %s",
        m.photo.inputValue.content.length, message.message_id);
}
