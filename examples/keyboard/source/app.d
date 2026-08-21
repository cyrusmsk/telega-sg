import vibe.core.core;
import vibe.core.log;
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

void listenUpdates(string botToken)
{
    import telega.botapi : BotApi;
    import telega.telegram.generated.webhook :
        Update, GetUpdatesMethod, getUpdates;
    import telega.telegram.generated.basic :
        UpdateType, SendMessageMethod, sendMessage,
        ReplyKeyboardMarkup, KeyboardButton, ReplyKeyboardRemove, ReplyMarkup;

    try {
        auto api = new BotApi(botToken);

        GetUpdatesMethod gu;
        gu.allowed_updates = [UpdateType.Message];

        long offset;

        while (true)
        {
            gu.offset = offset;

            foreach (ref Update update; getUpdates(api, gu))
            {
                if (!update.message.isNull && !update.message.get.text.isNull)
                {
                    SendMessageMethod sm;
                    sm.chat_id = update.message.get.chat.id;
                    sm.text = update.message.get.text.get;

                    logInfo("Text from %s: %s", sm.chat_id, sm.text);

                    if (sm.text == "Remove Keyboard") {
                        sm.reply_markup = ReplyMarkup(ReplyKeyboardRemove());
                    } else {
                        sm.reply_markup = ReplyMarkup(createReplyKeyboardMarkup());
                    }

                    sendMessage(api, sm);
                } else {
                    logDiagnostic("Update is not a text message, skipping");
                }

                offset = offset > update.update_id + 1 ? offset : update.update_id + 1;
            }
        }
    } catch (Exception e) {
        logError(e.toString());

        throw e;
    }
}

auto createReplyKeyboardMarkup()
{
    import telega.telegram.generated.basic : KeyboardButton, ReplyKeyboardMarkup;

    // three rows of buttons
    ReplyKeyboardMarkup markup;
    markup.keyboard = [
        [KeyboardButton("First Button"), KeyboardButton("Second Button")],
        [KeyboardButton("Ask location")],
        [KeyboardButton("Remove Keyboard")]
    ];

    return markup;
}
