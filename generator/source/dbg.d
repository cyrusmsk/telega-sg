import std.stdio;
import std.algorithm.searching : canFind;
import std.file : read;
import std.algorithm.iteration : filter;
import std.array : array;
import std.algorithm.searching : canFind;
import gen.parser : parseBotApiPage;
import gen.special : moduleOf;

void main()
{
    auto api = parseBotApiPage(cast(string) read("fixtures/botapi.html"));
    writeln("total: ", api.entities.length);

    foreach (e; api.entities) {
        if (["Update", "getUpdates", "setWebhook", "WebhookInfo"].canFind(e.name)) {
            writeln(e.name, " -> ", moduleOf(e.name, e.section), " kind:", e.kind, " table-fields:", e.fields.length);
        }
    }
}
