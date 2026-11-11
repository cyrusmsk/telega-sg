// Generated from Telegram Bot API 10.4 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.rich;

import asdf.serialization : serdeOptional, serdeKeys;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy, Ref, SerdeDiscriminator;
import telega.telegram.generated.basic;
import telega.telegram.generated.games;

/++ Rich formatted message. +/
struct RichMessage
{
    /// Content of the message
    RichBlock[] blocks;
    /// True, if the rich message must be shown right-to-left
    @serdeOptional
    Nullable!(bool) is_rtl;
}

/++ Describes a rich message to be sent. Exactly one of the fields html, markdown, or blocks must be used. +/
struct InputRichMessage
{
    /// Content of the rich message to send described as a list of blocks
    @serdeOptional
    Nullable!(InputRichBlock[]) blocks;
    /// Content of the rich message to send described using HTML formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    @serdeOptional
    Nullable!(string) html;
    /// Content of the rich message to send described using Markdown formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    @serdeOptional
    Nullable!(string) markdown;
    /// List of media that are specified in the markdown or html fields using tg://photo?id=, tg://video?id=, tg://document?id=, and tg://audio?id= links
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
    /// Unique identifier of the media used in a tg://photo?id=, tg://video?id=, tg://document?id=, or tg://audio?id= link. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.
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
    /// Unique identifier for the target chat or username of the target bot, supergroup, or channel in the format @username; required unless the message is sent as an ephemeral reply to a callback query
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// A JSON-serialized object containing the parameters of the ephemeral message to send
    @serdeOptional
    Nullable!(EphemeralMessageParameters) ephemeral_message_parameters;
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
    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated. Otherwise, the draft is replaced without animation.
    long draft_id;
    /// The partial message to be streamed. Direct upload of new files and explicit upload of files by a URL isn't supported.
    InputRichMessage rich_message;
    /// Pass True to show the user a button to stop further drafts. The bot will receive an Update “stopped_message_generation” if the user presses the button.
    @serdeOptional
    Nullable!(bool) can_stop;
    /// Pass True to keep the draft in the chat when the button is pressed. The draft will still disappear after a short time or if the bot sends a message. To fully preserve the partial draft, the bot should send it as a new message.
    @serdeOptional
    Nullable!(bool) keep_on_stop;
}

/++ Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user's chat. Returns True on success. +/
bool sendRichMessageDraft(BotApi api, SendRichMessageDraftMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ This object represents a button in a RichMessage. Exactly one of the fields other than text and style must be used to specify the type of the button. +/
struct RichMessageButton
{
    /// Text of the button. May contain only plain text, RichTextCustomEmoji and RichTextDateTime entities.
    RichText text;
    /// Style of the button. Must be one of “danger”, “success”, “primary”, or “link” (the button is shown as a regular link without borders). Apps may use theme-specific colors for the button background and text based on the style. The style “link” is allowed only for callback buttons.
    @serdeOptional
    Nullable!(string) style;
    /// HTTP or tg:// URL to be opened when the button is pressed. Links tg://user?id=<user_id> can be used to mention a user by their identifier without using a username, if this is allowed by their privacy settings.
    @serdeOptional
    Nullable!(string) url;
    /// Data to be sent in a callback query to the bot when the button is pressed, 1-64 bytes
    @serdeOptional
    Nullable!(string) callback_data;
    /// Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot. Not supported for messages sent on behalf of a business account.
    @serdeOptional
    Nullable!(WebAppInfo) web_app;
    /// An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget. Not supported for ephemeral messages.
    @serdeOptional
    Nullable!(LoginUrl) login_url;
    /// If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(string) switch_inline_query;
    /// If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(string) switch_inline_query_current_chat;
    /// If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(SwitchInlineQueryChosenChat) switch_inline_query_chosen_chat;
    /// A button that copies the specified text to the clipboard
    @serdeOptional
    Nullable!(CopyTextButton) copy_text;
    /// If set, then the button is disabled and does nothing
    @serdeOptional
    Nullable!(DisabledButton) disabled;
}

alias RichText = JsonableAlgebraicProxy!(RichTextAnchor, RichTextAnchorLink, RichTextBankCardNumber, RichTextBold, RichTextBotCommand, RichTextButton, RichTextCashtag, RichTextCode, RichTextCustomEmoji, RichTextDateTime, RichTextEmailAddress, RichTextHashtag, RichTextItalic, RichTextMarked, RichTextMathematicalExpression, RichTextMention, RichTextPhoneNumber, RichTextReference, RichTextReferenceLink, RichTextSpoiler, RichTextStrikethrough, RichTextSubscript, RichTextSuperscript, RichTextTextMention, RichTextTonAddress, RichTextUnderline, RichTextUrl);

/++ A bold text. +/
@SerdeDiscriminator("type", "bold")
struct RichTextBold
{
    /// Type of the rich text, always “bold”
    string type;
    /// The text
    RichText text;
}

/++ An italicized text. +/
@SerdeDiscriminator("type", "italic")
struct RichTextItalic
{
    /// Type of the rich text, always “italic”
    string type;
    /// The text
    RichText text;
}

/++ An underlined text. +/
@SerdeDiscriminator("type", "underline")
struct RichTextUnderline
{
    /// Type of the rich text, always “underline”
    string type;
    /// The text
    RichText text;
}

/++ A strikethrough text. +/
@SerdeDiscriminator("type", "strikethrough")
struct RichTextStrikethrough
{
    /// Type of the rich text, always “strikethrough”
    string type;
    /// The text
    RichText text;
}

/++ A text covered by a spoiler. +/
@SerdeDiscriminator("type", "spoiler")
struct RichTextSpoiler
{
    /// Type of the rich text, always “spoiler”
    string type;
    /// The text
    RichText text;
}

/++ Formatted date and time. +/
@SerdeDiscriminator("type", "date_time")
struct RichTextDateTime
{
    /// Type of the rich text, always “date_time”
    string type;
    /// The text
    RichText text;
    /// The Unix time associated with the entity
    long unix_time;
    /// The string that defines the formatting of the date and time. See date-time entity formatting for more details.
    string date_time_format;
}

/++ A mention of a Telegram user by their identifier. +/
@SerdeDiscriminator("type", "text_mention")
struct RichTextTextMention
{
    /// Type of the rich text, always “text_mention”
    string type;
    /// The text
    RichText text;
    /// The mentioned user
    User user;
}

/++ A subscript text. +/
@SerdeDiscriminator("type", "subscript")
struct RichTextSubscript
{
    /// Type of the rich text, always “subscript”
    string type;
    /// The text
    RichText text;
}

/++ A superscript text. +/
@SerdeDiscriminator("type", "superscript")
struct RichTextSuperscript
{
    /// Type of the rich text, always “superscript”
    string type;
    /// The text
    RichText text;
}

/++ A marked text. +/
@SerdeDiscriminator("type", "marked")
struct RichTextMarked
{
    /// Type of the rich text, always “marked”
    string type;
    /// The text
    RichText text;
}

/++ A monowidth text. +/
@SerdeDiscriminator("type", "code")
struct RichTextCode
{
    /// Type of the rich text, always “code”
    string type;
    /// The text
    RichText text;
}

/++ A custom emoji. +/
@SerdeDiscriminator("type", "custom_emoji")
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
@SerdeDiscriminator("type", "mathematical_expression")
struct RichTextMathematicalExpression
{
    /// Type of the rich text, always “mathematical_expression”
    string type;
    /// The expression in LaTeX format
    string expression;
}

/++ A text with a link. +/
@SerdeDiscriminator("type", "url")
struct RichTextUrl
{
    /// Type of the rich text, always “url”
    string type;
    /// The text
    RichText text;
    /// URL of the link
    string url;
}

/++ A text with an email address. +/
@SerdeDiscriminator("type", "email_address")
struct RichTextEmailAddress
{
    /// Type of the rich text, always “email_address”
    string type;
    /// The text
    RichText text;
    /// The email address
    string email_address;
}

/++ A text with a phone number. +/
@SerdeDiscriminator("type", "phone_number")
struct RichTextPhoneNumber
{
    /// Type of the rich text, always “phone_number”
    string type;
    /// The text
    RichText text;
    /// The phone number
    string phone_number;
}

/++ A text with a bank card number. +/
@SerdeDiscriminator("type", "bank_card_number")
struct RichTextBankCardNumber
{
    /// Type of the rich text, always “bank_card_number”
    string type;
    /// The text
    RichText text;
    /// The bank card number
    string bank_card_number;
}

/++ An address in the TON blockchain. +/
@SerdeDiscriminator("type", "ton_address")
struct RichTextTonAddress
{
    /// Type of the rich text, always “ton_address”
    string type;
    /// Text of the address
    RichText text;
    /// The address
    string address;
}

/++ A mention by a username. +/
@SerdeDiscriminator("type", "mention")
struct RichTextMention
{
    /// Type of the rich text, always “mention”
    string type;
    /// The text
    RichText text;
    /// The username
    string username;
}

/++ A hashtag. +/
@SerdeDiscriminator("type", "hashtag")
struct RichTextHashtag
{
    /// Type of the rich text, always “hashtag”
    string type;
    /// The text
    RichText text;
    /// The hashtag
    string hashtag;
}

/++ A cashtag. +/
@SerdeDiscriminator("type", "cashtag")
struct RichTextCashtag
{
    /// Type of the rich text, always “cashtag”
    string type;
    /// The text
    RichText text;
    /// The cashtag
    string cashtag;
}

/++ A bot command. +/
@SerdeDiscriminator("type", "bot_command")
struct RichTextBotCommand
{
    /// Type of the rich text, always “bot_command”
    string type;
    /// The text
    RichText text;
    /// The bot command
    string bot_command;
}

/++ A button. +/
@SerdeDiscriminator("type", "button")
struct RichTextButton
{
    /// Type of the rich text, always “button”
    string type;
    /// The button
    RichMessageButton button;
}

/++ An anchor. +/
@SerdeDiscriminator("type", "anchor")
struct RichTextAnchor
{
    /// Type of the rich text, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A link to an anchor. +/
@SerdeDiscriminator("type", "anchor_link")
struct RichTextAnchorLink
{
    /// Type of the rich text, always “anchor_link”
    string type;
    /// The link text
    RichText text;
    /// The name of the anchor. If the name is empty, then the link brings back to the top of the message.
    string anchor_name;
}

/++ A reference. +/
@SerdeDiscriminator("type", "reference")
struct RichTextReference
{
    /// Type of the rich text, always “reference”
    string type;
    /// Text of the reference
    RichText text;
    /// The name of the reference
    string name;
}

/++ A link to a reference. +/
@SerdeDiscriminator("type", "reference_link")
struct RichTextReferenceLink
{
    /// Type of the rich text, always “reference_link”
    string type;
    /// The link text
    RichText text;
    /// The name of the reference
    string reference_name;
}

/++ Caption of a rich formatted block. +/
struct RichBlockCaption
{
    /// Block caption
    RichText text;
    /// Block credit which corresponds to the HTML tag <cite>
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ Cell in a table. +/
struct RichBlockTableCell
{
    /// Text in the cell. If omitted, then the cell is invisible.
    @serdeOptional
    Nullable!(RichText) text;
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
    RichBlock[] blocks;
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

alias RichBlock = JsonableAlgebraicProxy!(RichBlockAnchor, RichBlockAnimation, RichBlockAudio, RichBlockBlockQuotation, RichBlockButtons, RichBlockCollage, RichBlockDetails, RichBlockDivider, RichBlockDocument, RichBlockExpandableBlockQuotation, RichBlockFooter, RichBlockList, RichBlockMap, RichBlockMathematicalExpression, RichBlockParagraph, RichBlockPhoto, RichBlockPreformatted, RichBlockPullQuotation, RichBlockSectionHeading, RichBlockSlideshow, RichBlockTable, RichBlockThinking, RichBlockVideo, RichBlockVoiceNote);

/++ A text paragraph, corresponding to the HTML tag <p>. +/
@SerdeDiscriminator("type", "paragraph")
struct RichBlockParagraph
{
    /// Type of the block, always “paragraph”
    string type;
    /// Text of the block
    RichText text;
}

/++ A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>. +/
@SerdeDiscriminator("type", "heading")
struct RichBlockSectionHeading
{
    /// Type of the block, always “heading”
    string type;
    /// Text of the block
    RichText text;
    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    long size;
}

/++ A preformatted text block, corresponding to the nested HTML tags <pre> and <code>. +/
@SerdeDiscriminator("type", "pre")
struct RichBlockPreformatted
{
    /// Type of the block, always “pre”
    string type;
    /// Text of the block
    RichText text;
    /// The programming language of the text
    @serdeOptional
    Nullable!(string) language;
}

/++ A footer, corresponding to the HTML tag <footer>. +/
@SerdeDiscriminator("type", "footer")
struct RichBlockFooter
{
    /// Type of the block, always “footer”
    string type;
    /// Text of the block
    RichText text;
}

/++ A divider, corresponding to the HTML tag <hr/>. +/
@SerdeDiscriminator("type", "divider")
struct RichBlockDivider
{
    /// Type of the block, always “divider”
    string type;
}

/++ A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>. +/
@SerdeDiscriminator("type", "mathematical_expression")
struct RichBlockMathematicalExpression
{
    /// Type of the block, always “mathematical_expression”
    string type;
    /// The mathematical expression in LaTeX format
    string expression;
}

/++ A block with an anchor, corresponding to the HTML tag <a> with the attribute name. +/
@SerdeDiscriminator("type", "anchor")
struct RichBlockAnchor
{
    /// Type of the block, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>. +/
@SerdeDiscriminator("type", "list")
struct RichBlockList
{
    /// Type of the block, always “list”
    string type;
    /// Items of the list
    RichBlockListItem[] items;
}

/++ A block quotation, corresponding to the HTML tag <blockquote>. +/
@SerdeDiscriminator("type", "blockquote")
struct RichBlockBlockQuotation
{
    /// Type of the block, always “blockquote”
    string type;
    /// Content of the block
    RichBlock[] blocks;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A block quotation, corresponding to the HTML tag <blockquote> with custom attribute "expandable". +/
@SerdeDiscriminator("type", "expandable_blockquote")
struct RichBlockExpandableBlockQuotation
{
    /// Type of the block, always “expandable_blockquote”
    string type;
    /// Content of the block
    RichText text;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A quotation with centered text, loosely corresponding to the HTML tag <aside>. +/
@SerdeDiscriminator("type", "pullquote")
struct RichBlockPullQuotation
{
    /// Type of the block, always “pullquote”
    string type;
    /// Text of the block
    RichText text;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A collage, corresponding to the custom HTML tag <tg-collage>. +/
@SerdeDiscriminator("type", "collage")
struct RichBlockCollage
{
    /// Type of the block, always “collage”
    string type;
    /// Elements of the collage
    RichBlock[] blocks;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A slideshow, corresponding to the custom HTML tag <tg-slideshow>. +/
@SerdeDiscriminator("type", "slideshow")
struct RichBlockSlideshow
{
    /// Type of the block, always “slideshow”
    string type;
    /// Elements of the slideshow
    RichBlock[] blocks;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A table, corresponding to the HTML tag <table>. +/
@SerdeDiscriminator("type", "table")
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
    /// True, if table cells have smaller indents
    @serdeOptional
    Nullable!(bool) is_compact;
    /// Caption of the table
    @serdeOptional
    Nullable!(RichText) caption;
}

/++ An expandable block for details disclosure, corresponding to the HTML tag <details>. +/
@SerdeDiscriminator("type", "details")
struct RichBlockDetails
{
    /// Type of the block, always “details”
    string type;
    /// Always shown summary of the block
    RichText summary;
    /// Content of the block
    RichBlock[] blocks;
    /// True, if the content of the block is visible by default
    @serdeOptional
    Nullable!(bool) is_open;
}

/++ A block with a map, corresponding to the custom HTML tag <tg-map>. +/
@SerdeDiscriminator("type", "map")
struct RichBlockMap
{
    /// Type of the block, always “map”
    string type;
    /// Location of the center of the map
    Location location;
    /// Map zoom level
    long zoom;
    /// Expected width of the map
    long width;
    /// Expected height of the map
    long height;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag <tg-button-row>. +/
@SerdeDiscriminator("type", "buttons")
struct RichBlockButtons
{
    /// Type of the block, always “buttons”
    string type;
    /// The buttons
    RichMessageButton[] buttons;
    /// Horizontal alignment of the buttons. Currently, must be one of “left”, “center”, or “right”.
    @serdeKeys("align")
    @serdeOptional
    Nullable!(string) align_;
}

/++ A block with an animation, corresponding to the HTML tag <video>. +/
@SerdeDiscriminator("type", "animation")
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
@SerdeDiscriminator("type", "audio")
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

/++ A block with a general file, corresponding to the custom HTML tag <tg-document>. +/
@SerdeDiscriminator("type", "document")
struct RichBlockDocument
{
    /// Type of the block, always “document”
    string type;
    /// The document
    Document document;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a photo, corresponding to the HTML tag <img>. +/
@SerdeDiscriminator("type", "photo")
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
@SerdeDiscriminator("type", "video")
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
@SerdeDiscriminator("type", "voice_note")
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
@SerdeDiscriminator("type", "thinking")
struct RichBlockThinking
{
    /// Type of the block, always “thinking”
    string type;
    /// Text of the block. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.
    RichText text;
}

/++ An item of a list to be sent. +/
struct InputRichBlockListItem
{
    /// The content of the item
    InputRichBlock[] blocks;
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

alias InputRichBlock = JsonableAlgebraicProxy!(InputRichBlockAnchor, InputRichBlockAnimation, InputRichBlockAudio, InputRichBlockBlockQuotation, InputRichBlockButtons, InputRichBlockCollage, InputRichBlockDetails, InputRichBlockDivider, InputRichBlockDocument, InputRichBlockExpandableBlockQuotation, InputRichBlockFooter, InputRichBlockList, InputRichBlockMap, InputRichBlockMathematicalExpression, InputRichBlockParagraph, InputRichBlockPhoto, InputRichBlockPreformatted, InputRichBlockPullQuotation, InputRichBlockSectionHeading, InputRichBlockSlideshow, InputRichBlockTable, InputRichBlockThinking, InputRichBlockVideo, InputRichBlockVoiceNote);

/++ A text paragraph, corresponding to the HTML tag <p>. +/
@SerdeDiscriminator("type", "paragraph")
struct InputRichBlockParagraph
{
    /// Type of the block, always “paragraph”
    string type;
    /// Text of the block
    RichText text;
}

/++ A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>. +/
@SerdeDiscriminator("type", "heading")
struct InputRichBlockSectionHeading
{
    /// Type of the block, always “heading”
    string type;
    /// Text of the block
    RichText text;
    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    long size;
}

/++ A preformatted text block, corresponding to the nested HTML tags <pre> and <code>. +/
@SerdeDiscriminator("type", "pre")
struct InputRichBlockPreformatted
{
    /// Type of the block, always “pre”
    string type;
    /// Text of the block
    RichText text;
    /// The programming language of the text
    @serdeOptional
    Nullable!(string) language;
}

/++ A footer, corresponding to the HTML tag <footer>. +/
@SerdeDiscriminator("type", "footer")
struct InputRichBlockFooter
{
    /// Type of the block, always “footer”
    string type;
    /// Text of the block
    RichText text;
}

/++ A divider, corresponding to the HTML tag <hr/>. +/
@SerdeDiscriminator("type", "divider")
struct InputRichBlockDivider
{
    /// Type of the block, always “divider”
    string type;
}

/++ A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>. +/
@SerdeDiscriminator("type", "mathematical_expression")
struct InputRichBlockMathematicalExpression
{
    /// Type of the block, always “mathematical_expression”
    string type;
    /// The mathematical expression in LaTeX format
    string expression;
}

/++ A block with an anchor, corresponding to the HTML tag <a> with the attribute name. +/
@SerdeDiscriminator("type", "anchor")
struct InputRichBlockAnchor
{
    /// Type of the block, always “anchor”
    string type;
    /// The name of the anchor
    string name;
}

/++ A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>. +/
@SerdeDiscriminator("type", "list")
struct InputRichBlockList
{
    /// Type of the block, always “list”
    string type;
    /// Items of the list
    InputRichBlockListItem[] items;
}

/++ A block quotation, corresponding to the HTML tag <blockquote>. +/
@SerdeDiscriminator("type", "blockquote")
struct InputRichBlockBlockQuotation
{
    /// Type of the block, always “blockquote”
    string type;
    /// Content of the block
    InputRichBlock[] blocks;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A block quotation, corresponding to the HTML tag <blockquote> with custom attribute "expandable". +/
@SerdeDiscriminator("type", "expandable_blockquote")
struct InputRichBlockExpandableBlockQuotation
{
    /// Type of the block, always “expandable_blockquote”
    string type;
    /// Content of the block
    RichText text;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A quotation with centered text, loosely corresponding to the HTML tag <aside>. +/
@SerdeDiscriminator("type", "pullquote")
struct InputRichBlockPullQuotation
{
    /// Type of the block, always “pullquote”
    string type;
    /// Text of the block
    RichText text;
    /// Credit of the block
    @serdeOptional
    Nullable!(RichText) credit;
}

/++ A collage, corresponding to the custom HTML tag <tg-collage>. +/
@SerdeDiscriminator("type", "collage")
struct InputRichBlockCollage
{
    /// Type of the block, always “collage”
    string type;
    /// Elements of the collage
    InputRichBlock[] blocks;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A slideshow, corresponding to the custom HTML tag <tg-slideshow>. +/
@SerdeDiscriminator("type", "slideshow")
struct InputRichBlockSlideshow
{
    /// Type of the block, always “slideshow”
    string type;
    /// Elements of the slideshow
    InputRichBlock[] blocks;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A table, corresponding to the HTML tag <table>. +/
@SerdeDiscriminator("type", "table")
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
    /// Pass True if table cells must have smaller indents
    @serdeOptional
    Nullable!(bool) is_compact;
    /// Caption of the table
    @serdeOptional
    Nullable!(RichText) caption;
}

/++ An expandable block for details disclosure, corresponding to the HTML tag <details>. +/
@SerdeDiscriminator("type", "details")
struct InputRichBlockDetails
{
    /// Type of the block, always “details”
    string type;
    /// Always shown summary of the block
    RichText summary;
    /// Content of the block
    InputRichBlock[] blocks;
    /// Pass True if the content of the block is visible by default
    @serdeOptional
    Nullable!(bool) is_open;
}

/++ A block with a map, corresponding to the custom HTML tag <tg-map>. The map's width and height must not exceed 10000 in total. The width and height ratio must be at most 20. +/
@SerdeDiscriminator("type", "map")
struct InputRichBlockMap
{
    /// Type of the block, always “map”
    string type;
    /// Location of the center of the map
    Location location;
    /// Map zoom level; 0-24
    @serdeOptional
    Nullable!(long) zoom;
    /// Map width; 0-10000
    @serdeOptional
    Nullable!(long) width;
    /// Map height; 0-10000
    @serdeOptional
    Nullable!(long) height;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag <tg-button-row>. +/
@SerdeDiscriminator("type", "buttons")
struct InputRichBlockButtons
{
    /// Type of the block, always “buttons”
    string type;
    /// List of 1-8 buttons to send
    RichMessageButton[] buttons;
    /// Horizontal alignment of the buttons. Currently, must be one of “left”, “center”, or “right”.
    @serdeKeys("align")
    @serdeOptional
    Nullable!(string) align_;
}

/++ A block with an animation, corresponding to the HTML tag <video>. +/
@SerdeDiscriminator("type", "animation")
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
@SerdeDiscriminator("type", "audio")
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

/++ A block with a general file, corresponding to the custom HTML tag <tg-document>. +/
@SerdeDiscriminator("type", "document")
struct InputRichBlockDocument
{
    /// Type of the block, always “document”
    string type;
    /// The document. Caption is ignored.
    InputMediaDocument document;
    /// Caption of the block
    @serdeOptional
    Nullable!(RichBlockCaption) caption;
}

/++ A block with a photo, corresponding to the HTML tag <img>. +/
@SerdeDiscriminator("type", "photo")
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
@SerdeDiscriminator("type", "video")
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
@SerdeDiscriminator("type", "voice_note")
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
@SerdeDiscriminator("type", "thinking")
struct InputRichBlockThinking
{
    /// Type of the block, always “thinking”
    string type;
    /// Text of the block. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.
    RichText text;
}
