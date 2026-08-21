module telega.telegram.legacy.poll;

import std.typecons : Nullable;
import telega.botapi : BotApi, TelegramMethod, HTTPMethod, ChatId, isTelegramId;
import telega.telegram.legacy.basic : Message, MessageEntity, User, ReplyMarkup;
import asdf.serialization : serdeOptional, serdeKeys;

enum PollType : string
{
    @serdeKeys("quiz")
    Quiz = "quiz",
    @serdeKeys("regular")
    Regular = "regular"
}

struct PollOption
{
    string text;
    uint voter_count;
}

struct PollAnswer
{
    string poll_id;
    User user;
    uint[] option_ids;
}

struct Poll
{
    string id;
    string question;
    PollOption[] options;
    uint total_voter_count;
    bool is_closed;
    bool is_anonymous;
    PollType type;
    bool allows_multiple_answers;
    @serdeOptional
    Nullable!uint correct_option_id;
    @serdeOptional
    Nullable!string explanation;
    @serdeOptional
    Nullable!(MessageEntity[]) explanation_entities;
    @serdeOptional
    Nullable!uint open_period;
    @serdeOptional
    Nullable!uint close_date;
}

version(unittest)
{
    import asdf : deserialize;
    import telega.serialization : serializeToJsonString;
    import telega.test : assertEquals;
}

unittest
{
    string json = `{
        "id": "poll1",
        "question": "q",
        "options": [
            {"text": "opt1", "voter_count": 1},
            {"text": "opt2", "voter_count": 2}
        ],
        "total_voter_count": 3,
        "is_closed": false,
        "is_anonymous": false,
        "type": "quiz",
        "allows_multiple_answers": false,
        "correct_option_id": 1
    }`;

    Poll p = deserialize!Poll(json);

    p.id
        .assertEquals("poll1");
    p.type
        .assertEquals(PollType.Quiz);
    p.correct_option_id.get
        .assertEquals(1);
    p.explanation.isNull
        .assertEquals(true);
    p.open_period.isNull
        .assertEquals(true);
}

unittest
{
    Poll p;
    p.id = "poll1";
    p.question = "q";
    p.type = PollType.Regular;

    p.serializeToJsonString()
        .assertEquals(`{"id":"poll1","question":"q","options":[],"total_voter_count":0,"is_closed":false,"is_anonymous":false,"type":"regular","allows_multiple_answers":false}`);
}

struct SendPollMethod
{
    mixin TelegramMethod!"/sendPoll";

    ChatId chat_id;
    string question;
    string[] options;
    @serdeOptional
    Nullable!bool is_anonymous;
    @serdeOptional
    Nullable!PollType type;
    @serdeOptional
    Nullable!bool allows_multiple_answers;
    @serdeOptional
    Nullable!uint correct_option_id;
    @serdeOptional
    Nullable!string explanation;
    @serdeOptional
    Nullable!string explanation_parse_mode;
    @serdeOptional
    Nullable!ushort open_period;
    @serdeOptional
    Nullable!uint close_date;
    @serdeOptional
    Nullable!bool is_closed;
    @serdeOptional
    Nullable!bool disable_notification;
    @serdeOptional
    Nullable!uint reply_to_message_id;
    @serdeOptional
    Nullable!ReplyMarkup reply_markup;
}

struct StopPollMethod
{
    mixin TelegramMethod!"/stopPoll";

    ChatId chat_id;
    uint message_id;
    @serdeOptional
    Nullable!ReplyMarkup reply_markup;
}

Message sendPoll(BotApi api, ref SendPollMethod m)
{
    return api.callMethod!Message(m);
}

Message sendPoll(T1)(BotApi api, T1 chatId, string question, string[] options)
    if (isTelegramId!T1)
{
    SendPollMethod m = {
        chat_id: chatId,
        question: question,
        options: options
    };

    return sendPoll(api, m);
}

Poll stopPoll(BotApi api, ref StopPollMethod m)
{
    return api.callMethod!Poll(m);
}

Poll stopPoll(T1)(BotApi api, T1 chatId, uint messageId)
{
    StopPollMethod m = {
        chat_id: chatId,
        message_id: messageId
    };

    return stopPoll(api, m);
}

unittest
{
    import telega.telegram.legacy.basic : BotApiMock;

    auto api = new BotApiMock(null);

    api.sendPoll("chat-id", "question", ["q1", "q2"]);
    api.stopPoll("chat-id", 123);
}
