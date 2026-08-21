# Changelog

## [0.3.0] - 2026-08-21
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