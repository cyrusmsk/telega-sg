import vibe.core.log : setLogLevel, logInfo, logWarn, LogLevel;
import std.process : environment;
import std.exception : enforce;

import telega.botapi : BotApi, ChatId;
import telega.telegram.generated.basic :
    AnswerWidgetQueryMethod, SendWidgetMethod, WidgetQuery, WidgetQueryTypeData,
    answerWidgetQuery, sendWidget;
import telega.telegram.generated.updmessages :
    EditMessageWidgetDataMethod, editMessageWidgetData;

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
    import telega.telegram.generated.webhook : Update, GetUpdatesMethod, getUpdates;
    import std.algorithm.iteration : each;

    auto api = new BotApi(token);
    auto votes = new VoteStore;

    GetUpdatesMethod gu;
    gu.limit = 100;
    gu.timeout = 30;

    long offset;

    while (true)
    {
        gu.offset = offset;

        getUpdates(api, gu)
            .each!((Update update) {
                if (!update.widget_query.isNull) {
                    handleWidgetQuery(api, votes, update.widget_query.get);
                } else if (!update.message.isNull && !update.message.get.text.isNull) {
                    auto text = update.message.get.text.get;

                    if (text == "/start" || text == "/widget") {
                        sendVoteWidget(api, update.message.get.chat.id);
                    }
                } else {
                    logInfo("Skipping update %s", update.update_id);
                }

                offset = offset > update.update_id + 1 ? offset : update.update_id + 1;
            });
    }
}

void sendVoteWidget(BotApi api, long chatId)
{
    SendWidgetMethod method;
    method.chat_id = ChatId(chatId);
    method.html = voteWidgetHtml;
    method.caption = "Which language should we use? Tap an option to vote.";
    method.allow_queries = true;
    method.chat_data = stateJson([0, 0, 0]);

    auto message = sendWidget(api, method);

    logInfo("Sent vote widget %s to %s", message.message_id, chatId);
}

void handleWidgetQuery(BotApi api, VoteStore votes, WidgetQuery query)
{
    import std.conv : to;
    import std.string : startsWith;

    logInfo("Widget query from %s: %s", query.from.id, query.data);

    string answer;

    if (!query.type.holds!WidgetQueryTypeData) {
        answer = `{"error":"only data queries are supported by this example"}`;
    } else if (query.data.startsWith("vote:")) {
        int choice = -1;

        try {
            choice = to!int(query.data["vote:".length .. $]);
        } catch (Exception e) {
            logWarn("Invalid vote payload: %s", query.data);
        }

        if (choice < 0 || choice > 2) {
            answer = `{"error":"invalid choice"}`;
        } else if (!query.chat.isNull && !query.message_id.isNull) {
            auto key = messageKey(query.chat.get.id, query.message_id.get);
            answer = stateJson(votes.addVote(key, choice));

            editWidgetData(api, query, answer);
        } else {
            answer = `{"error":"only widgets in chats are supported by this example"}`;
        }
    } else {
        answer = `{"error":"unknown request"}`;
    }

    AnswerWidgetQueryMethod reply;
    reply.widget_query_id = query.id;
    reply.data = answer;

    answerWidgetQuery(api, reply);
}

void editWidgetData(BotApi api, WidgetQuery query, string chatData)
{
    try {
        EditMessageWidgetDataMethod edit;
        edit.chat_id = ChatId(query.chat.get.id);
        edit.message_id = query.message_id.get;
        edit.chat_data = chatData;

        editMessageWidgetData(api, edit);
    } catch (Exception e) {
        logWarn("Could not update widget state: %s", e.msg);
    }
}

string messageKey(long chatId, long messageId)
{
    import std.format : format;

    return format("%s:%s", chatId, messageId);
}

string stateJson(int[] counts)
{
    import std.format : format;

    int total;
    foreach (count; counts) {
        total += count;
    }

    return format(
        `{"votes":[%d,%d,%d],"total":%d}`,
        counts[0], counts[1], counts[2], total);
}

class VoteStore
{
    private int[][string] counts;

    int[] get(string key)
    {
        if (auto p = key in counts) {
            return (*p).dup;
        }

        return [0, 0, 0];
    }

    int[] addVote(string key, int choice)
    {
        auto p = key in counts;

        if (p is null) {
            counts[key] = [0, 0, 0];
            p = key in counts;
        }

        (*p)[choice]++;
        return (*p).dup;
    }
}

enum string voteWidgetHtml = q"WIDGET
<style>
body{margin:0;padding:12px 14px}
.opt{display:block;width:100%;margin:6px 0;text-align:left}
.row{display:flex;justify-content:space-between;align-items:center}
.votes{color:var(--tg-theme-hint-color);font-size:13px}
.bar{height:5px;margin-top:4px;border-radius:3px;background:var(--tg-theme-button-color);transition:width .2s}
.hint{color:var(--tg-theme-hint-color);font-size:13px;min-height:1.4em}
</style>
<div id="list"></div>
<div class="hint" id="msg"></div>
<script>
const TW = window.TelegramWidget;
const NAMES = ['D', 'Rust', 'Zig'];
let counts = [0, 0, 0];
const $ = (id) => document.getElementById(id);

function readState() {
  try {
    const state = JSON.parse(TW && TW.chatData ? TW.chatData : '{}');
    if (Array.isArray(state.votes) && state.votes.length === NAMES.length) {
      counts = state.votes;
    }
  } catch (e) {}
}

function render() {
  const total = counts.reduce((a, b) => a + b, 0) || 1;

  $('list').replaceChildren(...NAMES.map((name, index) => {
    const pct = Math.round(counts[index] / total * 100);
    const button = document.createElement('button');
    button.className = 'opt';
    button.innerHTML =
      '<span class="row"><span>' + name + '</span>' +
      '<span class="votes">' + counts[index] + ' · ' + pct + '%</span></span>' +
      '<div class="bar" style="width:' + pct + '%"></div>';
    button.onclick = () => vote(index);
    return button;
  }));
}

function vote(index) {
  if (!TW) return;

  $('msg').textContent = 'Sending...';
  TW.request('vote:' + index).then((answer) => {
    try {
      const state = JSON.parse(answer.result || '{}');
      if (Array.isArray(state.votes)) counts = state.votes;
    } catch (e) {}
    $('msg').textContent = '';
    render();
  }, (error) => {
    $('msg').textContent =
      error.code === 'NOT_ALLOWED' ? 'Open the original widget to vote' : 'Not sent: ' + error.code;
  });
}

if (TW) {
  TW.onEvent('chatDataChanged', () => {
    readState();
    render();
  });
}

readState();
render();
</script>
WIDGET";
