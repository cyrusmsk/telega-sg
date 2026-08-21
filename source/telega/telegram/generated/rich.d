// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.rich;

import asdf.serialization : serdeOptional, serdeKeys;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;
import telega.telegram.generated.games;

/++ Rich formatted message. +/
struct RichMessage
{
    /// Content of the message
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// True, if the rich message must be shown right-to-left
    @serdeOptional
    Nullable!(bool) is_rtl;
}

/++ Describes a rich message to be sent. Exactly one of the fields html, markdown, or blocks must be used. +/
struct InputRichMessage
{
    /// Content of the rich message to send described as a list of blocks
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Content of the rich message to send described using HTML formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    @serdeOptional
    Nullable!(string) html;
    /// Content of the rich message to send described using Markdown formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    @serdeOptional
    Nullable!(string) markdown;
    /// List of media that are specified in the markdown or html fields using tg://photo?id=, tg://video?id=, and tg://audio?id= links
    @serdeOptional
    Nullable!(InputRichMessageMedia[]) media;
    /// Pass True if the rich message must be shown right-to-left
    @serdeOptional
    Nullable!(bool) is_rtl;
    /// Pass True to skip automatic detection of entities (e.g., URLs, email addresses, username mentions, hashtags, cashtags, bot commands, or phone numbers) in the text
    @serdeOptional
    Nullable!(bool) skip_entity_detection;
}

/++ Describes a media element embedded in an outgoing rich message. +/
struct InputRichMessageMedia
{
    /// Unique identifier of the media used in a tg://photo?id=, tg://video?id=, or tg://audio?id= link. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.
    string id;
    /// The media to be sent. Everything except the media itself and its properties is ignored.
    // TODO(telega-generator): unsupported type for field 'media'
}

/++ Use this method to send rich messages. If the message contains a block with a media element, then the bot must have the right to send the media to the chat. On success, the sent Message is returned. +/
struct SendRichMessageMethod
{
    mixin TelegramMethod!"/sendRichMessage";
    /// Unique identifier of the business connection on behalf of which the message will be sent. Bot can send rich messages on behalf of a business account only if the corresponding user can send rich messages.
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// The message to be sent
    InputRichMessage rich_message;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    @serdeOptional
    Nullable!(bool) allow_paid_broadcast;
    /// Unique identifier of the message effect to be added to the message; for private chats only
    @serdeOptional
    Nullable!(string) message_effect_id;
    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    @serdeOptional
    Nullable!(SuggestedPostParameters) suggested_post_parameters;
    /// Description of the message to reply to
    @serdeOptional
    Nullable!(ReplyParameters) reply_parameters;
    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    @serdeOptional
    Nullable!(ReplyMarkup) reply_markup;
}

/++ Use this method to send rich messages. If the message contains a block with a media element, then the bot must have the right to send the media to the chat. On success, the sent Message is returned. +/
Message sendRichMessage(BotApi api, SendRichMessageMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user's chat. Returns True on success. +/
struct SendRichMessageDraftMethod
{
    mixin TelegramMethod!"/sendRichMessageDraft";
    /// Unique identifier for the target private chat
    long chat_id;
    /// Unique identifier for the target message thread
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated.
    long draft_id;
    /// The partial message to be streamed. Direct upload of new files isn't supported.
    InputRichMessage rich_message;
}

/++ Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user's chat. Returns True on success. +/
bool sendRichMessageDraft(BotApi api, SendRichMessageDraftMethod method)
{
    return api.callMethod!(bool)(method);
}

alias RichText = JsonableAlgebraicProxy!(RichTextAnchor, RichTextAnchorLink, RichTextBankCardNumber, RichTextBold, RichTextBotCommand, RichTextCashtag, RichTextCode, RichTextCustomEmoji, RichTextDateTime, RichTextEmailAddress, RichTextHashtag, RichTextItalic, RichTextMarked, RichTextMathematicalExpression, RichTextMention, RichTextPhoneNumber, RichTextReference, RichTextReferenceLink, RichTextSpoiler, RichTextStrikethrough, RichTextSubscript, RichTextSuperscript, RichTextTextMention, RichTextUnderline, RichTextUrl);

/++ A bold text. +/
struct RichTextBold
{
    /// Type of the rich text, always “bold”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ An italicized text. +/
struct RichTextItalic
{
    /// Type of the rich text, always “italic”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ An underlined text. +/
struct RichTextUnderline
{
    /// Type of the rich text, always “underline”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A strikethrough text. +/
struct RichTextStrikethrough
{
    /// Type of the rich text, always “strikethrough”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A text covered by a spoiler. +/
struct RichTextSpoiler
{
    /// Type of the rich text, always “spoiler”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ Formatted date and time. +/
struct RichTextDateTime
{
    /// Type of the rich text, always “date_time”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The Unix time associated with the entity
    long unix_time;
    /// The string that defines the formatting of the date and time. See date-time entity formatting for more details.
    string date_time_format;
}

/++ A mention of a Telegram user by their identifier. +/
struct RichTextTextMention
{
    /// Type of the rich text, always “text_mention”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The mentioned user
    User user;
}

/++ A subscript text. +/
struct RichTextSubscript
{
    /// Type of the rich text, always “subscript”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A superscript text. +/
struct RichTextSuperscript
{
    /// Type of the rich text, always “superscript”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A marked text. +/
struct RichTextMarked
{
    /// Type of the rich text, always “marked”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A monowidth text. +/
struct RichTextCode
{
    /// Type of the rich text, always “code”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A custom emoji. +/
struct RichTextCustomEmoji
{
    /// Type of the rich text, always “custom_emoji”
    string type;
    /// Unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    string custom_emoji_id;
    /// Alternative emoji for the custom emoji
    string alternative_text;
}

/++ A mathematical expression. +/
struct RichTextMathematicalExpression
{
    /// Type of the rich text, always “mathematical_expression”
    string type;
    /// The expression in LaTeX format
    string expression;
}

/++ A text with a link. +/
struct RichTextUrl
{
    /// Type of the rich text, always “url”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// URL of the link
    string url;
}

/++ A text with an email address. +/
struct RichTextEmailAddress
{
    /// Type of the rich text, always “email_address”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The email address
    string email_address;
}

/++ A text with a phone number. +/
struct RichTextPhoneNumber
{
    /// Type of the rich text, always “phone_number”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The phone number
    string phone_number;
}

/++ A text with a bank card number. +/
struct RichTextBankCardNumber
{
    /// Type of the rich text, always “bank_card_number”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The bank card number
    string bank_card_number;
}

/++ A mention by a username. +/
struct RichTextMention
{
    /// Type of the rich text, always “mention”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The username
    string username;
}

/++ A hashtag. +/
struct RichTextHashtag
{
    /// Type of the rich text, always “hashtag”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The hashtag
    string hashtag;
}

/++ A cashtag. +/
struct RichTextCashtag
{
    /// Type of the rich text, always “cashtag”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The cashtag
    string cashtag;
}

/++ A bot command. +/
struct RichTextBotCommand
{
    /// Type of the rich text, always “bot_command”
    string type;
    /// The text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The bot command
    string bot_command;
}

/++ An anchor. +/
struct RichTextAnchor
{
    /// Type of the rich text, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A link to an anchor. +/
struct RichTextAnchorLink
{
    /// Type of the rich text, always “anchor_link”
    string type;
    /// The link text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The name of the anchor. If the name is empty, then the link brings back to the top of the message.
    string anchor_name;
}

/++ A reference. +/
struct RichTextReference
{
    /// Type of the rich text, always “reference”
    string type;
    /// Text of the reference
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The name of the reference
    string name;
}

/++ A link to a reference. +/
struct RichTextReferenceLink
{
    /// Type of the rich text, always “reference_link”
    string type;
    /// The link text
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The name of the reference
    string reference_name;
}

/++ Caption of a rich formatted block. +/
struct RichBlockCaption
{
    /// Block caption
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Block credit which corresponds to the HTML tag <cite>
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ Cell in a table. +/
struct RichBlockTableCell
{
    /// Text in the cell. If omitted, then the cell is invisible.
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// True, if the cell is a header cell
    @serdeOptional
    Nullable!(bool) is_header;
    /// The number of columns the cell spans if it is bigger than 1
    @serdeOptional
    Nullable!(long) colspan;
    /// The number of rows the cell spans if it is bigger than 1
    @serdeOptional
    Nullable!(long) rowspan;
    /// Horizontal cell content alignment. Currently, must be one of “left”, “center”, or “right”.
    @serdeKeys("align")
    string align_;
    /// Vertical cell content alignment. Currently, must be one of “top”, “middle”, or “bottom”.
    string valign;
}

/++ An item of a list. +/
struct RichBlockListItem
{
    /// Label of the item
    string label;
    /// The content of the item
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// True, if the item has a checkbox
    @serdeOptional
    Nullable!(bool) has_checkbox;
    /// True, if the item has a checked checkbox
    @serdeOptional
    Nullable!(bool) is_checked;
    /// For ordered lists, the numeric value of the item label
    @serdeOptional
    Nullable!(long) value;
    /// For ordered lists, the type of the item label; must be one of “a” for lowercase letters, “A” for uppercase letters, “i” for lowercase Roman numerals, “I” for uppercase Roman numerals, or “1” for decimal numbers
    @serdeOptional
    Nullable!(string) type;
}

alias RichBlock = JsonableAlgebraicProxy!(RichBlockAnchor, RichBlockAnimation, RichBlockAudio, RichBlockBlockQuotation, RichBlockCollage, RichBlockDetails, RichBlockDivider, RichBlockFooter, RichBlockList, RichBlockMap, RichBlockMathematicalExpression, RichBlockParagraph, RichBlockPhoto, RichBlockPreformatted, RichBlockPullQuotation, RichBlockSectionHeading, RichBlockSlideshow, RichBlockTable, RichBlockThinking, RichBlockVideo, RichBlockVoiceNote);

/++ A text paragraph, corresponding to the HTML tag <p>. +/
struct RichBlockParagraph
{
    /// Type of the block, always “paragraph”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>. +/
struct RichBlockSectionHeading
{
    /// Type of the block, always “heading”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    long size;
}

/++ A preformatted text block, corresponding to the nested HTML tags <pre> and <code>. +/
struct RichBlockPreformatted
{
    /// Type of the block, always “pre”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The programming language of the text
    @serdeOptional
    Nullable!(string) language;
}

/++ A footer, corresponding to the HTML tag <footer>. +/
struct RichBlockFooter
{
    /// Type of the block, always “footer”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A divider, corresponding to the HTML tag <hr/>. +/
struct RichBlockDivider
{
    /// Type of the block, always “divider”
    string type;
}

/++ A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>. +/
struct RichBlockMathematicalExpression
{
    /// Type of the block, always “mathematical_expression”
    string type;
    /// The mathematical expression in LaTeX format
    string expression;
}

/++ A block with an anchor, corresponding to the HTML tag <a> with the attribute name. +/
struct RichBlockAnchor
{
    /// Type of the block, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>. +/
struct RichBlockList
{
    /// Type of the block, always “list”
    string type;
    /// Items of the list
    RichBlockListItem[] items;
}

/++ A block quotation, corresponding to the HTML tag <blockquote>. +/
struct RichBlockBlockQuotation
{
    /// Type of the block, always “blockquote”
    string type;
    /// Content of the block
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// Credit of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A quotation with centered text, loosely corresponding to the HTML tag <aside>. +/
struct RichBlockPullQuotation
{
    /// Type of the block, always “pullquote”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Credit of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A collage, corresponding to the custom HTML tag <tg-collage>. +/
struct RichBlockCollage
{
    /// Type of the block, always “collage”
    string type;
    /// Elements of the collage
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A slideshow, corresponding to the custom HTML tag <tg-slideshow>. +/
struct RichBlockSlideshow
{
    /// Type of the block, always “slideshow”
    string type;
    /// Elements of the slideshow
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A table, corresponding to the HTML tag <table>. +/
struct RichBlockTable
{
    /// Type of the block, always “table”
    string type;
    /// Cells of the table
    RichBlockTableCell[][] cells;
    /// True, if the table has borders
    @serdeOptional
    Nullable!(bool) is_bordered;
    /// True, if the table is striped
    @serdeOptional
    Nullable!(bool) is_striped;
    /// Caption of the table
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ An expandable block for details disclosure, corresponding to the HTML tag <details>. +/
struct RichBlockDetails
{
    /// Type of the block, always “details”
    string type;
    /// Always shown summary of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Content of the block
    // TODO(telega-generator): family type 'RichBlock[]' can't be deserialized yet
    /// True, if the content of the block is visible by default
    @serdeOptional
    Nullable!(bool) is_open;
}

/++ A block with a map, corresponding to the custom HTML tag <tg-map>. +/
struct RichBlockMap
{
    /// Type of the block, always “map”
    string type;
    /// Location of the center of the map
    Location location;
    /// Map zoom level; 13-20
    long zoom;
    /// Expected width of the map
    long width;
    /// Expected height of the map
    long height;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with an animation, corresponding to the HTML tag <video>. +/
struct RichBlockAnimation
{
    /// Type of the block, always “animation”
    string type;
    /// The animation
    Animation animation;
    /// True, if the media preview is covered by a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a music file, corresponding to the HTML tag <audio>. +/
struct RichBlockAudio
{
    /// Type of the block, always “audio”
    string type;
    /// The audio
    Audio audio;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a photo, corresponding to the HTML tag <img>. +/
struct RichBlockPhoto
{
    /// Type of the block, always “photo”
    string type;
    /// Available sizes of the photo
    PhotoSize[] photo;
    /// True, if the media preview is covered by a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a video, corresponding to the HTML tag <video>. +/
struct RichBlockVideo
{
    /// Type of the block, always “video”
    string type;
    /// The video
    Video video;
    /// True, if the media preview is covered by a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a voice note, corresponding to the HTML tag <audio>. +/
struct RichBlockVoiceNote
{
    /// Type of the block, always “voice_note”
    string type;
    /// The voice note
    Voice voice_note;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a “Thinking…” placeholder, corresponding to the custom HTML tag <tg-thinking>. The block may be used only in sendRichMessageDraft, therefore it can't be received in messages. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block. +/
struct RichBlockThinking
{
    /// Type of the block, always “thinking”
    string type;
    /// Text of the block. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ An item of a list to be sent. +/
struct InputRichBlockListItem
{
    /// The content of the item
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Pass True if the item has a checkbox
    @serdeOptional
    Nullable!(bool) has_checkbox;
    /// Pass True if the item has a checked checkbox
    @serdeOptional
    Nullable!(bool) is_checked;
    /// For ordered lists, the numeric value of the item label
    @serdeOptional
    Nullable!(long) value;
    /// For ordered lists, the type of the item label; must be one of “a” for lowercase letters, “A” for uppercase letters, “i” for lowercase Roman numerals, “I” for uppercase Roman numerals, or “1” for decimal numbers
    @serdeOptional
    Nullable!(string) type;
}

alias InputRichBlock = JsonableAlgebraicProxy!(InputRichBlockAnchor, InputRichBlockAnimation, InputRichBlockAudio, InputRichBlockBlockQuotation, InputRichBlockCollage, InputRichBlockDetails, InputRichBlockDivider, InputRichBlockFooter, InputRichBlockList, InputRichBlockMap, InputRichBlockMathematicalExpression, InputRichBlockParagraph, InputRichBlockPhoto, InputRichBlockPreformatted, InputRichBlockPullQuotation, InputRichBlockSectionHeading, InputRichBlockSlideshow, InputRichBlockTable, InputRichBlockThinking, InputRichBlockVideo, InputRichBlockVoiceNote);

/++ A text paragraph, corresponding to the HTML tag <p>. +/
struct InputRichBlockParagraph
{
    /// Type of the block, always “paragraph”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>. +/
struct InputRichBlockSectionHeading
{
    /// Type of the block, always “heading”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    long size;
}

/++ A preformatted text block, corresponding to the nested HTML tags <pre> and <code>. +/
struct InputRichBlockPreformatted
{
    /// Type of the block, always “pre”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// The programming language of the text
    @serdeOptional
    Nullable!(string) language;
}

/++ A footer, corresponding to the HTML tag <footer>. +/
struct InputRichBlockFooter
{
    /// Type of the block, always “footer”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A divider, corresponding to the HTML tag <hr/>. +/
struct InputRichBlockDivider
{
    /// Type of the block, always “divider”
    string type;
}

/++ A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>. +/
struct InputRichBlockMathematicalExpression
{
    /// Type of the block, always “mathematical_expression”
    string type;
    /// The mathematical expression in LaTeX format
    string expression;
}

/++ A block with an anchor, corresponding to the HTML tag <a> with the attribute name. +/
struct InputRichBlockAnchor
{
    /// Type of the block, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>. +/
struct InputRichBlockList
{
    /// Type of the block, always “list”
    string type;
    /// Items of the list
    InputRichBlockListItem[] items;
}

/++ A block quotation, corresponding to the HTML tag <blockquote>. +/
struct InputRichBlockBlockQuotation
{
    /// Type of the block, always “blockquote”
    string type;
    /// Content of the block
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Credit of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A quotation with centered text, loosely corresponding to the HTML tag <aside>. +/
struct InputRichBlockPullQuotation
{
    /// Type of the block, always “pullquote”
    string type;
    /// Text of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Credit of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ A collage, corresponding to the custom HTML tag <tg-collage>. +/
struct InputRichBlockCollage
{
    /// Type of the block, always “collage”
    string type;
    /// Elements of the collage
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A slideshow, corresponding to the custom HTML tag <tg-slideshow>. +/
struct InputRichBlockSlideshow
{
    /// Type of the block, always “slideshow”
    string type;
    /// Elements of the slideshow
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A table, corresponding to the HTML tag <table>. +/
struct InputRichBlockTable
{
    /// Type of the block, always “table”
    string type;
    /// Cells of the table
    RichBlockTableCell[][] cells;
    /// Pass True if the table has borders
    @serdeOptional
    Nullable!(bool) is_bordered;
    /// Pass True if the table is striped
    @serdeOptional
    Nullable!(bool) is_striped;
    /// Caption of the table
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}

/++ An expandable block for details disclosure, corresponding to the HTML tag <details>. +/
struct InputRichBlockDetails
{
    /// Type of the block, always “details”
    string type;
    /// Always shown summary of the block
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
    /// Content of the block
    // TODO(telega-generator): family type 'InputRichBlock[]' can't be deserialized yet
    /// Pass True if the content of the block is visible by default
    @serdeOptional
    Nullable!(bool) is_open;
}

/++ A block with a map, corresponding to the custom HTML tag <tg-map>. The map's width and height must not exceed 10000 in total. The width and height ratio must be at most 20. +/
struct InputRichBlockMap
{
    /// Type of the block, always “map”
    string type;
    /// Location of the center of the map
    Location location;
    /// Map zoom level; 0-24
    long zoom;
    /// Map width; 0-10000
    long width;
    /// Map height; 0-10000
    long height;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with an animation, corresponding to the HTML tag <video>. +/
struct InputRichBlockAnimation
{
    /// Type of the block, always “animation”
    string type;
    /// The animation. Caption is ignored.
    InputMediaAnimation animation;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a music file, corresponding to the HTML tag <audio>. +/
struct InputRichBlockAudio
{
    /// Type of the block, always “audio”
    string type;
    /// The audio. Caption is ignored.
    InputMediaAudio audio;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a photo, corresponding to the HTML tag <img>. +/
struct InputRichBlockPhoto
{
    /// Type of the block, always “photo”
    string type;
    /// The photo. Caption is ignored.
    InputMediaPhoto photo;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a video, corresponding to the HTML tag <video>. +/
struct InputRichBlockVideo
{
    /// Type of the block, always “video”
    string type;
    /// The video. Caption is ignored.
    InputMediaVideo video;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a voice note, corresponding to the HTML tag <audio>. +/
struct InputRichBlockVoiceNote
{
    /// Type of the block, always “voice_note”
    string type;
    /// The voice note. Caption is ignored.
    InputMediaVoiceNote voice_note;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a “Thinking…” placeholder, corresponding to the custom HTML tag <tg-thinking>. The block may be used only in sendRichMessageDraft, therefore it can't be received in messages. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block. +/
struct InputRichBlockThinking
{
    /// Type of the block, always “thinking”
    string type;
    /// Text of the block. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.
    // TODO(telega-generator): family type 'RichText' can't be deserialized yet
}
