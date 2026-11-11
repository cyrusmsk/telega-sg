import vibe.core.core : runApplication, runTask, disableDefaultSignalHandlers;
import vibe.core.log : setLogLevel, logInfo, logDiagnostic, LogLevel;
import std.process : environment;
import std.exception : enforce;

int main(string[] args)
{
    string botToken = environment.get("BOT_TOKEN");

    if (args.length > 1 && args[1] != null) {
        logInfo("Setting token from first argument");
        botToken = args[1];
    }

    enforce(botToken !is null, "Please provide bot token as a first argument or set BOT_TOKEN env variable");

    setLogLevel(LogLevel.diagnostic);
    listenUpdates(botToken);

    return 0;
}

void listenUpdates(string token)
{
    import telega.botapi : BotApi, ChatId;
    import telega.telegram.generated.webhook : Update, GetUpdatesMethod, getUpdates;
    import telega.telegram.generated.basic :
        SendMessageMethod, sendMessage;
    import std.algorithm.iteration : each;

    auto api = new BotApi(token);

    GetUpdatesMethod gu;
    gu.limit = 100;
    gu.timeout = 30;

    long offset;

    while (true)
    {
        gu.offset = offset;

        getUpdates(api, gu)
            .each!((Update u) {
                // we need all updates with text message
                if (!u.message.isNull && !u.message.get.text.isNull)
                {
                    logInfo("Text from %s: %s", u.message.get.chat.id, u.message.get.text);

                    SendMessageMethod sm;
                    sm.chat_id = ChatId(u.message.get.chat.id);
                    sm.text = u.message.get.text.get;

                    sendMessage(api, sm);
                }
                else
                {
                    logDiagnostic("Update is not a text message, skipping");
                }

                // mark update as processed
                offset = offset > u.update_id + 1 ? offset : u.update_id + 1;
            });
    }
}
