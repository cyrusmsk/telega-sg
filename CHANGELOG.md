# Changelog

## [0.4.0] - 2026-08-23
### Added
- `telega.serialization.Ref!T`: heap-backed recursive reference wrapper that enables
  representation of self-referential Telegram types (Message.reply_to_message,
  ChecklistTasksDone.message, SuggestedPost*.message, etc.)
- Full `InputFile` support: filename, binary content, and multipart/form-data transport
- `HttpClient.sendPostRequestRaw`: raw POST body transport for multipart file uploads
- `BotApi.callMethod` automatic multipart detection for methods containing InputFile fields
- `buildMultipartBody` helper with proper JSON-form-field and file-part encoding
- Generator: recursive references emitted via `Ref!T` instead of being skipped
- Generator: `InputFile` imported from `telega.botapi` instead of empty local struct
- Legacy `InputFile` now aliases to the real runtime type for file upload support
- Bot API 10.4 generated types and methods (HTML widgets, TON wallet cards, rich message quotes)
- `examples/widgetbot`: interactive HTML widget using `sendWidget`, `answerWidgetQuery`
  and `editMessageWidgetData`
- `JsonableAlgebraicProxy` deserialization for family/union response fields, using
  generator-emitted `@SerdeDiscriminator` constants and structural key matching
- `JsonableAlgebraicProxy.hasValue`, `holds!T` and `get!T` accessors
- Generator emits family union response fields instead of skipping them

### Fixed
- Issue #71: pinned message and replied message access now fully supported
- Recursive Telegram types now deserialize/serialize correctly via `Ref!T`
- File uploads work with both `default` (vibe-http) and `requests-driver` configurations

### Changed
- Generator now emits `import telega.serialization : JsonableAlgebraicProxy, Ref, SerdeDiscriminator;` universally
- `JsonableAlgebraicProxy` stores union members on the heap, avoiding size cycles in recursive unions
- Optional `chat_id` parameters are now `Nullable!ChatId`, matching Bot API 10.4
- All dub configurations build and test successfully (both release and unittest)

### Removed
- Dropped the `dests` dependency. It was last released as 0.3.1 and supplied a
  single function, `assertEq`, consumed only by `telega.test.assertEquals`.
  That wrapper is now implemented directly on `std.format`, and it reports the
  caller's file and line on failure instead of the wrapper's own location.
  The library tests are plain `unittest` blocks run by `dub test`, so no test
  framework was needed in its place.

### Added
- API generator (`generator/`): parses https://core.telegram.org/bots/api with parserino
  and generates D types, methods, wrapper functions and DDOC for Bot API 10.x into
  `source/telega/telegram/generated/` (`make generate-api`)
- Generated modules are placed alongside the hand-written ones moved to
  `source/telega/telegram/legacy/`; both generations can be used side by side
- Examples using the generated API: `examples/echobot`, `examples/keyboard`;
  previous examples moved to `examples/legacy/`

### Changed
- Updated asdf to 0.8.0 (finishes #72, #73)
- Updated requests to 2.2.x
- Replaced vibe-d:http with the standalone vibe-http package in the default configuration
- dub.sdl rewritten as dub.json
- Migrated to the asdf serde API: `@serdeProxy`, `@serdeIgnore`, `SerdeException deserializeFromAsdf`
- All optional fields are annotated with `@serdeOptional` (asdf 0.6+ treats unannotated members as required)
- String enums use `@serdeKeys` for wire format values instead of serialization proxies
- `Poll.type` is now `PollType` instead of `string`

## [0.2.1] - 2024-01-07
### Changed
- Added support for ldc 1.36.0
- Added support for 2.106.1
- Updated vendor dependencies

## [0.2.0] - 2020-12-05
### Added
- Added CHANGELOG file
- Added updates from telegram API v. 4.1 and 4.2

### Changed
- vibe-core dependency version was set to ~1.9 instead of ~1.9.2
- Fixed type of Contact.user_id field
- Now dests is used as an assertion framework