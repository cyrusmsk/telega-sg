module gen.generator;

import std.stdio : writeln, writefln;
import std.algorithm.searching : canFind;
import std.format : format;
import std.range : empty;
import std.string : strip;

import gen.model : TelegramApi, EntityType;
import gen.parser : parseBotApiPage;
import gen.emitter : emitModules;
import gen.special : KNOWN_MODULES;

void run(string url, string inputFile, string targetDir, string[] enabledModules)
{
    import std.file : exists, isDir, mkdirRecurse;

    if (targetDir.empty) {
        targetDir = "out";
    }

    assert(targetDir.exists && targetDir.isDir,
        format("Target directory %s does not exist or is not a directory", targetDir));

    foreach (m; enabledModules) {
        assert(KNOWN_MODULES.canFind(m), format("Unknown module filter '%s'", m));
    }

    string html;

    if (!inputFile.empty) {
        import std.file : read;

        writefln("Reading %s", inputFile);
        html = cast(string) readFile(inputFile);
    } else {
        import requests : getContent;

        writefln("Downloading %s", url);
        html = cast(string) getContent(url);
    }

    TelegramApi api = parseBotApiPage(html);

    size_t typesCount, methodsCount;
    foreach (entity; api.entities) {
        final switch (entity.kind) with (EntityType) {
            case EntityType.type: typesCount++; break;
            case EntityType.method: methodsCount++; break;
        }
    }
    writefln("Parsed %s types and %s methods in %s sections", typesCount, methodsCount, api.sections.length);

    foreach (w; api.warnings) {
        writefln("[warn] %s", w);
    }

    auto generated = emitModules(api, enabledModules);

    foreach (moduleName, code; generated) {
        import std.path : buildPath;
        import std.file : write;

        string path = buildPath(targetDir, moduleName ~ ".d");
        write(path, code);
        writefln("Written %s (%s lines)", path, code.countLines);
    }
}

private:
size_t countLines(string s)
{
    import std.algorithm.iteration : splitter;
    import std.uni : lineSep;

    long n;
    foreach (c; s) {
        if (c == '\n') {
            n++;
        }
    }

    return cast(size_t)(n + 1);
}

string readFile(string path)
{
    import std.file : read;

    return cast(string) read(path);
}
