module app;

import std.stdio;
import std.getopt : getopt, defaultGetoptPrinter;
import gen.generator : run;

string url = "https://core.telegram.org/bots/api";
string targetDir;
string inputFile;
string[] enableModules;

void main(string[] args)
{
    auto help = getopt(
        args,
        "url", "Telegram bot API documentation URL (default: " ~ url ~ ")", &url,
        "file", "Parse a local HTML file instead of downloading the page", &inputFile,
        "target-dir", "Relative path to generate files in", &targetDir,
        "module", "Generate code for specific module only (can be declared multiple times)", &enableModules,
    );

    if (help.helpWanted) {
        defaultGetoptPrinter("Telegram Bot API entities generator v.0.1", help.options);
        return;
    }

    run(url, inputFile, targetDir, enableModules);
}
