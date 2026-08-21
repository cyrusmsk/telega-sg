// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.basic;

import asdf.serialization : serdeOptional, serdeKeys;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.games;
import telega.telegram.generated.inline;
import telega.telegram.generated.passport;
import telega.telegram.generated.payments;
import telega.telegram.generated.poll;
import telega.telegram.generated.rich;
import telega.telegram.generated.stickers;

/// This object represents the contents of a file to be uploaded.
/// Must be posted using multipart/form-data in the usual way.
struct InputFile
{
}

/// Enum of chat types
enum ChatType : string
{
    @serdeKeys("private")
    Private    = "private",
    @serdeKeys("group")
    Group      = "group",
    @serdeKeys("supergroup")
    Supergroup = "supergroup",
    @serdeKeys("channel")
    Channel    = "channel"
}

/// Parse modes for text entities
enum ParseMode : string
{
    Markdown   = "Markdown",
    MarkdownV2 = "MarkdownV2",
    HTML       = "HTML",
    None       = "",
}

/// Type of the message text entity
enum MessageEntityType : string
{
    @serdeKeys("mention")
    Mention          = "mention",
    @serdeKeys("hashtag")
    Hashtag          = "hashtag",
    @serdeKeys("cashtag")
    Cashtag          = "cashtag",
    @serdeKeys("bot_command")
    BotCommand       = "bot_command",
    @serdeKeys("url")
    Url              = "url",
    @serdeKeys("email")
    Email            = "email",
    @serdeKeys("phone_number")
    PhoneNumber      = "phone_number",
    @serdeKeys("bold")
    Bold             = "bold",
    @serdeKeys("italic")
    Italic           = "italic",
    @serdeKeys("underline")
    Underline        = "underline",
    @serdeKeys("strikethrough")
    Strikethrough    = "strikethrough",
    @serdeKeys("spoiler")
    Spoiler          = "spoiler",
    @serdeKeys("code")
    Code             = "code",
    @serdeKeys("pre")
    Pre              = "pre",
    @serdeKeys("text_link")
    TextLink         = "text_link",
    @serdeKeys("text_mention")
    TextMension      = "text_mention",
    @serdeKeys("custom_emoji")
    CustomEmoji      = "custom_emoji",
    @serdeKeys("blockquote")
    Blockquote       = "blockquote",
    @serdeKeys("expandable_blockquote")
    ExpandableBlockquote = "expandable_blockquote",
}

/// Type of action to broadcast
enum ChatAction : string
{
    @serdeKeys("typing")
    Typing                = "typing",
    @serdeKeys("upload_photo")
    UploadPhoto           = "upload_photo",
    @serdeKeys("record_video")
    RecordVideo           = "record_video",
    @serdeKeys("upload_video")
    UploadVideo           = "upload_video",
    @serdeKeys("record_voice")
    RecordVoice           = "record_voice",
    @serdeKeys("upload_voice")
    UploadVoice           = "upload_voice",
    @serdeKeys("upload_document")
    UploadDocument        = "upload_document",
    @serdeKeys("choose_sticker")
    ChooseSticker         = "choose_sticker",
    @serdeKeys("find_location")
    FindLocation          = "find_location",
    @serdeKeys("record_video_note")
    RecordVideoNote       = "record_video_note",
    @serdeKeys("upload_video_note")
    UploadVideoNote       = "upload_video_note",
}

/// Type of an update the bot can receive
enum UpdateType : string
{
    @serdeKeys("message")
    Message               = "message",
    @serdeKeys("edited_message")
    EditedMessage         = "edited_message",
    @serdeKeys("channel_post")
    ChannelPost           = "channel_post",
    @serdeKeys("edited_channel_post")
    EditedChannelPost     = "edited_channel_post",
    @serdeKeys("inline_query")
    InlineQuery           = "inline_query",
    @serdeKeys("chosen_inline_result")
    ChosenInlineResult    = "chosen_inline_result",
    @serdeKeys("callback_query")
    CallbackQuery         = "callback_query",
    @serdeKeys("shipping_query")
    ShippingQuery         = "shipping_query",
    @serdeKeys("pre_checkout_query")
    PreCheckoutQuery      = "pre_checkout_query",
    @serdeKeys("poll")
    Poll                  = "poll",
    @serdeKeys("poll_answer")
    PollAnswer            = "poll_answer",
}

/++ This object represents a Telegram user or bot. +/
struct User
{
    /// Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    long id;
    /// True, if this user is a bot
    bool is_bot;
    /// User's or bot's first name
    string first_name;
    /// User's or bot's last name
    @serdeOptional
    Nullable!(string) last_name;
    /// User's or bot's username
    @serdeOptional
    Nullable!(string) username;
    /// IETF language tag of the user's language
    @serdeOptional
    Nullable!(string) language_code;
    /// True, if this user is a Telegram Premium user
    @serdeOptional
    Nullable!(bool) is_premium;
    /// True, if this user added the bot to the attachment menu
    @serdeOptional
    Nullable!(bool) added_to_attachment_menu;
    /// True, if the bot can be invited to groups. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) can_join_groups;
    /// True, if privacy mode is disabled for the bot. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) can_read_all_group_messages;
    /// True, if the bot supports guest queries from chats it is not a member of. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) supports_guest_queries;
    /// True, if the bot supports inline queries. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) supports_inline_queries;
    /// True, if the bot can be connected to a user account to manage it. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) can_connect_to_business;
    /// True, if the bot has a main Web App. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) has_main_web_app;
    /// True, if the bot has forum topic mode enabled in private chats. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) has_topics_enabled;
    /// True, if the bot allows users to create and delete topics in private chats. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) allows_users_to_create_topics;
    /// True, if other bots can be created to be controlled by the bot. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) can_manage_bots;
    /// True, if the bot supports join request queries and can be assigned to process them. Returned only in getMe.
    @serdeOptional
    Nullable!(bool) supports_join_request_queries;
}

/++ This object represents a chat. +/
struct Chat
{
    /// Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    long id;
    /// Type of the chat, can be either “private”, “group”, “supergroup” or “channel”
    string type;
    /// Title, for supergroups, channels and group chats
    @serdeOptional
    Nullable!(string) title;
    /// Username, for private chats, supergroups and channels if available
    @serdeOptional
    Nullable!(string) username;
    /// First name of the other party in a private chat
    @serdeOptional
    Nullable!(string) first_name;
    /// Last name of the other party in a private chat
    @serdeOptional
    Nullable!(string) last_name;
    /// True, if the supergroup chat is a forum (has topics enabled)
    @serdeOptional
    Nullable!(bool) is_forum;
    /// True, if the chat is the direct messages chat of a channel
    @serdeOptional
    Nullable!(bool) is_direct_messages;
}

/++ This object contains full information about a chat. +/
struct ChatFullInfo
{
    /// Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    long id;
    /// Type of the chat, can be either “private”, “group”, “supergroup” or “channel”
    string type;
    /// Title, for supergroups, channels and group chats
    @serdeOptional
    Nullable!(string) title;
    /// Username, for private chats, supergroups and channels if available
    @serdeOptional
    Nullable!(string) username;
    /// First name of the other party in a private chat
    @serdeOptional
    Nullable!(string) first_name;
    /// Last name of the other party in a private chat
    @serdeOptional
    Nullable!(string) last_name;
    /// True, if the supergroup chat is a forum (has topics enabled)
    @serdeOptional
    Nullable!(bool) is_forum;
    /// True, if the chat is the direct messages chat of a channel
    @serdeOptional
    Nullable!(bool) is_direct_messages;
    /// Identifier of the accent color for the chat name and backgrounds of the chat photo, reply header, and link preview. See accent colors for more details.
    long accent_color_id;
    /// The maximum number of reactions that can be set on a message in the chat
    long max_reaction_count;
    /// Chat photo
    @serdeOptional
    Nullable!(ChatPhoto) photo;
    /// If non-empty, the list of all active chat usernames; for private chats, supergroups and channels
    @serdeOptional
    Nullable!(string[]) active_usernames;
    /// For private chats, the date of birth of the user
    @serdeOptional
    Nullable!(Birthdate) birthdate;
    /// For private chats with business accounts, the intro of the business
    @serdeOptional
    Nullable!(BusinessIntro) business_intro;
    /// For private chats with business accounts, the location of the business
    @serdeOptional
    Nullable!(BusinessLocation) business_location;
    /// For private chats with business accounts, the opening hours of the business
    @serdeOptional
    Nullable!(BusinessOpeningHours) business_opening_hours;
    /// For private chats, the personal channel of the user
    @serdeOptional
    Nullable!(Chat) personal_chat;
    /// Information about the corresponding channel chat; for direct messages chats only
    @serdeOptional
    Nullable!(Chat) parent_chat;
    /// List of available reactions allowed in the chat. If omitted, then all emoji reactions are allowed.
    // TODO(telega-generator): family type 'ReactionType[]' can't be deserialized yet
    /// Custom emoji identifier of the emoji chosen by the chat for the reply header and link preview background
    @serdeOptional
    Nullable!(string) background_custom_emoji_id;
    /// Identifier of the accent color for the chat's profile background. See profile accent colors for more details.
    @serdeOptional
    Nullable!(long) profile_accent_color_id;
    /// Custom emoji identifier of the emoji chosen by the chat for its profile background
    @serdeOptional
    Nullable!(string) profile_background_custom_emoji_id;
    /// Custom emoji identifier of the emoji status of the chat or the other party in a private chat
    @serdeOptional
    Nullable!(string) emoji_status_custom_emoji_id;
    /// Expiration date of the emoji status of the chat or the other party in a private chat, in Unix time, if any
    @serdeOptional
    Nullable!(long) emoji_status_expiration_date;
    /// Bio of the other party in a private chat
    @serdeOptional
    Nullable!(string) bio;
    /// True, if privacy settings of the other party in the private chat allows to use tg://user?id=<user_id> links only in chats with the user
    @serdeOptional
    Nullable!(bool) has_private_forwards;
    /// True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat
    @serdeOptional
    Nullable!(bool) has_restricted_voice_and_video_messages;
    /// True, if users need to join the supergroup before they can send messages
    @serdeOptional
    Nullable!(bool) join_to_send_messages;
    /// True, if all users directly joining the supergroup without using an invite link need to be approved by supergroup administrators
    @serdeOptional
    Nullable!(bool) join_by_request;
    /// Description, for groups, supergroups and channel chats
    @serdeOptional
    Nullable!(string) description;
    /// Primary invite link, for groups, supergroups and channel chats
    @serdeOptional
    Nullable!(string) invite_link;
    /// The most recent pinned message (by sending date)
    @serdeOptional
    Nullable!(Message) pinned_message;
    /// Default chat member permissions, for groups and supergroups
    @serdeOptional
    Nullable!(ChatPermissions) permissions;
    /// Information about types of gifts that are accepted by the chat or by the corresponding user for private chats
    AcceptedGiftTypes accepted_gift_types;
    /// True, if paid media messages can be sent or forwarded to the channel chat. The field is available only for channel chats.
    @serdeOptional
    Nullable!(bool) can_send_paid_media;
    /// For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds
    @serdeOptional
    Nullable!(long) slow_mode_delay;
    /// For supergroups, the minimum number of boosts that a non-administrator user needs to add in order to ignore slow mode and chat permissions
    @serdeOptional
    Nullable!(long) unrestrict_boost_count;
    /// The time after which all messages sent to the chat will be automatically deleted; in seconds
    @serdeOptional
    Nullable!(long) message_auto_delete_time;
    /// True, if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators.
    @serdeOptional
    Nullable!(bool) has_aggressive_anti_spam_enabled;
    /// True, if non-administrators can only get the list of bots and administrators in the chat
    @serdeOptional
    Nullable!(bool) has_hidden_members;
    /// True, if messages from the chat can't be forwarded to other chats
    @serdeOptional
    Nullable!(bool) has_protected_content;
    /// True, if new chat members will have access to old messages; available only to chat administrators
    @serdeOptional
    Nullable!(bool) has_visible_history;
    /// For supergroups, name of the group sticker set
    @serdeOptional
    Nullable!(string) sticker_set_name;
    /// True, if the bot can change the group sticker set
    @serdeOptional
    Nullable!(bool) can_set_sticker_set;
    /// For supergroups, the name of the group's custom emoji sticker set. Custom emoji from this set can be used by all users and bots in the group.
    @serdeOptional
    Nullable!(string) custom_emoji_sticker_set_name;
    /// Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    @serdeOptional
    Nullable!(long) linked_chat_id;
    /// For supergroups, the location to which the supergroup is connected
    @serdeOptional
    Nullable!(ChatLocation) location;
    /// For private chats, the rating of the user if any
    @serdeOptional
    Nullable!(UserRating) rating;
    /// For private chats, the first audio added to the profile of the user
    @serdeOptional
    Nullable!(Audio) first_profile_audio;
    /// The color scheme based on a unique gift that must be used for the chat's name, message replies and link previews
    @serdeOptional
    Nullable!(UniqueGiftColors) unique_gift_colors;
    /// The number of Telegram Stars a general user has to pay to send a message to the chat
    @serdeOptional
    Nullable!(long) paid_message_star_count;
    /// The bot that processes join request queries in the chat. The field is only available to chat administrators.
    @serdeOptional
    Nullable!(User) guard_bot;
    /// The Community to which the chat belongs
    @serdeOptional
    Nullable!(Community) community;
}

/++ This object represents a message. +/
struct Message
{
    /// Unique message identifier inside this chat; 0 for ephemeral messages. In specific instances (e.g., a message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent.
    long message_id;
    /// Unique identifier of a message thread or forum topic to which the message belongs; for supergroups and private chats only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Information about the direct messages chat topic that contains the message
    @serdeOptional
    Nullable!(DirectMessagesTopic) direct_messages_topic;
    /// Sender of the message; may be empty for messages sent to channels. For backward compatibility, if the message was sent on behalf of a chat, the field contains a fake sender user in non-channel chats.
    @serdeOptional
    Nullable!(User) from;
    /// Sender of the message when sent on behalf of a chat. For example, the supergroup itself for messages sent by its anonymous administrators or a linked channel for messages automatically forwarded to the channel's discussion group. For backward compatibility, if the message was sent on behalf of a chat, the field from contains a fake sender user in non-channel chats.
    @serdeOptional
    Nullable!(Chat) sender_chat;
    /// If the sender of the message boosted the chat, the number of boosts added by the user
    @serdeOptional
    Nullable!(long) sender_boost_count;
    /// The bot that actually sent the message on behalf of the business account. Available only for outgoing messages sent on behalf of the connected business account.
    @serdeOptional
    Nullable!(User) sender_business_bot;
    /// Tag or custom title of the sender of the message; for supergroups only
    @serdeOptional
    Nullable!(string) sender_tag;
    /// For ephemeral messages, the user who received the message
    @serdeOptional
    Nullable!(User) receiver_user;
    /// For ephemeral messages, identifier of the ephemeral message inside this chat. The identifier may be reused for another ephemeral message after the message is deleted or expires.
    @serdeOptional
    Nullable!(long) ephemeral_message_id;
    /// Date the message was sent in Unix time. It is always a positive number, representing a valid date.
    long date;
    /// The unique identifier for the guest query. Use this identifier with the method answerGuestQuery to send a response message. If non-empty, the message belongs to the chat where the guest bot was summoned, which may not coincide with other existing bot chats sharing the same identifier.
    @serdeOptional
    Nullable!(string) guest_query_id;
    /// Unique identifier of the business connection from which the message was received. If non-empty, the message belongs to a chat of the corresponding business account that is independent from any potential bot chat which might share the same identifier.
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Chat the message belongs to
    Chat chat;
    /// Information about the original message for forwarded messages
    // TODO(telega-generator): family type 'MessageOrigin' can't be deserialized yet
    /// True, if the message is sent to a topic in a forum supergroup or a private chat with the bot
    @serdeOptional
    Nullable!(bool) is_topic_message;
    /// True, if the message is a channel post that was automatically forwarded to the connected discussion group
    @serdeOptional
    Nullable!(bool) is_automatic_forward;
    /// For replies in the same chat and message thread, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply. If the message is a reply to an ephemeral message, then this field may be omitted.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Information about the message that is being replied to, which may come from another chat or forum topic
    @serdeOptional
    Nullable!(ExternalReplyInfo) external_reply;
    /// For replies that quote part of the original message, the quoted part of the message
    @serdeOptional
    Nullable!(TextQuote) quote;
    /// For replies to a story, the original story
    @serdeOptional
    Nullable!(Story) reply_to_story;
    /// Identifier of the specific checklist task that is being replied to
    @serdeOptional
    Nullable!(long) reply_to_checklist_task_id;
    /// Persistent identifier of the specific poll option that is being replied to
    @serdeOptional
    Nullable!(string) reply_to_poll_option_id;
    /// Bot through which the message was sent
    @serdeOptional
    Nullable!(User) via_bot;
    /// For a message sent by a guest bot, this is the user whose original message triggered the bot's response
    @serdeOptional
    Nullable!(User) guest_bot_caller_user;
    /// For a message sent by a guest bot, this is the chat whose original message triggered the bot's response
    @serdeOptional
    Nullable!(Chat) guest_bot_caller_chat;
    /// Date the message was last edited in Unix time
    @serdeOptional
    Nullable!(long) edit_date;
    /// True, if the message can't be forwarded
    @serdeOptional
    Nullable!(bool) has_protected_content;
    /// True, if the message was sent by an implicit action, for example, as an away or a greeting business message, or as a scheduled message
    @serdeOptional
    Nullable!(bool) is_from_offline;
    /// True, if the message is a paid post. Note that such posts must not be deleted for 24 hours to receive the payment and can't be edited.
    @serdeOptional
    Nullable!(bool) is_paid_post;
    /// The unique identifier inside this chat of a media message group this message belongs to
    @serdeOptional
    Nullable!(string) media_group_id;
    /// Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
    @serdeOptional
    Nullable!(string) author_signature;
    /// The number of Telegram Stars that were paid by the sender of the message to send it
    @serdeOptional
    Nullable!(long) paid_star_count;
    /// For text messages, the actual UTF-8 text of the message
    @serdeOptional
    Nullable!(string) text;
    /// For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Options used for link preview generation for the message, if it is a text message and link preview options were changed
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
    /// Information about suggested post parameters if the message is a suggested post in a channel direct messages chat. If the message is an approved or declined suggested post, then it can't be edited.
    @serdeOptional
    Nullable!(SuggestedPostInfo) suggested_post_info;
    /// Unique identifier of the message effect added to the message
    @serdeOptional
    Nullable!(string) effect_id;
    /// Message is a rich formatted message
    @serdeOptional
    Nullable!(RichMessage) rich_message;
    /// Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set.
    @serdeOptional
    Nullable!(Animation) animation;
    /// Message is an audio file, information about the file
    @serdeOptional
    Nullable!(Audio) audio;
    /// Message is a general file, information about the file
    @serdeOptional
    Nullable!(Document) document;
    /// Message is a live photo, information about the live photo. For backward compatibility, when this field is set, the photo field will also be set.
    @serdeOptional
    Nullable!(LivePhoto) live_photo;
    /// Message contains paid media; information about the paid media
    @serdeOptional
    Nullable!(PaidMediaInfo) paid_media;
    /// Message is a photo, available sizes of the photo
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
    /// Message is a sticker, information about the sticker
    @serdeOptional
    Nullable!(Sticker) sticker;
    /// Message is a forwarded story
    @serdeOptional
    Nullable!(Story) story;
    /// Message is a video, information about the video
    @serdeOptional
    Nullable!(Video) video;
    /// Message is a video note, information about the video message
    @serdeOptional
    Nullable!(VideoNote) video_note;
    /// Message is a voice message, information about the file
    @serdeOptional
    Nullable!(Voice) voice;
    /// Caption for the animation, audio, document, paid media, photo, video or voice
    @serdeOptional
    Nullable!(string) caption;
    /// For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// True, if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// True, if the message media is covered by a spoiler animation
    @serdeOptional
    Nullable!(bool) has_media_spoiler;
    /// Message is a checklist
    @serdeOptional
    Nullable!(Checklist) checklist;
    /// Message is a shared contact, information about the contact
    @serdeOptional
    Nullable!(Contact) contact;
    /// Message is a dice with random value
    @serdeOptional
    Nullable!(Dice) dice;
    /// Message is a game, information about the game. More about games »
    @serdeOptional
    Nullable!(Game) game;
    /// Message is a native poll, information about the poll
    @serdeOptional
    Nullable!(Poll) poll;
    /// Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set.
    @serdeOptional
    Nullable!(Venue) venue;
    /// Message is a shared location, information about the location
    @serdeOptional
    Nullable!(Location) location;
    /// New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    @serdeOptional
    Nullable!(User[]) new_chat_members;
    /// A member was removed from the group, information about them (this member may be the bot itself)
    @serdeOptional
    Nullable!(User) left_chat_member;
    /// Service message: chat owner has left
    @serdeOptional
    Nullable!(ChatOwnerLeft) chat_owner_left;
    /// Service message: chat owner has changed
    @serdeOptional
    Nullable!(ChatOwnerChanged) chat_owner_changed;
    /// A chat title was changed to this value
    @serdeOptional
    Nullable!(string) new_chat_title;
    /// A chat photo was change to this value
    @serdeOptional
    Nullable!(PhotoSize[]) new_chat_photo;
    /// Service message: the chat photo was deleted
    @serdeOptional
    Nullable!(bool) delete_chat_photo;
    /// Service message: the group has been created
    @serdeOptional
    Nullable!(bool) group_chat_created;
    /// Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    @serdeOptional
    Nullable!(bool) supergroup_chat_created;
    /// Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    @serdeOptional
    Nullable!(bool) channel_chat_created;
    /// Service message: auto-delete timer settings changed in the chat
    @serdeOptional
    Nullable!(MessageAutoDeleteTimerChanged) message_auto_delete_timer_changed;
    /// The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    @serdeOptional
    Nullable!(long) migrate_to_chat_id;
    /// The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    @serdeOptional
    Nullable!(long) migrate_from_chat_id;
    /// Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    // TODO(telega-generator): family type 'MaybeInaccessibleMessage' can't be deserialized yet
    /// Message is an invoice for a payment, information about the invoice. More about payments »
    @serdeOptional
    Nullable!(Invoice) invoice;
    /// Message is a service message about a successful payment, information about the payment. More about payments »
    @serdeOptional
    Nullable!(SuccessfulPayment) successful_payment;
    /// Message is a service message about a refunded payment, information about the payment. More about payments »
    @serdeOptional
    Nullable!(RefundedPayment) refunded_payment;
    /// Service message: users were shared with the bot
    @serdeOptional
    Nullable!(UsersShared) users_shared;
    /// Service message: a chat was shared with the bot
    @serdeOptional
    Nullable!(ChatShared) chat_shared;
    /// Service message: a regular gift was sent or received
    @serdeOptional
    Nullable!(GiftInfo) gift;
    /// Service message: a unique gift was sent or received
    @serdeOptional
    Nullable!(UniqueGiftInfo) unique_gift;
    /// Service message: upgrade of a gift was purchased after the gift was sent
    @serdeOptional
    Nullable!(GiftInfo) gift_upgrade_sent;
    /// The domain name of the website on which the user has logged in. More about Telegram Login »
    @serdeOptional
    Nullable!(string) connected_website;
    /// Service message: the user allowed the bot to write messages after adding it to the attachment or side menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess
    @serdeOptional
    Nullable!(WriteAccessAllowed) write_access_allowed;
    /// Telegram Passport data
    @serdeOptional
    Nullable!(PassportData) passport_data;
    /// Service message: a user in the chat triggered another user's proximity alert while sharing Live Location
    @serdeOptional
    Nullable!(ProximityAlertTriggered) proximity_alert_triggered;
    /// Service message: user boosted the chat
    @serdeOptional
    Nullable!(ChatBoostAdded) boost_added;
    /// Service message: chat background set
    @serdeOptional
    Nullable!(ChatBackground) chat_background_set;
    /// Service message: some tasks in a checklist were marked as done or not done
    // TODO(telega-generator): recursive reference to 'ChecklistTasksDone' can't be embedded by value
    /// Service message: tasks were added to a checklist
    // TODO(telega-generator): recursive reference to 'ChecklistTasksAdded' can't be embedded by value
    /// Service message: chat added to a Community
    @serdeOptional
    Nullable!(CommunityChatAdded) community_chat_added;
    /// Service message: chat removed from a Community
    @serdeOptional
    Nullable!(CommunityChatRemoved) community_chat_removed;
    /// Service message: the price for paid messages in the corresponding direct messages chat of a channel has changed
    @serdeOptional
    Nullable!(DirectMessagePriceChanged) direct_message_price_changed;
    /// Service message: forum topic created
    @serdeOptional
    Nullable!(ForumTopicCreated) forum_topic_created;
    /// Service message: forum topic edited
    @serdeOptional
    Nullable!(ForumTopicEdited) forum_topic_edited;
    /// Service message: forum topic closed
    @serdeOptional
    Nullable!(ForumTopicClosed) forum_topic_closed;
    /// Service message: forum topic reopened
    @serdeOptional
    Nullable!(ForumTopicReopened) forum_topic_reopened;
    /// Service message: the 'General' forum topic hidden
    @serdeOptional
    Nullable!(GeneralForumTopicHidden) general_forum_topic_hidden;
    /// Service message: the 'General' forum topic unhidden
    @serdeOptional
    Nullable!(GeneralForumTopicUnhidden) general_forum_topic_unhidden;
    /// Service message: a scheduled giveaway was created
    @serdeOptional
    Nullable!(GiveawayCreated) giveaway_created;
    /// The message is a scheduled giveaway message
    @serdeOptional
    Nullable!(Giveaway) giveaway;
    /// A giveaway with public winners was completed
    @serdeOptional
    Nullable!(GiveawayWinners) giveaway_winners;
    /// Service message: a giveaway without public winners was completed
    // TODO(telega-generator): recursive reference to 'GiveawayCompleted' can't be embedded by value
    /// Service message: user created a bot that will be managed by the current bot
    @serdeOptional
    Nullable!(ManagedBotCreated) managed_bot_created;
    /// Service message: the price for paid messages has changed in the chat
    @serdeOptional
    Nullable!(PaidMessagePriceChanged) paid_message_price_changed;
    /// Service message: answer option was added to a poll
    @serdeOptional
    Nullable!(PollOptionAdded) poll_option_added;
    /// Service message: answer option was deleted from a poll
    @serdeOptional
    Nullable!(PollOptionDeleted) poll_option_deleted;
    /// Service message: a suggested post was approved
    // TODO(telega-generator): recursive reference to 'SuggestedPostApproved' can't be embedded by value
    /// Service message: approval of a suggested post has failed
    // TODO(telega-generator): recursive reference to 'SuggestedPostApprovalFailed' can't be embedded by value
    /// Service message: a suggested post was declined
    // TODO(telega-generator): recursive reference to 'SuggestedPostDeclined' can't be embedded by value
    /// Service message: payment for a suggested post was received
    // TODO(telega-generator): recursive reference to 'SuggestedPostPaid' can't be embedded by value
    /// Service message: payment for a suggested post was refunded
    // TODO(telega-generator): recursive reference to 'SuggestedPostRefunded' can't be embedded by value
    /// Service message: video chat scheduled
    @serdeOptional
    Nullable!(VideoChatScheduled) video_chat_scheduled;
    /// Service message: video chat started
    @serdeOptional
    Nullable!(VideoChatStarted) video_chat_started;
    /// Service message: video chat ended
    @serdeOptional
    Nullable!(VideoChatEnded) video_chat_ended;
    /// Service message: new participants invited to a video chat
    @serdeOptional
    Nullable!(VideoChatParticipantsInvited) video_chat_participants_invited;
    /// Service message: data sent by a Web App
    @serdeOptional
    Nullable!(WebAppData) web_app_data;
    /// Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ This object represents a unique message identifier. +/
struct MessageId
{
    /// Unique message identifier. In specific instances (e.g., message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent.
    long message_id;
}

/++ This object describes a message that was deleted or is otherwise inaccessible to the bot. +/
struct InaccessibleMessage
{
    /// Chat the message belonged to
    Chat chat;
    /// Unique message identifier inside the chat
    long message_id;
    /// Always 0. The field can be used to differentiate regular and inaccessible messages.
    long date;
}

alias MaybeInaccessibleMessage = JsonableAlgebraicProxy!(InaccessibleMessage, Message);

/++ This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc. +/
struct MessageEntity
{
    /// Type of the entity. Currently, can be “mention” (@username), “hashtag” (#hashtag or #hashtag@chatusername), “cashtag” ($$USD or $$USD@chatusername), “bot_command” (/start@jobs_bot), “url” (https://telegram.org), “email” (do-not-reply@telegram.org), “phone_number” (+1-212-555-0123), “bold” (bold text), “italic” (italic text), “underline” (underlined text), “strikethrough” (strikethrough text), “spoiler” (spoiler message), “blockquote” (block quotation), “expandable_blockquote” (collapsed-by-default block quotation), “code” (monowidth string), “pre” (monowidth block), “text_link” (for clickable text URLs), “text_mention” (for users without usernames), “custom_emoji” (for inline custom emoji stickers), or “date_time” (for formatted date and time).
    string type;
    /// Offset in UTF-16 code units to the start of the entity
    long offset;
    /// Length of the entity in UTF-16 code units
    long length;
    /// For “text_link” only, URL that will be opened after user taps on the text
    @serdeOptional
    Nullable!(string) url;
    /// For “text_mention” only, the mentioned user
    @serdeOptional
    Nullable!(User) user;
    /// For “pre” only, the programming language of the entity text
    @serdeOptional
    Nullable!(string) language;
    /// For “custom_emoji” only, unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    @serdeOptional
    Nullable!(string) custom_emoji_id;
    /// For “date_time” only, the Unix time associated with the entity
    @serdeOptional
    Nullable!(long) unix_time;
    /// For “date_time” only, the string that defines the formatting of the date and time. See date-time entity formatting for more details.
    @serdeOptional
    Nullable!(string) date_time_format;
}

/++ This object contains information about the quoted part of a message that is replied to by the given message. +/
struct TextQuote
{
    /// Text of the quoted part of a message that is replied to by the given message
    string text;
    /// Special entities that appear in the quote. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are kept in quotes.
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Approximate quote position in the original message in UTF-16 code units as specified by the sender
    long position;
    /// True, if the quote was chosen manually by the message sender. Otherwise, the quote was added automatically by the server.
    @serdeOptional
    Nullable!(bool) is_manual;
}

/++ This object contains information about a message that is being replied to, which may come from another chat or forum topic. +/
struct ExternalReplyInfo
{
    /// Origin of the message replied to by the given message
    // TODO(telega-generator): family type 'MessageOrigin' can't be deserialized yet
    /// Chat the original message belongs to. Available only if the chat is a supergroup or a channel.
    @serdeOptional
    Nullable!(Chat) chat;
    /// Unique message identifier inside the original chat. Available only if the original chat is a supergroup or a channel.
    @serdeOptional
    Nullable!(long) message_id;
    /// Options used for link preview generation for the original message, if it is a text message
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
    /// Message is an animation, information about the animation
    @serdeOptional
    Nullable!(Animation) animation;
    /// Message is an audio file, information about the file
    @serdeOptional
    Nullable!(Audio) audio;
    /// Message is a general file, information about the file
    @serdeOptional
    Nullable!(Document) document;
    /// Message is a live photo, information about the live photo
    @serdeOptional
    Nullable!(LivePhoto) live_photo;
    /// Message contains paid media; information about the paid media
    @serdeOptional
    Nullable!(PaidMediaInfo) paid_media;
    /// Message is a photo, available sizes of the photo
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
    /// Message is a sticker, information about the sticker
    @serdeOptional
    Nullable!(Sticker) sticker;
    /// Message is a forwarded story
    @serdeOptional
    Nullable!(Story) story;
    /// Message is a video, information about the video
    @serdeOptional
    Nullable!(Video) video;
    /// Message is a video note, information about the video message
    @serdeOptional
    Nullable!(VideoNote) video_note;
    /// Message is a voice message, information about the file
    @serdeOptional
    Nullable!(Voice) voice;
    /// True, if the message media is covered by a spoiler animation
    @serdeOptional
    Nullable!(bool) has_media_spoiler;
    /// Message is a checklist
    @serdeOptional
    Nullable!(Checklist) checklist;
    /// Message is a shared contact, information about the contact
    @serdeOptional
    Nullable!(Contact) contact;
    /// Message is a dice with random value
    @serdeOptional
    Nullable!(Dice) dice;
    /// Message is a game, information about the game. More about games »
    @serdeOptional
    Nullable!(Game) game;
    /// Message is a scheduled giveaway, information about the giveaway
    @serdeOptional
    Nullable!(Giveaway) giveaway;
    /// A giveaway with public winners was completed
    @serdeOptional
    Nullable!(GiveawayWinners) giveaway_winners;
    /// Message is an invoice for a payment, information about the invoice. More about payments »
    @serdeOptional
    Nullable!(Invoice) invoice;
    /// Message is a shared location, information about the location
    @serdeOptional
    Nullable!(Location) location;
    /// Message is a native poll, information about the poll
    @serdeOptional
    Nullable!(Poll) poll;
    /// Message is a venue, information about the venue
    @serdeOptional
    Nullable!(Venue) venue;
}

/++ Describes reply parameters for the message that is being sent. +/
struct ReplyParameters
{
    /// Identifier of the message that will be replied to in the current chat, or in the chat chat_id if it is specified. Required if ephemeral_message_id isn't specified.
    @serdeOptional
    Nullable!(long) message_id;
    /// If the message to be replied to is from a different chat, unique identifier for the chat or username of the bot, supergroup or channel in the format @username. Not supported for messages sent on behalf of a business account, messages from channel direct messages chats and ephemeral messages.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Identifier of the incoming ephemeral message that will be replied to in the current chat. A reply to an ephemeral message must itself be an ephemeral message. An ephemeral message may only be replied to within 15 seconds of being sent. Required if message_id isn't specified.
    @serdeOptional
    Nullable!(long) ephemeral_message_id;
    /// Pass True if the message should be sent even if the specified message to be replied to is not found. Always False for replies in another chat or forum topic, and sent ephemeral messages. Always True for messages sent on behalf of a business account.
    @serdeOptional
    Nullable!(bool) allow_sending_without_reply;
    /// Quoted part of the message to be replied to; 0-1024 characters after entities parsing. The quote must be an exact substring of the message to be replied to, including bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities. The message will fail to send if the quote isn't found in the original message. Ignored for ephemeral messages.
    @serdeOptional
    Nullable!(string) quote;
    /// Mode for parsing entities in the quote. See formatting options for more details.
    @serdeOptional
    Nullable!(string) quote_parse_mode;
    /// A JSON-serialized list of special entities that appear in the quote. It can be specified instead of quote_parse_mode.
    @serdeOptional
    Nullable!(MessageEntity[]) quote_entities;
    /// Position of the quote in the original message in UTF-16 code units
    @serdeOptional
    Nullable!(long) quote_position;
    /// Identifier of the specific checklist task to be replied to
    @serdeOptional
    Nullable!(long) checklist_task_id;
    /// Persistent identifier of the specific poll option to be replied to
    @serdeOptional
    Nullable!(string) poll_option_id;
}

alias MessageOrigin = JsonableAlgebraicProxy!(MessageOriginChannel, MessageOriginChat, MessageOriginHiddenUser, MessageOriginUser);

/++ The message was originally sent by a known user. +/
struct MessageOriginUser
{
    /// Type of the message origin, always “user”
    string type;
    /// Date the message was sent originally in Unix time
    long date;
    /// User that sent the message originally
    User sender_user;
}

/++ The message was originally sent by an unknown user. +/
struct MessageOriginHiddenUser
{
    /// Type of the message origin, always “hidden_user”
    string type;
    /// Date the message was sent originally in Unix time
    long date;
    /// Name of the user that sent the message originally
    string sender_user_name;
}

/++ The message was originally sent on behalf of a chat to a group chat. +/
struct MessageOriginChat
{
    /// Type of the message origin, always “chat”
    string type;
    /// Date the message was sent originally in Unix time
    long date;
    /// Chat that sent the message originally
    Chat sender_chat;
    /// For messages originally sent by an anonymous chat administrator, original message author signature
    @serdeOptional
    Nullable!(string) author_signature;
}

/++ The message was originally sent to a channel chat. +/
struct MessageOriginChannel
{
    /// Type of the message origin, always “channel”
    string type;
    /// Date the message was sent originally in Unix time
    long date;
    /// Channel chat to which the message was originally sent
    Chat chat;
    /// Unique message identifier inside the chat
    long message_id;
    /// Signature of the original post author
    @serdeOptional
    Nullable!(string) author_signature;
}

/++ This object represents one size of a photo or a file / sticker thumbnail. +/
struct PhotoSize
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Photo width
    long width;
    /// Photo height
    long height;
    /// File size in bytes
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents an audio file to be treated as music by the Telegram clients. +/
struct Audio
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Duration of the audio in seconds as defined by the sender
    long duration;
    /// Performer of the audio as defined by the sender or by audio tags
    @serdeOptional
    Nullable!(string) performer;
    /// Title of the audio as defined by the sender or by audio tags
    @serdeOptional
    Nullable!(string) title;
    /// Original filename as defined by the sender
    @serdeOptional
    Nullable!(string) file_name;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
    /// Thumbnail of the album cover to which the music file belongs
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
}

/++ This object represents a general file (as opposed to photos, voice messages and audio files). +/
struct Document
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Document thumbnail as defined by the sender
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
    /// Original filename as defined by the sender
    @serdeOptional
    Nullable!(string) file_name;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a live photo. +/
struct LivePhoto
{
    /// Available sizes of the corresponding static photo
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
    /// Identifier for the video file which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for the video file which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Video width as defined by the sender
    long width;
    /// Video height as defined by the sender
    long height;
    /// Duration of the video in seconds as defined by the sender
    long duration;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a story. +/
struct Story
{
    /// Chat that posted the story
    Chat chat;
    /// Unique identifier for the story in the chat
    long id;
}

/++ This object represents a video file of a specific quality. +/
struct VideoQuality
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Video width
    long width;
    /// Video height
    long height;
    /// Codec that was used to encode the video, for example, “h264”, “h265”, or “av01”
    string codec;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a video file. +/
struct Video
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Video width as defined by the sender
    long width;
    /// Video height as defined by the sender
    long height;
    /// Duration of the video in seconds as defined by the sender
    long duration;
    /// Video thumbnail
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
    /// Available sizes of the cover of the video in the message
    @serdeOptional
    Nullable!(PhotoSize[]) cover;
    /// Timestamp in seconds from which the video will play in the message
    @serdeOptional
    Nullable!(long) start_timestamp;
    /// List of available qualities of the video
    @serdeOptional
    Nullable!(VideoQuality[]) qualities;
    /// Original filename as defined by the sender
    @serdeOptional
    Nullable!(string) file_name;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a video message (available in Telegram apps as of v.4.0). +/
struct VideoNote
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Video width and height (diameter of the video message) as defined by the sender
    long length;
    /// Duration of the video in seconds as defined by the sender
    long duration;
    /// Video thumbnail
    @serdeOptional
    Nullable!(PhotoSize) thumbnail;
    /// File size in bytes
    @serdeOptional
    Nullable!(long) file_size;
}

/++ This object represents a voice note. +/
struct Voice
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// Duration of the audio in seconds as defined by the sender
    long duration;
    /// MIME type of the file as defined by the sender
    @serdeOptional
    Nullable!(string) mime_type;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
}

/++ Describes the paid media added to a message. +/
struct PaidMediaInfo
{
    /// The number of Telegram Stars that must be paid to buy access to the media
    long star_count;
    /// Information about the paid media
    // TODO(telega-generator): family type 'PaidMedia[]' can't be deserialized yet
}

alias PaidMedia = JsonableAlgebraicProxy!(PaidMediaLivePhoto, PaidMediaPhoto, PaidMediaPreview, PaidMediaVideo);

/++ The paid media is a live photo. +/
struct PaidMediaLivePhoto
{
    /// Type of the paid media, always “live_photo”
    string type;
    /// The photo
    LivePhoto live_photo;
}

/++ The paid media is a photo. +/
struct PaidMediaPhoto
{
    /// Type of the paid media, always “photo”
    string type;
    /// The photo
    PhotoSize[] photo;
}

/++ The paid media isn't available before the payment. +/
struct PaidMediaPreview
{
    /// Type of the paid media, always “preview”
    string type;
    /// Media width as defined by the sender
    @serdeOptional
    Nullable!(long) width;
    /// Media height as defined by the sender
    @serdeOptional
    Nullable!(long) height;
    /// Duration of the media in seconds as defined by the sender
    @serdeOptional
    Nullable!(long) duration;
}

/++ The paid media is a video. +/
struct PaidMediaVideo
{
    /// Type of the paid media, always “video”
    string type;
    /// The video
    Video video;
}

/++ This object represents a phone contact. +/
struct Contact
{
    /// Contact's phone number
    string phone_number;
    /// Contact's first name
    string first_name;
    /// Contact's last name
    @serdeOptional
    Nullable!(string) last_name;
    /// Contact's user identifier in Telegram. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    @serdeOptional
    Nullable!(long) user_id;
    /// Additional data about the contact in the form of a vCard
    @serdeOptional
    Nullable!(string) vcard;
}

/++ This object represents an animated emoji that displays a random value. +/
struct Dice
{
    /// Emoji on which the dice throw animation is based
    string emoji;
    /// Value of the dice, 1-6 for “”, “” and “” base emoji, 1-5 for “” and “” base emoji, 1-64 for “” base emoji
    long value;
}

/++ Represents an HTTP link. +/
struct Link
{
    /// URL of the link
    string url;
}

alias InputPollMedia = JsonableAlgebraicProxy!(InputMediaAnimation, InputMediaAudio, InputMediaDocument, InputMediaLivePhoto, InputMediaLocation, InputMediaPhoto, InputMediaVenue, InputMediaVideo);

/++ Describes a task in a checklist. +/
struct ChecklistTask
{
    /// Unique identifier of the task
    long id;
    /// Text of the task
    string text;
    /// Special entities that appear in the task text
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
    /// User that completed the task; omitted if the task wasn't completed by a user
    @serdeOptional
    Nullable!(User) completed_by_user;
    /// Chat that completed the task; omitted if the task wasn't completed by a chat
    @serdeOptional
    Nullable!(Chat) completed_by_chat;
    /// Point in time (Unix timestamp) when the task was completed; 0 if the task wasn't completed
    @serdeOptional
    Nullable!(long) completion_date;
}

/++ Describes a checklist. +/
struct Checklist
{
    /// Title of the checklist
    string title;
    /// Special entities that appear in the checklist title
    @serdeOptional
    Nullable!(MessageEntity[]) title_entities;
    /// List of tasks in the checklist
    ChecklistTask[] tasks;
    /// True, if users other than the creator of the list can add tasks to the list
    @serdeOptional
    Nullable!(bool) others_can_add_tasks;
    /// True, if users other than the creator of the list can mark tasks as done or not done
    @serdeOptional
    Nullable!(bool) others_can_mark_tasks_as_done;
}

/++ Describes a task to add to a checklist. +/
struct InputChecklistTask
{
    /// Unique identifier of the task; must be positive and unique among all task identifiers currently present in the checklist
    long id;
    /// Text of the task; 1-100 characters after entities parsing
    string text;
    /// Mode for parsing entities in the text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the text, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are allowed.
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
}

/++ Describes a checklist to create. +/
struct InputChecklist
{
    /// Title of the checklist; 1-255 characters after entities parsing
    string title;
    /// Mode for parsing entities in the title. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the title, which can be specified instead of parse_mode. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are allowed.
    @serdeOptional
    Nullable!(MessageEntity[]) title_entities;
    /// List of 1-30 tasks in the checklist
    InputChecklistTask[] tasks;
    /// Pass True if other users can add tasks to the checklist
    @serdeOptional
    Nullable!(bool) others_can_add_tasks;
    /// Pass True if other users can mark tasks as done or not done in the checklist
    @serdeOptional
    Nullable!(bool) others_can_mark_tasks_as_done;
}

/++ This object represents a point on the map. +/
struct Location
{
    /// Latitude as defined by the sender
    double latitude;
    /// Longitude as defined by the sender
    double longitude;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
    /// Time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only.
    @serdeOptional
    Nullable!(long) live_period;
    /// The direction in which user is moving, in degrees; 1-360. For active live locations only.
    @serdeOptional
    Nullable!(long) heading;
    /// The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only.
    @serdeOptional
    Nullable!(long) proximity_alert_radius;
}

/++ This object represents a venue. +/
struct Venue
{
    /// Venue location. Can't be a live location.
    Location location;
    /// Name of the venue
    string title;
    /// Address of the venue
    string address;
    /// Foursquare identifier of the venue
    @serdeOptional
    Nullable!(string) foursquare_id;
    /// Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    @serdeOptional
    Nullable!(string) foursquare_type;
    /// Google Places identifier of the venue
    @serdeOptional
    Nullable!(string) google_place_id;
    /// Google Places type of the venue. (See supported types.)
    @serdeOptional
    Nullable!(string) google_place_type;
}

/++ Describes data sent from a Web App to the bot. +/
struct WebAppData
{
    /// The data. Be aware that a bad client can send arbitrary data in this field.
    string data;
    /// Text of the web_app keyboard button from which the Web App was opened. Be aware that a bad client can send arbitrary data in this field.
    string button_text;
}

/++ This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user. +/
struct ProximityAlertTriggered
{
    /// User that triggered the alert
    User traveler;
    /// User that set the alert
    User watcher;
    /// The distance between the users
    long distance;
}

/++ This object represents a service message about a change in auto-delete timer settings. +/
struct MessageAutoDeleteTimerChanged
{
    /// New auto-delete time for messages in the chat; in seconds
    long message_auto_delete_time;
}

/++ This object contains information about the bot that was created to be managed by the current bot. +/
struct ManagedBotCreated
{
    /// Information about the bot. The bot's token can be fetched using the method getManagedBotToken.
    User bot;
}

/++ This object contains information about the creation, token update, or owner update of a bot that is managed by the current bot. +/
struct ManagedBotUpdated
{
    /// User that created the bot
    User user;
    /// Information about the bot. Token of the bot can be fetched using the method getManagedBotToken.
    User bot;
}

/++ This object contains information about changes to a user payment subscription toward the current bot. +/
struct BotSubscriptionUpdated
{
    /// User who subscribed for payments toward the bot
    User user;
    /// Bot-specified invoice payload
    string invoice_payload;
    /// The new state of the subscription. Currently, it can be one of “canceled” if the user canceled the subscription, “active” if the user re-enabled a previously canceled subscription, or “failed” if payment for the subscription failed.
    string state;
}

/++ Describes a service message about an option added to a poll. +/
struct PollOptionAdded
{
    /// Message containing the poll to which the option was added, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): family type 'MaybeInaccessibleMessage' can't be deserialized yet
    /// Unique identifier of the added option
    string option_persistent_id;
    /// Option text
    string option_text;
    /// Special entities that appear in the option_text
    @serdeOptional
    Nullable!(MessageEntity[]) option_text_entities;
}

/++ Describes a service message about an option deleted from a poll. +/
struct PollOptionDeleted
{
    /// Message containing the poll from which the option was deleted, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): family type 'MaybeInaccessibleMessage' can't be deserialized yet
    /// Unique identifier of the deleted option
    string option_persistent_id;
    /// Option text
    string option_text;
    /// Special entities that appear in the option_text
    @serdeOptional
    Nullable!(MessageEntity[]) option_text_entities;
}

/++ This object represents a service message about a user boosting a chat. +/
struct ChatBoostAdded
{
    /// Number of boosts added by the user
    long boost_count;
}

alias BackgroundFill = JsonableAlgebraicProxy!(BackgroundFillFreeformGradient, BackgroundFillGradient, BackgroundFillSolid);

/++ The background is filled using the selected color. +/
struct BackgroundFillSolid
{
    /// Type of the background fill, always “solid”
    string type;
    /// The color of the background fill in the RGB24 format
    long color;
}

/++ The background is a gradient fill. +/
struct BackgroundFillGradient
{
    /// Type of the background fill, always “gradient”
    string type;
    /// Top color of the gradient in the RGB24 format
    long top_color;
    /// Bottom color of the gradient in the RGB24 format
    long bottom_color;
    /// Clockwise rotation angle of the background fill in degrees; 0-359
    long rotation_angle;
}

/++ The background is a freeform gradient that rotates after every message in the chat. +/
struct BackgroundFillFreeformGradient
{
    /// Type of the background fill, always “freeform_gradient”
    string type;
    /// A list of the 3 or 4 base colors that are used to generate the freeform gradient in the RGB24 format
    long[] colors;
}

alias BackgroundType = JsonableAlgebraicProxy!(BackgroundTypeChatTheme, BackgroundTypeFill, BackgroundTypePattern, BackgroundTypeWallpaper);

/++ The background is automatically filled based on the selected colors. +/
struct BackgroundTypeFill
{
    /// Type of the background, always “fill”
    string type;
    /// The background fill
    // TODO(telega-generator): family type 'BackgroundFill' can't be deserialized yet
    /// Dimming of the background in dark themes, as a percentage; 0-100
    long dark_theme_dimming;
}

/++ The background is a wallpaper in the JPEG format. +/
struct BackgroundTypeWallpaper
{
    /// Type of the background, always “wallpaper”
    string type;
    /// Document with the wallpaper
    Document document;
    /// Dimming of the background in dark themes, as a percentage; 0-100
    long dark_theme_dimming;
    /// True, if the wallpaper is downscaled to fit in a 450x450 square and then box-blurred with radius 12
    @serdeOptional
    Nullable!(bool) is_blurred;
    /// True, if the background moves slightly when the device is tilted
    @serdeOptional
    Nullable!(bool) is_moving;
}

/++ The background is a .PNG or .TGV (gzipped subset of SVG with MIME type “application/x-tgwallpattern”) pattern to be combined with the background fill chosen by the user. +/
struct BackgroundTypePattern
{
    /// Type of the background, always “pattern”
    string type;
    /// Document with the pattern
    Document document;
    /// The background fill that is combined with the pattern
    // TODO(telega-generator): family type 'BackgroundFill' can't be deserialized yet
    /// Intensity of the pattern when it is shown above the filled background; 0-100
    long intensity;
    /// True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only.
    @serdeOptional
    Nullable!(bool) is_inverted;
    /// True, if the background moves slightly when the device is tilted
    @serdeOptional
    Nullable!(bool) is_moving;
}

/++ The background is taken directly from a built-in chat theme. +/
struct BackgroundTypeChatTheme
{
    /// Type of the background, always “chat_theme”
    string type;
    /// Name of the chat theme, which is usually an emoji
    string theme_name;
}

/++ This object represents a chat background. +/
struct ChatBackground
{
    /// Type of the background
    // TODO(telega-generator): family type 'BackgroundType' can't be deserialized yet
}

/++ Describes a service message about checklist tasks marked as done or not done. +/
struct ChecklistTasksDone
{
    /// Message containing the checklist whose tasks were marked as done or not done. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Identifiers of the tasks that were marked as done
    @serdeOptional
    Nullable!(long[]) marked_as_done_task_ids;
    /// Identifiers of the tasks that were marked as not done
    @serdeOptional
    Nullable!(long[]) marked_as_not_done_task_ids;
}

/++ Describes a service message about tasks added to a checklist. +/
struct ChecklistTasksAdded
{
    /// Message containing the checklist to which the tasks were added. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// List of tasks added to the checklist
    ChecklistTask[] tasks;
}

/++ Describes a service message about a chat being added to a community. +/
struct CommunityChatAdded
{
    /// The new community to which the chat belongs
    Community community;
}

struct CommunityChatRemoved
{
}

/++ This object represents a service message about a new forum topic created in the chat. +/
struct ForumTopicCreated
{
    /// Name of the topic
    string name;
    /// Color of the topic icon in RGB format
    long icon_color;
    /// Unique identifier of the custom emoji shown as the topic icon
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
    /// True, if the name of the topic wasn't specified explicitly by its creator and likely needs to be changed by the bot
    @serdeOptional
    Nullable!(bool) is_name_implicit;
}

struct ForumTopicClosed
{
}

/++ This object represents a service message about an edited forum topic. +/
struct ForumTopicEdited
{
    /// New name of the topic, if it was edited
    @serdeOptional
    Nullable!(string) name;
    /// New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
}

struct ForumTopicReopened
{
}

struct GeneralForumTopicHidden
{
}

struct GeneralForumTopicUnhidden
{
}

/++ This object contains information about a user that was shared with the bot using a KeyboardButtonRequestUsers button. +/
struct SharedUser
{
    /// Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so 64-bit integers or double-precision float types are safe for storing these identifiers. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means.
    long user_id;
    /// First name of the user, if the name was requested by the bot
    @serdeOptional
    Nullable!(string) first_name;
    /// Last name of the user, if the name was requested by the bot
    @serdeOptional
    Nullable!(string) last_name;
    /// Username of the user, if the username was requested by the bot
    @serdeOptional
    Nullable!(string) username;
    /// Available sizes of the chat photo, if the photo was requested by the bot
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
}

/++ This object contains information about the users whose identifiers were shared with the bot using a KeyboardButtonRequestUsers button. +/
struct UsersShared
{
    /// Identifier of the request
    long request_id;
    /// Information about users shared with the bot
    SharedUser[] users;
}

/++ This object contains information about a chat that was shared with the bot using a KeyboardButtonRequestChat button. +/
struct ChatShared
{
    /// Identifier of the request
    long request_id;
    /// Identifier of the shared chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the chat and could be unable to use this identifier, unless the chat is already known to the bot by some other means.
    long chat_id;
    /// Title of the chat, if the title was requested by the bot
    @serdeOptional
    Nullable!(string) title;
    /// Username of the chat, if the username was requested by the bot and available
    @serdeOptional
    Nullable!(string) username;
    /// Available sizes of the chat photo, if the photo was requested by the bot
    @serdeOptional
    Nullable!(PhotoSize[]) photo;
}

/++ This object represents a service message about a user allowing a bot to write messages after adding it to the attachment menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess. +/
struct WriteAccessAllowed
{
    /// True, if the access was granted after the user accepted an explicit request from a Web App sent by the method requestWriteAccess
    @serdeOptional
    Nullable!(bool) from_request;
    /// Name of the Web App, if the access was granted when the Web App was launched from a link
    @serdeOptional
    Nullable!(string) web_app_name;
    /// True, if the access was granted when the bot was added to the attachment or side menu
    @serdeOptional
    Nullable!(bool) from_attachment_menu;
}

/++ This object represents a service message about a video chat scheduled in the chat. +/
struct VideoChatScheduled
{
    /// Point in time (Unix timestamp) when the video chat is supposed to be started by a chat administrator
    long start_date;
}

struct VideoChatStarted
{
}

/++ This object represents a service message about a video chat ended in the chat. +/
struct VideoChatEnded
{
    /// Video chat duration in seconds
    long duration;
}

/++ This object represents a service message about new members invited to a video chat. +/
struct VideoChatParticipantsInvited
{
    /// New members that were invited to the video chat
    User[] users;
}

/++ Describes a service message about a change in the price of paid messages within a chat. +/
struct PaidMessagePriceChanged
{
    /// The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
    long paid_message_star_count;
}

/++ Describes a service message about a change in the price of direct messages sent to a channel chat. +/
struct DirectMessagePriceChanged
{
    /// True, if direct messages are enabled for the channel chat; False otherwise
    bool are_direct_messages_enabled;
    /// The new number of Telegram Stars that must be paid by users for each direct message sent to the channel. Does not apply to users who have been exempted by administrators. Defaults to 0.
    @serdeOptional
    Nullable!(long) direct_message_star_count;
}

/++ Describes a service message about the approval of a suggested post. +/
struct SuggestedPostApproved
{
    /// Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Amount paid for the post
    @serdeOptional
    Nullable!(SuggestedPostPrice) price;
    /// Date when the post will be published
    long send_date;
}

/++ Describes a service message about the failed approval of a suggested post. Currently, only caused by insufficient user funds at the time of approval. +/
struct SuggestedPostApprovalFailed
{
    /// Message containing the suggested post whose approval has failed. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Expected price of the post
    SuggestedPostPrice price;
}

/++ Describes a service message about the rejection of a suggested post. +/
struct SuggestedPostDeclined
{
    /// Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Comment with which the post was declined
    @serdeOptional
    Nullable!(string) comment;
}

/++ Describes a service message about a successful payment for a suggested post. +/
struct SuggestedPostPaid
{
    /// Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Currency in which the payment was made. Currently, one of “XTR” for Telegram Stars or “TON” for TON grams.
    string currency;
    /// The amount of the currency that was received by the channel in nanograms; for payments in TON grams only
    @serdeOptional
    Nullable!(long) amount;
    /// The amount of Telegram Stars that was received by the channel; for payments in Telegram Stars only
    @serdeOptional
    Nullable!(StarAmount) star_amount;
}

/++ Describes a service message about a payment refund for a suggested post. +/
struct SuggestedPostRefunded
{
    /// Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// Reason for the refund. Currently, one of “post_deleted” if the post was deleted within 24 hours of being posted or removed from scheduled messages without being posted, or “payment_refunded” if the payer refunded their payment.
    string reason;
}

/++ This object represents a service message about the creation of a scheduled giveaway. +/
struct GiveawayCreated
{
    /// The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    @serdeOptional
    Nullable!(long) prize_star_count;
}

/++ This object represents a message about a scheduled giveaway. +/
struct Giveaway
{
    /// The list of chats which the user must join to participate in the giveaway
    Chat[] chats;
    /// Point in time (Unix timestamp) when winners of the giveaway will be selected
    long winners_selection_date;
    /// The number of users which are supposed to be selected as winners of the giveaway
    long winner_count;
    /// True, if only users who join the chats after the giveaway started should be eligible to win
    @serdeOptional
    Nullable!(bool) only_new_members;
    /// True, if the list of giveaway winners will be visible to everyone
    @serdeOptional
    Nullable!(bool) has_public_winners;
    /// Description of additional giveaway prize
    @serdeOptional
    Nullable!(string) prize_description;
    /// A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which eligible users for the giveaway must come. If empty, then all users can participate in the giveaway. Users with a phone number that was bought on Fragment can always participate in giveaways.
    @serdeOptional
    Nullable!(string[]) country_codes;
    /// The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    @serdeOptional
    Nullable!(long) prize_star_count;
    /// The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only
    @serdeOptional
    Nullable!(long) premium_subscription_month_count;
}

/++ This object represents a message about the completion of a giveaway with public winners. +/
struct GiveawayWinners
{
    /// The chat that created the giveaway
    Chat chat;
    /// Identifier of the message with the giveaway in the chat
    long giveaway_message_id;
    /// Point in time (Unix timestamp) when winners of the giveaway were selected
    long winners_selection_date;
    /// Total number of winners in the giveaway
    long winner_count;
    /// List of up to 100 winners of the giveaway
    User[] winners;
    /// The number of other chats the user had to join in order to be eligible for the giveaway
    @serdeOptional
    Nullable!(long) additional_chat_count;
    /// The number of Telegram Stars that were split between giveaway winners; for Telegram Star giveaways only
    @serdeOptional
    Nullable!(long) prize_star_count;
    /// The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only
    @serdeOptional
    Nullable!(long) premium_subscription_month_count;
    /// Number of undistributed prizes
    @serdeOptional
    Nullable!(long) unclaimed_prize_count;
    /// True, if only users who had joined the chats after the giveaway started were eligible to win
    @serdeOptional
    Nullable!(bool) only_new_members;
    /// True, if the giveaway was canceled because the payment for it was refunded
    @serdeOptional
    Nullable!(bool) was_refunded;
    /// Description of additional giveaway prize
    @serdeOptional
    Nullable!(string) prize_description;
}

/++ This object represents a service message about the completion of a giveaway without public winners. +/
struct GiveawayCompleted
{
    /// Number of winners in the giveaway
    long winner_count;
    /// Number of undistributed prizes
    @serdeOptional
    Nullable!(long) unclaimed_prize_count;
    /// Message with the giveaway that was completed, if it wasn't deleted
    // TODO(telega-generator): recursive reference to 'Message' can't be embedded by value
    /// True, if the giveaway is a Telegram Star giveaway. Otherwise, currently, the giveaway is a Telegram Premium giveaway.
    @serdeOptional
    Nullable!(bool) is_star_giveaway;
}

/++ Describes the options used for link preview generation. +/
struct LinkPreviewOptions
{
    /// True, if the link preview is disabled
    @serdeOptional
    Nullable!(bool) is_disabled;
    /// URL to use for the link preview. If empty, then the first URL found in the message text will be used.
    @serdeOptional
    Nullable!(string) url;
    /// True, if the media in the link preview is supposed to be shrunk; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview
    @serdeOptional
    Nullable!(bool) prefer_small_media;
    /// True, if the media in the link preview is supposed to be enlarged; ignored if the URL isn't explicitly specified or media size change isn't supported for the preview
    @serdeOptional
    Nullable!(bool) prefer_large_media;
    /// True, if the link preview must be shown above the message text; otherwise, the link preview will be shown below the message text
    @serdeOptional
    Nullable!(bool) show_above_text;
}

/++ Describes the price of a suggested post. +/
struct SuggestedPostPrice
{
    /// Currency in which the post will be paid. Currently, must be one of “XTR” for Telegram Stars or “TON” for TON grams.
    string currency;
    /// The amount of the currency that will be paid for the post in the smallest units of the currency, i.e. Telegram Stars or nanograms. Currently, price in Telegram Stars must be between 5 and 100000, and price in nanograms must be between 10000000 and 10000000000000.
    long amount;
}

/++ Contains information about a suggested post. +/
struct SuggestedPostInfo
{
    /// State of the suggested post. Currently, it can be one of “pending”, “approved”, “declined”.
    string state;
    /// Proposed price of the post. If the field is omitted, then the post is unpaid.
    @serdeOptional
    Nullable!(SuggestedPostPrice) price;
    /// Proposed send date of the post. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user or administrator who approves it.
    @serdeOptional
    Nullable!(long) send_date;
}

/++ Contains parameters of a post that is being suggested by the bot. +/
struct SuggestedPostParameters
{
    /// Proposed price for the post. If the field is omitted, then the post is unpaid.
    @serdeOptional
    Nullable!(SuggestedPostPrice) price;
    /// Proposed send date of the post. If specified, then the date must be between 300 second and 2678400 seconds (30 days) in the future. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user who approves it.
    @serdeOptional
    Nullable!(long) send_date;
}

/++ Describes a topic of a direct messages chat. +/
struct DirectMessagesTopic
{
    /// Unique identifier of the topic. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    long topic_id;
    /// Information about the user that created the topic. Currently, it is always present.
    @serdeOptional
    Nullable!(User) user;
}

/++ This object represent a user's profile pictures. +/
struct UserProfilePhotos
{
    /// Total number of profile pictures the target user has
    long total_count;
    /// Requested profile pictures (in up to 4 sizes each)
    PhotoSize[][] photos;
}

/++ This object represents the audios displayed on a user's profile. +/
struct UserProfileAudios
{
    /// Total number of profile audios for the target user
    long total_count;
    /// Requested profile audios
    Audio[] audios;
}

/++
This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.

The maximum file size to download is 20 MB
+/
struct File
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    @serdeOptional
    Nullable!(long) file_size;
    /// File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
    @serdeOptional
    Nullable!(string) file_path;
}

/++ Describes a Web App. +/
struct WebAppInfo
{
    /// An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    string url;
}

/++ This object represents a custom keyboard with reply options (see Introduction to bots for details and examples). Not supported in channels and for messages sent on behalf of a business account. +/
struct ReplyKeyboardMarkup
{
    /// Array of button rows, each represented by an Array of KeyboardButton objects
    KeyboardButton[][] keyboard;
    /// Requests clients to always show the keyboard when the regular keyboard is hidden. Defaults to False, in which case the custom keyboard can be hidden and opened with a keyboard icon.
    @serdeOptional
    Nullable!(bool) is_persistent;
    /// Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to False, in which case the custom keyboard is always of the same height as the app's standard keyboard.
    @serdeOptional
    Nullable!(bool) resize_keyboard;
    /// Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat - the user can press a special button in the input field to see the custom keyboard again. Defaults to False.
    @serdeOptional
    Nullable!(bool) one_time_keyboard;
    /// The placeholder to be shown in the input field when the keyboard is active; 1-64 characters
    @serdeOptional
    Nullable!(string) input_field_placeholder;
    /// Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply to a message in the same chat and forum topic, sender of the original message.Example: A user requests to change the bot's language, bot replies to the request with a keyboard to select the new language. Other users in the group don't see the keyboard.
    @serdeOptional
    Nullable!(bool) selective;
}

/++ This object represents one button of the reply keyboard. At most one of the fields other than text, icon_custom_emoji_id, and style must be used to specify the type of the button. For simple text buttons, String can be used instead of this object to specify the button text. +/
struct KeyboardButton
{
    /// Text of the button. If none of the fields other than text, icon_custom_emoji_id, and style are used, it will be sent as a message when the button is pressed.
    string text;
    /// Unique identifier of the custom emoji shown before the text of the button. Can only be used by bots that purchased additional usernames on Fragment or in the messages directly sent by the bot to private, group and supergroup chats if the owner of the bot has a Telegram Premium subscription.
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
    /// Style of the button. Must be one of “danger” (red), “success” (green) or “primary” (blue). If omitted, then an app-specific style is used.
    @serdeOptional
    Nullable!(string) style;
    /// If specified, pressing the button will open a list of suitable users. Identifiers of selected users will be sent to the bot in a “users_shared” service message. Available in private chats only.
    @serdeOptional
    Nullable!(KeyboardButtonRequestUsers) request_users;
    /// If specified, pressing the button will open a list of suitable chats. Tapping on a chat will send its identifier to the bot in a “chat_shared” service message. Available in private chats only.
    @serdeOptional
    Nullable!(KeyboardButtonRequestChat) request_chat;
    /// If specified, pressing the button will ask the user to create and share a bot that will be managed by the current bot. Available for bots that enabled management of other bots in the @BotFather Mini App. Available in private chats only.
    @serdeOptional
    Nullable!(KeyboardButtonRequestManagedBot) request_managed_bot;
    /// If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only.
    @serdeOptional
    Nullable!(bool) request_contact;
    /// If True, the user's current location will be sent when the button is pressed. Available in private chats only.
    @serdeOptional
    Nullable!(bool) request_location;
    /// If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only.
    @serdeOptional
    Nullable!(KeyboardButtonPollType) request_poll;
    /// If specified, the described Web App will be launched when the button is pressed. The Web App will be able to send a “web_app_data” service message. Available in private chats only.
    @serdeOptional
    Nullable!(WebAppInfo) web_app;
}

/++ This object defines the criteria used to request suitable users. Information about the selected users will be shared with the bot when the corresponding button is pressed. More about requesting users » +/
struct KeyboardButtonRequestUsers
{
    /// Signed 32-bit identifier of the request that will be received back in the UsersShared object. Must be unique within the message.
    long request_id;
    /// Pass True to request bots, pass False to request regular users. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) user_is_bot;
    /// Pass True to request premium users, pass False to request non-premium users. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) user_is_premium;
    /// The maximum number of users to be selected; 1-10. Defaults to 1.
    @serdeOptional
    Nullable!(long) max_quantity;
    /// Pass True to request the users' first and last names
    @serdeOptional
    Nullable!(bool) request_name;
    /// Pass True to request the users' usernames
    @serdeOptional
    Nullable!(bool) request_username;
    /// Pass True to request the users' photos
    @serdeOptional
    Nullable!(bool) request_photo;
}

/++ This object defines the criteria used to request a suitable chat. Information about the selected chat will be shared with the bot when the corresponding button is pressed. The bot will be granted requested rights in the chat if appropriate. More about requesting chats ». +/
struct KeyboardButtonRequestChat
{
    /// Signed 32-bit identifier of the request, which will be received back in the ChatShared object. Must be unique within the message.
    long request_id;
    /// Pass True to request a channel chat, pass False to request a group or a supergroup chat
    bool chat_is_channel;
    /// Pass True to request a forum supergroup, pass False to request a non-forum chat. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) chat_is_forum;
    /// Pass True to request a supergroup or a channel with a username, pass False to request a chat without a username. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) chat_has_username;
    /// Pass True to request a chat owned by the user. Otherwise, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) chat_is_created;
    /// A JSON-serialized object listing the required administrator rights of the user in the chat. The rights must be a superset of bot_administrator_rights. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(ChatAdministratorRights) user_administrator_rights;
    /// A JSON-serialized object listing the required administrator rights of the bot in the chat. The rights must be a subset of user_administrator_rights. If not specified, no additional restrictions are applied.
    @serdeOptional
    Nullable!(ChatAdministratorRights) bot_administrator_rights;
    /// Pass True to request a chat with the bot as a member. Otherwise, no additional restrictions are applied.
    @serdeOptional
    Nullable!(bool) bot_is_member;
    /// Pass True to request the chat's title
    @serdeOptional
    Nullable!(bool) request_title;
    /// Pass True to request the chat's username
    @serdeOptional
    Nullable!(bool) request_username;
    /// Pass True to request the chat's photo
    @serdeOptional
    Nullable!(bool) request_photo;
}

/++ This object defines the parameters for the creation of a managed bot. Information about the created bot will be shared with the bot using the update managed_bot and a Message with the field managed_bot_created. +/
struct KeyboardButtonRequestManagedBot
{
    /// Signed 32-bit identifier of the request. Must be unique within the message.
    long request_id;
    /// Suggested name for the bot
    @serdeOptional
    Nullable!(string) suggested_name;
    /// Suggested username for the bot
    @serdeOptional
    Nullable!(string) suggested_username;
}

/++ This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed. +/
struct KeyboardButtonPollType
{
    /// If quiz is passed, the user will be allowed to create only polls in the quiz mode. If regular is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type.
    @serdeOptional
    Nullable!(string) type;
}

/++ Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup). Not supported in channels and for messages sent on behalf of a business account. +/
struct ReplyKeyboardRemove
{
    /// Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)
    bool remove_keyboard;
    /// Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply to a message in the same chat and forum topic, sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
    @serdeOptional
    Nullable!(bool) selective;
}

/++ This object represents an inline keyboard that appears right next to the message it belongs to. +/
struct InlineKeyboardMarkup
{
    /// Array of button rows, each represented by an Array of InlineKeyboardButton objects
    InlineKeyboardButton[][] inline_keyboard;
}

/++ This object represents one button of an inline keyboard. Exactly one of the fields other than text, icon_custom_emoji_id, and style must be used to specify the type of the button. +/
struct InlineKeyboardButton
{
    /// Label text on the button
    string text;
    /// Unique identifier of the custom emoji shown before the text of the button. Can only be used by bots that purchased additional usernames on Fragment or in the messages directly sent by the bot to private, group and supergroup chats if the owner of the bot has a Telegram Premium subscription.
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
    /// Style of the button. Must be one of “danger” (red), “success” (green) or “primary” (blue). If omitted, then an app-specific style is used.
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
    /// An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
    @serdeOptional
    Nullable!(LoginUrl) login_url;
    /// If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(string) switch_inline_query;
    /// If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat - good for selecting something from multiple options. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(string) switch_inline_query_current_chat;
    /// If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    @serdeOptional
    Nullable!(SwitchInlineQueryChosenChat) switch_inline_query_chosen_chat;
    /// Description of the button that copies the specified text to the clipboard
    @serdeOptional
    Nullable!(CopyTextButton) copy_text;
    /// Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.
    @serdeOptional
    Nullable!(CallbackGame) callback_game;
    /// Specify True, to send a Pay button. Substrings “” and “XTR” in the buttons's text will be replaced with a Telegram Star icon.NOTE: This type of button must always be the first button in the first row and can only be used in invoice messages.
    @serdeOptional
    Nullable!(bool) pay;
}

/++
This object represents a parameter of the inline keyboard button used to automatically authorize a user. Serves as a great replacement for the Telegram Login Widget when the user is coming from Telegram. All the user needs to do is tap/click a button and confirm that they want to log in:

Telegram apps support these buttons as of version 5.7.

Sample bot: @discussbot
+/
struct LoginUrl
{
    /// An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed. If the user refuses to provide authorization data, the original URL without information about the user will be opened. The data added is the same as described in Receiving authorization data.NOTE: You must always check the hash of the received data to verify the authentication and the integrity of the data as described in Checking authorization.
    string url;
    /// New text of the button in forwarded messages
    @serdeOptional
    Nullable!(string) forward_text;
    /// Username of a bot, which will be used for user authorization. See Setting up a bot for more details. If not specified, the current bot's username will be assumed. The url's domain must be the same as the domain linked with the bot. See Linking your domain to the bot for more details.
    @serdeOptional
    Nullable!(string) bot_username;
    /// Pass True to request the permission for your bot to send messages to the user
    @serdeOptional
    Nullable!(bool) request_write_access;
}

/++ This object represents an inline button that switches the current user to inline mode in a chosen chat, with an optional default inline query. +/
struct SwitchInlineQueryChosenChat
{
    /// The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted.
    @serdeOptional
    Nullable!(string) query;
    /// True, if private chats with users can be chosen
    @serdeOptional
    Nullable!(bool) allow_user_chats;
    /// True, if private chats with bots can be chosen
    @serdeOptional
    Nullable!(bool) allow_bot_chats;
    /// True, if group and supergroup chats can be chosen
    @serdeOptional
    Nullable!(bool) allow_group_chats;
    /// True, if channel chats can be chosen
    @serdeOptional
    Nullable!(bool) allow_channel_chats;
}

/++ This object represents an inline keyboard button that copies specified text to the clipboard. +/
struct CopyTextButton
{
    /// The text to be copied to the clipboard; 1-256 characters
    string text;
}

/++
This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.

NOTE: After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery. It is, therefore, necessary to react by calling answerCallbackQuery even if no notification to the user is needed (e.g., without specifying any of the optional parameters).
+/
struct CallbackQuery
{
    /// Unique identifier for this query
    string id;
    /// Sender
    User from;
    /// Message sent by the bot with the callback button that originated the query
    // TODO(telega-generator): family type 'MaybeInaccessibleMessage' can't be deserialized yet
    /// Identifier of the message sent via the bot in inline mode, that originated the query
    @serdeOptional
    Nullable!(string) inline_message_id;
    /// Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    string chat_instance;
    /// Data associated with the callback button. Be aware that the message originated the query can contain no callback buttons with this data.
    @serdeOptional
    Nullable!(string) data;
    /// Short name of a Game to be returned, serves as the unique identifier for the game
    @serdeOptional
    Nullable!(string) game_short_name;
}

/++
Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot's message and tapped 'Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode. Not supported in channels and for messages sent on behalf of a user account.

Example: A poll bot for groups runs in privacy mode (only receives commands, replies to its messages and mentions). There could be two ways to create a new poll: Explain the user how to send a command with parameters (e.g. /newpoll question answer1 answer2). May be appealing for hardcore users but lacks modern day polish. Guide the user through a step-by-step process. 'Please send me your question', 'Cool, now let's add the first answer option', 'Great. Keep adding answer options, then send /done when you're ready'. The last option is definitely more attractive. And if you use ForceReply in your bot's questions, it will receive the user's answers even if it only receives replies, commands and mentions - without any extra work for the user.
+/
struct ForceReply
{
    /// Shows reply interface to the user, as if they manually selected the bot's message and tapped 'Reply'
    bool force_reply;
    /// The placeholder to be shown in the input field when the reply is active; 1-64 characters
    @serdeOptional
    Nullable!(string) input_field_placeholder;
    /// Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply to a message in the same chat and forum topic, sender of the original message.
    @serdeOptional
    Nullable!(bool) selective;
}

/++ Represents a community (a group of chats). +/
struct Community
{
    /// Unique identifier for this community. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    long id;
    /// Name of the community
    string name;
}

/++ This object represents a chat photo. +/
struct ChatPhoto
{
    /// File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    string small_file_id;
    /// Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string small_file_unique_id;
    /// File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    string big_file_id;
    /// Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string big_file_unique_id;
}

/++ Represents an invite link for a chat. +/
struct ChatInviteLink
{
    /// The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with “…”.
    string invite_link;
    /// Creator of the link
    User creator;
    /// True, if users joining the chat via the link need to be approved by chat administrators
    bool creates_join_request;
    /// True, if the link is primary
    bool is_primary;
    /// True, if the link is revoked
    bool is_revoked;
    /// Invite link name
    @serdeOptional
    Nullable!(string) name;
    /// Point in time (Unix timestamp) when the link will expire or has been expired
    @serdeOptional
    Nullable!(long) expire_date;
    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    @serdeOptional
    Nullable!(long) member_limit;
    /// Number of pending join requests created using this link
    @serdeOptional
    Nullable!(long) pending_join_request_count;
    /// The number of seconds the subscription will be active for before the next payment
    @serdeOptional
    Nullable!(long) subscription_period;
    /// The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat using the link
    @serdeOptional
    Nullable!(long) subscription_price;
}

/++ Represents the rights of an administrator in a chat. +/
struct ChatAdministratorRights
{
    /// True, if the user's presence in the chat is hidden
    bool is_anonymous;
    /// True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    bool can_manage_chat;
    /// True, if the administrator can delete messages of other users
    bool can_delete_messages;
    /// True, if the administrator can manage video chats
    bool can_manage_video_chats;
    /// True, if the administrator can restrict, ban or unban chat members, or access supergroup statistics
    bool can_restrict_members;
    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    bool can_promote_members;
    /// True, if the user is allowed to change the chat title, photo and other settings
    bool can_change_info;
    /// True, if the user is allowed to invite new users to the chat
    bool can_invite_users;
    /// True, if the administrator can post stories to the chat
    bool can_post_stories;
    /// True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive
    bool can_edit_stories;
    /// True, if the administrator can delete stories posted by other users
    bool can_delete_stories;
    /// True, if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    @serdeOptional
    Nullable!(bool) can_post_messages;
    /// True, if the administrator can edit messages of other users and can pin messages; for channels only
    @serdeOptional
    Nullable!(bool) can_edit_messages;
    /// True, if the user is allowed to pin messages; for groups and supergroups only
    @serdeOptional
    Nullable!(bool) can_pin_messages;
    /// True, if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    @serdeOptional
    Nullable!(bool) can_manage_topics;
    /// True, if the administrator can manage direct messages of the channel and decline suggested posts; for channels only
    @serdeOptional
    Nullable!(bool) can_manage_direct_messages;
    /// True, if the administrator can edit the tags of regular members; for groups and supergroups only. If omitted, defaults to the value of can_pin_messages.
    @serdeOptional
    Nullable!(bool) can_manage_tags;
}

/++ This object represents changes in the status of a chat member. +/
struct ChatMemberUpdated
{
    /// Chat the user belongs to
    Chat chat;
    /// Performer of the action, which resulted in the change
    User from;
    /// Date the change was done in Unix time
    long date;
    /// Previous information about the chat member
    // TODO(telega-generator): family type 'ChatMember' can't be deserialized yet
    /// New information about the chat member
    // TODO(telega-generator): family type 'ChatMember' can't be deserialized yet
    /// Chat invite link, which was used by the user to join the chat; for joining by invite link events only
    @serdeOptional
    Nullable!(ChatInviteLink) invite_link;
    /// True, if the user joined the chat after sending a direct join request without using an invite link and being approved by an administrator
    @serdeOptional
    Nullable!(bool) via_join_request;
    /// True, if the user joined the chat via a chat folder invite link
    @serdeOptional
    Nullable!(bool) via_chat_folder_invite_link;
}

alias ChatMember = JsonableAlgebraicProxy!(ChatMemberAdministrator, ChatMemberBanned, ChatMemberLeft, ChatMemberMember, ChatMemberOwner, ChatMemberRestricted);

/++ Represents a chat member that owns the chat and has all administrator privileges. +/
struct ChatMemberOwner
{
    /// The member's status in the chat, always “creator”
    string status;
    /// Information about the user
    User user;
    /// True, if the user's presence in the chat is hidden
    bool is_anonymous;
    /// Custom title for this user
    @serdeOptional
    Nullable!(string) custom_title;
}

/++ Represents a chat member that has some additional privileges. +/
struct ChatMemberAdministrator
{
    /// The member's status in the chat, always “administrator”
    string status;
    /// Information about the user
    User user;
    /// True, if the bot is allowed to edit administrator privileges of that user
    bool can_be_edited;
    /// True, if the user's presence in the chat is hidden
    bool is_anonymous;
    /// True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    bool can_manage_chat;
    /// True, if the administrator can delete messages of other users
    bool can_delete_messages;
    /// True, if the administrator can manage video chats
    bool can_manage_video_chats;
    /// True, if the administrator can restrict, ban or unban chat members, or access supergroup statistics
    bool can_restrict_members;
    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    bool can_promote_members;
    /// True, if the user is allowed to change the chat title, photo and other settings
    bool can_change_info;
    /// True, if the user is allowed to invite new users to the chat
    bool can_invite_users;
    /// True, if the administrator can post stories to the chat
    bool can_post_stories;
    /// True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive
    bool can_edit_stories;
    /// True, if the administrator can delete stories posted by other users
    bool can_delete_stories;
    /// True, if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    @serdeOptional
    Nullable!(bool) can_post_messages;
    /// True, if the administrator can edit messages of other users and can pin messages; for channels only
    @serdeOptional
    Nullable!(bool) can_edit_messages;
    /// True, if the user is allowed to pin messages; for groups and supergroups only
    @serdeOptional
    Nullable!(bool) can_pin_messages;
    /// True, if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    @serdeOptional
    Nullable!(bool) can_manage_topics;
    /// True, if the administrator can manage direct messages of the channel and decline suggested posts; for channels only
    @serdeOptional
    Nullable!(bool) can_manage_direct_messages;
    /// True, if the administrator can edit the tags of regular members; for groups and supergroups only. If omitted, defaults to the value of can_pin_messages.
    @serdeOptional
    Nullable!(bool) can_manage_tags;
    /// Custom title for this user
    @serdeOptional
    Nullable!(string) custom_title;
}

/++ Represents a chat member that has no additional privileges or restrictions. +/
struct ChatMemberMember
{
    /// The member's status in the chat, always “member”
    string status;
    /// Tag of the member
    @serdeOptional
    Nullable!(string) tag;
    /// Information about the user
    User user;
    /// Date when the user's subscription will expire; Unix time
    @serdeOptional
    Nullable!(long) until_date;
}

/++ Represents a chat member that is under certain restrictions in the chat. Supergroups only. +/
struct ChatMemberRestricted
{
    /// The member's status in the chat, always “restricted”
    string status;
    /// Tag of the member
    @serdeOptional
    Nullable!(string) tag;
    /// Information about the user
    User user;
    /// True, if the user is a member of the chat at the moment of the request
    bool is_member;
    /// True, if the user is allowed to send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    bool can_send_messages;
    /// True, if the user is allowed to send audios
    bool can_send_audios;
    /// True, if the user is allowed to send documents
    bool can_send_documents;
    /// True, if the user is allowed to send photos
    bool can_send_photos;
    /// True, if the user is allowed to send videos
    bool can_send_videos;
    /// True, if the user is allowed to send video notes
    bool can_send_video_notes;
    /// True, if the user is allowed to send voice notes
    bool can_send_voice_notes;
    /// True, if the user is allowed to send polls and checklists
    bool can_send_polls;
    /// True, if the user is allowed to send animations, games, stickers and use inline bots
    bool can_send_other_messages;
    /// True, if the user is allowed to add web page previews to their messages
    bool can_add_web_page_previews;
    /// True, if the user is allowed to react to messages
    bool can_react_to_messages;
    /// True, if the user is allowed to edit their own tag
    bool can_edit_tag;
    /// True, if the user is allowed to change the chat title, photo and other settings
    bool can_change_info;
    /// True, if the user is allowed to invite new users to the chat
    bool can_invite_users;
    /// True, if the user is allowed to pin messages
    bool can_pin_messages;
    /// True, if the user is allowed to create forum topics
    bool can_manage_topics;
    /// Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever.
    long until_date;
}

/++ Represents a chat member that isn't currently a member of the chat, but may join it themselves. +/
struct ChatMemberLeft
{
    /// The member's status in the chat, always “left”
    string status;
    /// Information about the user
    User user;
}

/++ Represents a chat member that was banned in the chat and can't return to the chat or view chat messages. +/
struct ChatMemberBanned
{
    /// The member's status in the chat, always “kicked”
    string status;
    /// Information about the user
    User user;
    /// Date when restrictions will be lifted for this user; Unix time. If 0, then the user is banned forever.
    long until_date;
}

/++ Represents a join request sent to a chat. +/
struct ChatJoinRequest
{
    /// Chat to which the request was sent
    Chat chat;
    /// User that sent the join request
    User from;
    /// Identifier of a private chat with the user who sent the join request. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot can use this identifier for 5 minutes to send messages until the join request is processed, assuming no other administrator contacted the user.
    long user_chat_id;
    /// Date the request was sent in Unix time
    long date;
    /// Bio of the user
    @serdeOptional
    Nullable!(string) bio;
    /// Chat invite link that was used by the user to send the join request
    @serdeOptional
    Nullable!(ChatInviteLink) invite_link;
    /// Identifier of the join request query; for bots assigned to process join requests only. If present, then the bot must call sendChatJoinRequestWebApp or directly call answerChatJoinRequestQuery within 10 seconds.
    @serdeOptional
    Nullable!(string) query_id;
}

/++ Describes actions that a non-administrator user is allowed to take in a chat. +/
struct ChatPermissions
{
    /// True, if the user is allowed to send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    @serdeOptional
    Nullable!(bool) can_send_messages;
    /// True, if the user is allowed to send audios
    @serdeOptional
    Nullable!(bool) can_send_audios;
    /// True, if the user is allowed to send documents
    @serdeOptional
    Nullable!(bool) can_send_documents;
    /// True, if the user is allowed to send photos
    @serdeOptional
    Nullable!(bool) can_send_photos;
    /// True, if the user is allowed to send videos
    @serdeOptional
    Nullable!(bool) can_send_videos;
    /// True, if the user is allowed to send video notes
    @serdeOptional
    Nullable!(bool) can_send_video_notes;
    /// True, if the user is allowed to send voice notes
    @serdeOptional
    Nullable!(bool) can_send_voice_notes;
    /// True, if the user is allowed to send polls and checklists
    @serdeOptional
    Nullable!(bool) can_send_polls;
    /// True, if the user is allowed to send animations, games, stickers and use inline bots
    @serdeOptional
    Nullable!(bool) can_send_other_messages;
    /// True, if the user is allowed to add web page previews to their messages
    @serdeOptional
    Nullable!(bool) can_add_web_page_previews;
    /// True, if the user is allowed to react to messages. If omitted, defaults to the value of can_send_messages.
    @serdeOptional
    Nullable!(bool) can_react_to_messages;
    /// True, if the user is allowed to edit their own tag. If omitted, defaults to the value of can_pin_messages.
    @serdeOptional
    Nullable!(bool) can_edit_tag;
    /// True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups.
    @serdeOptional
    Nullable!(bool) can_change_info;
    /// True, if the user is allowed to invite new users to the chat
    @serdeOptional
    Nullable!(bool) can_invite_users;
    /// True, if the user is allowed to pin messages. Ignored in public supergroups.
    @serdeOptional
    Nullable!(bool) can_pin_messages;
    /// True, if the user is allowed to create forum topics. If omitted, defaults to the value of can_pin_messages.
    @serdeOptional
    Nullable!(bool) can_manage_topics;
}

/++ Describes the birthdate of a user. +/
struct Birthdate
{
    /// Day of the user's birth; 1-31
    long day;
    /// Month of the user's birth; 1-12
    long month;
    /// Year of the user's birth
    @serdeOptional
    Nullable!(long) year;
}

/++ Contains information about the start page settings of a Telegram Business account. +/
struct BusinessIntro
{
    /// Title text of the business intro
    @serdeOptional
    Nullable!(string) title;
    /// Message text of the business intro
    @serdeOptional
    Nullable!(string) message;
    /// Sticker of the business intro
    @serdeOptional
    Nullable!(Sticker) sticker;
}

/++ Contains information about the location of a Telegram Business account. +/
struct BusinessLocation
{
    /// Address of the business
    string address;
    /// Location of the business
    @serdeOptional
    Nullable!(Location) location;
}

/++ Describes an interval of time during which a business is open. +/
struct BusinessOpeningHoursInterval
{
    /// The minute's sequence number in a week, starting on Monday, marking the start of the time interval during which the business is open; 0 - 7 * 24 * 60
    long opening_minute;
    /// The minute's sequence number in a week, starting on Monday, marking the end of the time interval during which the business is open; 0 - 8 * 24 * 60
    long closing_minute;
}

/++ Describes the opening hours of a business. +/
struct BusinessOpeningHours
{
    /// Unique name of the time zone for which the opening hours are defined
    string time_zone_name;
    /// List of time intervals describing business opening hours
    BusinessOpeningHoursInterval[] opening_hours;
}

/++ This object describes the rating of a user based on their Telegram Star spendings. +/
struct UserRating
{
    /// Current level of the user, indicating their reliability when purchasing digital goods and services. A higher level suggests a more trustworthy customer; a negative level is likely reason for concern.
    long level;
    /// Numerical value of the user's rating; the higher the rating, the better
    long rating;
    /// The rating value required to get the current level
    long current_level_rating;
    /// The rating value required to get to the next level; omitted if the maximum level was reached
    @serdeOptional
    Nullable!(long) next_level_rating;
}

/++ Describes the position of a clickable area within a story. +/
struct StoryAreaPosition
{
    /// The abscissa of the area's center, as a percentage of the media width
    double x_percentage;
    /// The ordinate of the area's center, as a percentage of the media height
    double y_percentage;
    /// The width of the area's rectangle, as a percentage of the media width
    double width_percentage;
    /// The height of the area's rectangle, as a percentage of the media height
    double height_percentage;
    /// The clockwise rotation angle of the rectangle, in degrees; 0-360
    double rotation_angle;
    /// The radius of the rectangle corner rounding, as a percentage of the media width
    double corner_radius_percentage;
}

/++ Describes the physical address of a location. +/
struct LocationAddress
{
    /// The two-letter ISO 3166-1 alpha-2 country code of the country where the location is located
    string country_code;
    /// State of the location
    @serdeOptional
    Nullable!(string) state;
    /// City of the location
    @serdeOptional
    Nullable!(string) city;
    /// Street address of the location
    @serdeOptional
    Nullable!(string) street;
}

alias StoryAreaType = JsonableAlgebraicProxy!(StoryAreaTypeLink, StoryAreaTypeLocation, StoryAreaTypeSuggestedReaction, StoryAreaTypeUniqueGift, StoryAreaTypeWeather);

/++ Describes a story area pointing to a location. Currently, a story can have up to 10 location areas. +/
struct StoryAreaTypeLocation
{
    /// Type of the area, always “location”
    string type;
    /// Location latitude in degrees
    double latitude;
    /// Location longitude in degrees
    double longitude;
    /// Address of the location
    @serdeOptional
    Nullable!(LocationAddress) address;
}

/++ Describes a story area pointing to a suggested reaction. Currently, a story can have up to 5 suggested reaction areas. +/
struct StoryAreaTypeSuggestedReaction
{
    /// Type of the area, always “suggested_reaction”
    string type;
    /// Type of the reaction
    // TODO(telega-generator): family type 'ReactionType' can't be deserialized yet
    /// Pass True if the reaction area has a dark background
    @serdeOptional
    Nullable!(bool) is_dark;
    /// Pass True if reaction area corner is flipped
    @serdeOptional
    Nullable!(bool) is_flipped;
}

/++ Describes a story area pointing to an HTTP or tg:// link. Currently, a story can have up to 3 link areas. +/
struct StoryAreaTypeLink
{
    /// Type of the area, always “link”
    string type;
    /// HTTP or tg:// URL to be opened when the area is clicked
    string url;
}

/++ Describes a story area containing weather information. Currently, a story can have up to 3 weather areas. +/
struct StoryAreaTypeWeather
{
    /// Type of the area, always “weather”
    string type;
    /// Temperature, in degree Celsius
    double temperature;
    /// Emoji representing the weather
    string emoji;
    /// A color of the area background in the ARGB format
    long background_color;
}

/++ Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area. +/
struct StoryAreaTypeUniqueGift
{
    /// Type of the area, always “unique_gift”
    string type;
    /// Unique name of the gift
    string name;
}

/++ Describes a clickable area on a story media. +/
struct StoryArea
{
    /// Position of the area
    StoryAreaPosition position;
    /// Type of the area
    // TODO(telega-generator): family type 'StoryAreaType' can't be deserialized yet
}

/++ Represents a location to which a chat is connected. +/
struct ChatLocation
{
    /// The location to which the supergroup is connected. Can't be a live location.
    Location location;
    /// Location address; 1-64 characters, as defined by the chat owner
    string address;
}

alias ReactionType = JsonableAlgebraicProxy!(ReactionTypeCustomEmoji, ReactionTypeEmoji, ReactionTypePaid);

/++ The reaction is based on an emoji. +/
struct ReactionTypeEmoji
{
    /// Type of the reaction, always “emoji”
    string type;
    /// Reaction emoji. Currently, it can be one of "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "".
    string emoji;
}

/++ The reaction is based on a custom emoji. +/
struct ReactionTypeCustomEmoji
{
    /// Type of the reaction, always “custom_emoji”
    string type;
    /// Custom emoji identifier
    string custom_emoji_id;
}

/++ The reaction is paid. +/
struct ReactionTypePaid
{
    /// Type of the reaction, always “paid”
    string type;
}

/++ Represents a reaction added to a message along with the number of times it was added. +/
struct ReactionCount
{
    /// Type of the reaction
    // TODO(telega-generator): family type 'ReactionType' can't be deserialized yet
    /// Number of times the reaction was added
    long total_count;
}

/++ This object represents a change of a reaction on a message performed by a user. +/
struct MessageReactionUpdated
{
    /// The chat containing the message the user reacted to
    Chat chat;
    /// Unique identifier of the message inside the chat
    long message_id;
    /// The user that changed the reaction, if the user isn't anonymous
    @serdeOptional
    Nullable!(User) user;
    /// The chat on behalf of which the reaction was changed, if the user is anonymous
    @serdeOptional
    Nullable!(Chat) actor_chat;
    /// Date of the change in Unix time
    long date;
    /// Previous list of reaction types that were set by the user
    // TODO(telega-generator): family type 'ReactionType[]' can't be deserialized yet
    /// New list of reaction types that have been set by the user
    // TODO(telega-generator): family type 'ReactionType[]' can't be deserialized yet
}

/++ This object represents reaction changes on a message with anonymous reactions. +/
struct MessageReactionCountUpdated
{
    /// The chat containing the message
    Chat chat;
    /// Unique message identifier inside the chat
    long message_id;
    /// Date of the change in Unix time
    long date;
    /// List of reactions that are present on the message
    ReactionCount[] reactions;
}

/++ This object represents a forum topic. +/
struct ForumTopic
{
    /// Unique identifier of the forum topic
    long message_thread_id;
    /// Name of the topic
    string name;
    /// Color of the topic icon in RGB format
    long icon_color;
    /// Unique identifier of the custom emoji shown as the topic icon
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
    /// True, if the name of the topic wasn't specified explicitly by its creator and likely needs to be changed by the bot
    @serdeOptional
    Nullable!(bool) is_name_implicit;
}

/++ This object describes the background of a gift. +/
struct GiftBackground
{
    /// Center color of the background in RGB format
    long center_color;
    /// Edge color of the background in RGB format
    long edge_color;
    /// Text color of the background in RGB format
    long text_color;
}

/++ This object represents a gift that can be sent by the bot. +/
struct Gift
{
    /// Unique identifier of the gift
    string id;
    /// The sticker that represents the gift
    Sticker sticker;
    /// The number of Telegram Stars that must be paid to send the sticker
    long star_count;
    /// The number of Telegram Stars that must be paid to upgrade the gift to a unique one
    @serdeOptional
    Nullable!(long) upgrade_star_count;
    /// True, if the gift can only be purchased by Telegram Premium subscribers
    @serdeOptional
    Nullable!(bool) is_premium;
    /// True, if the gift can be used (after being upgraded) to customize a user's appearance
    @serdeOptional
    Nullable!(bool) has_colors;
    /// The total number of gifts of this type that can be sent by all users; for limited gifts only
    @serdeOptional
    Nullable!(long) total_count;
    /// The number of remaining gifts of this type that can be sent by all users; for limited gifts only
    @serdeOptional
    Nullable!(long) remaining_count;
    /// The total number of gifts of this type that can be sent by the bot; for limited gifts only
    @serdeOptional
    Nullable!(long) personal_total_count;
    /// The number of remaining gifts of this type that can be sent by the bot; for limited gifts only
    @serdeOptional
    Nullable!(long) personal_remaining_count;
    /// Background of the gift
    @serdeOptional
    Nullable!(GiftBackground) background;
    /// The total number of different unique gifts that can be obtained by upgrading the gift
    @serdeOptional
    Nullable!(long) unique_gift_variant_count;
    /// Information about the chat that published the gift
    @serdeOptional
    Nullable!(Chat) publisher_chat;
}

/++ This object represent a list of gifts. +/
struct Gifts
{
    /// The list of gifts
    Gift[] gifts;
}

/++ This object describes the model of a unique gift. +/
struct UniqueGiftModel
{
    /// Name of the model
    string name;
    /// The sticker that represents the unique gift
    Sticker sticker;
    /// The number of unique gifts that receive this model for every 1000 gift upgrades. Always 0 for crafted gifts.
    long rarity_per_mille;
    /// Rarity of the model if it is a crafted model. Currently, can be “uncommon”, “rare”, “epic”, or “legendary”.
    @serdeOptional
    Nullable!(string) rarity;
}

/++ This object describes the symbol shown on the pattern of a unique gift. +/
struct UniqueGiftSymbol
{
    /// Name of the symbol
    string name;
    /// The sticker that represents the unique gift
    Sticker sticker;
    /// The number of unique gifts that receive this model for every 1000 gifts upgraded
    long rarity_per_mille;
}

/++ This object describes the colors of the backdrop of a unique gift. +/
struct UniqueGiftBackdropColors
{
    /// The color in the center of the backdrop in RGB format
    long center_color;
    /// The color on the edges of the backdrop in RGB format
    long edge_color;
    /// The color to be applied to the symbol in RGB format
    long symbol_color;
    /// The color for the text on the backdrop in RGB format
    long text_color;
}

/++ This object describes the backdrop of a unique gift. +/
struct UniqueGiftBackdrop
{
    /// Name of the backdrop
    string name;
    /// Colors of the backdrop
    UniqueGiftBackdropColors colors;
    /// The number of unique gifts that receive this backdrop for every 1000 gifts upgraded
    long rarity_per_mille;
}

/++ This object contains information about the color scheme for a user's name, message replies and link previews based on a unique gift. +/
struct UniqueGiftColors
{
    /// Custom emoji identifier of the unique gift's model
    string model_custom_emoji_id;
    /// Custom emoji identifier of the unique gift's symbol
    string symbol_custom_emoji_id;
    /// Main color used in light themes; RGB format
    long light_theme_main_color;
    /// List of 1-3 additional colors used in light themes; RGB format
    long[] light_theme_other_colors;
    /// Main color used in dark themes; RGB format
    long dark_theme_main_color;
    /// List of 1-3 additional colors used in dark themes; RGB format
    long[] dark_theme_other_colors;
}

/++ This object describes a unique gift that was upgraded from a regular gift. +/
struct UniqueGift
{
    /// Identifier of the regular gift from which the gift was upgraded
    string gift_id;
    /// Human-readable name of the regular gift from which this unique gift was upgraded
    string base_name;
    /// Unique name of the gift. This name can be used in https://t.me/nft/... links and story areas.
    string name;
    /// Unique number of the upgraded gift among gifts upgraded from the same regular gift
    long number;
    /// Model of the gift
    UniqueGiftModel model;
    /// Symbol of the gift
    UniqueGiftSymbol symbol;
    /// Backdrop of the gift
    UniqueGiftBackdrop backdrop;
    /// True, if the original regular gift was exclusively purchaseable by Telegram Premium subscribers
    @serdeOptional
    Nullable!(bool) is_premium;
    /// True, if the gift was used to craft another gift and isn't available anymore
    @serdeOptional
    Nullable!(bool) is_burned;
    /// True, if the gift is assigned from the TON blockchain and can't be resold or transferred in Telegram
    @serdeOptional
    Nullable!(bool) is_from_blockchain;
    /// The color scheme that can be used by the gift's owner for the chat's name, replies to messages and link previews; for business account gifts and gifts that are currently on sale only
    @serdeOptional
    Nullable!(UniqueGiftColors) colors;
    /// Information about the chat that published the gift
    @serdeOptional
    Nullable!(Chat) publisher_chat;
}

/++ Describes a service message about a regular gift that was sent or received. +/
struct GiftInfo
{
    /// Information about the gift
    Gift gift;
    /// Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    @serdeOptional
    Nullable!(string) owned_gift_id;
    /// Number of Telegram Stars that can be claimed by the receiver by converting the gift; omitted if conversion to Telegram Stars is impossible
    @serdeOptional
    Nullable!(long) convert_star_count;
    /// Number of Telegram Stars that were prepaid for the ability to upgrade the gift
    @serdeOptional
    Nullable!(long) prepaid_upgrade_star_count;
    /// True, if the gift's upgrade was purchased after the gift was sent
    @serdeOptional
    Nullable!(bool) is_upgrade_separate;
    /// True, if the gift can be upgraded to a unique gift
    @serdeOptional
    Nullable!(bool) can_be_upgraded;
    /// Text of the message that was added to the gift
    @serdeOptional
    Nullable!(string) text;
    /// Special entities that appear in the text
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    @serdeOptional
    Nullable!(bool) is_private;
    /// Unique number reserved for this gift when upgraded. See the number field in UniqueGift.
    @serdeOptional
    Nullable!(long) unique_gift_number;
}

/++ Describes a service message about a unique gift that was sent or received. +/
struct UniqueGiftInfo
{
    /// Information about the gift
    UniqueGift gift;
    /// Origin of the gift. Currently, either “upgrade” for gifts upgraded from regular gifts, “transfer” for gifts transferred from other users or channels, “resale” for gifts bought from other users, “gifted_upgrade” for upgrades purchased after the gift was sent, or “offer” for gifts bought or sold through gift purchase offers.
    string origin;
    /// For gifts bought from other users, the currency in which the payment for the gift was done. Currently, one of “XTR” for Telegram Stars or “TON” for TON grams.
    @serdeOptional
    Nullable!(string) last_resale_currency;
    /// For gifts bought from other users, the price paid for the gift in either Telegram Stars or nanograms
    @serdeOptional
    Nullable!(long) last_resale_amount;
    /// Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    @serdeOptional
    Nullable!(string) owned_gift_id;
    /// Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    @serdeOptional
    Nullable!(long) transfer_star_count;
    /// Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now.
    @serdeOptional
    Nullable!(long) next_transfer_date;
}

alias OwnedGift = JsonableAlgebraicProxy!(OwnedGiftRegular, OwnedGiftUnique);

/++ Describes a regular gift owned by a user or a chat. +/
struct OwnedGiftRegular
{
    /// Type of the gift, always “regular”
    string type;
    /// Information about the regular gift
    Gift gift;
    /// Unique identifier of the gift for the bot; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(string) owned_gift_id;
    /// Sender of the gift if it is a known user
    @serdeOptional
    Nullable!(User) sender_user;
    /// Date the gift was sent in Unix time
    long send_date;
    /// Text of the message that was added to the gift
    @serdeOptional
    Nullable!(string) text;
    /// Special entities that appear in the text
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    @serdeOptional
    Nullable!(bool) is_private;
    /// True, if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(bool) is_saved;
    /// True, if the gift can be upgraded to a unique gift; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(bool) can_be_upgraded;
    /// True, if the gift was refunded and isn't available anymore
    @serdeOptional
    Nullable!(bool) was_refunded;
    /// Number of Telegram Stars that can be claimed by the receiver instead of the gift; omitted if the gift cannot be converted to Telegram Stars; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(long) convert_star_count;
    /// Number of Telegram Stars that were paid for the ability to upgrade the gift
    @serdeOptional
    Nullable!(long) prepaid_upgrade_star_count;
    /// True, if the gift's upgrade was purchased after the gift was sent; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(bool) is_upgrade_separate;
    /// Unique number reserved for this gift when upgraded. See the number field in UniqueGift.
    @serdeOptional
    Nullable!(long) unique_gift_number;
}

/++ Describes a unique gift received and owned by a user or a chat. +/
struct OwnedGiftUnique
{
    /// Type of the gift, always “unique”
    string type;
    /// Information about the unique gift
    UniqueGift gift;
    /// Unique identifier of the received gift for the bot; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(string) owned_gift_id;
    /// Sender of the gift if it is a known user
    @serdeOptional
    Nullable!(User) sender_user;
    /// Date the gift was sent in Unix time
    long send_date;
    /// True, if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(bool) is_saved;
    /// True, if the gift can be transferred to another owner; for gifts received on behalf of business accounts only
    @serdeOptional
    Nullable!(bool) can_be_transferred;
    /// Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    @serdeOptional
    Nullable!(long) transfer_star_count;
    /// Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now.
    @serdeOptional
    Nullable!(long) next_transfer_date;
}

/++ Contains the list of gifts received and owned by a user or a chat. +/
struct OwnedGifts
{
    /// The total number of gifts owned by the user or the chat
    long total_count;
    /// The list of gifts
    // TODO(telega-generator): family type 'OwnedGift[]' can't be deserialized yet
    /// Offset for the next request. If empty, then there are no more results.
    @serdeOptional
    Nullable!(string) next_offset;
}

/++ This object describes the access settings of a bot. +/
struct BotAccessSettings
{
    /// True, if only selected users can access the bot. The bot's owner can always access it.
    bool is_access_restricted;
    /// The list of other users who have access to the bot if the access is restricted
    @serdeOptional
    Nullable!(User[]) added_users;
}

/++ This object describes the types of gifts that can be gifted to a user or a chat. +/
struct AcceptedGiftTypes
{
    /// True, if unlimited regular gifts are accepted
    bool unlimited_gifts;
    /// True, if limited regular gifts are accepted
    bool limited_gifts;
    /// True, if unique gifts or gifts that can be upgraded to unique for free are accepted
    bool unique_gifts;
    /// True, if a Telegram Premium subscription is accepted
    bool premium_subscription;
    /// True, if transfers of unique gifts from channels are accepted
    bool gifts_from_channels;
}

/++ Describes an amount of Telegram Stars. +/
struct StarAmount
{
    /// Integer amount of Telegram Stars, rounded to 0; can be negative
    long amount;
    /// The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999; can be negative if and only if amount is non-positive
    @serdeOptional
    Nullable!(long) nanostar_amount;
}

/++ This object represents a bot command. +/
struct BotCommand
{
    /// Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores.
    string command;
    /// Description of the command; 1-256 characters
    string description;
    /// True, if the command sends an ephemeral message, which can be seen only by the sender of the message and the bot
    @serdeOptional
    Nullable!(bool) is_ephemeral;
}

alias BotCommandScope = JsonableAlgebraicProxy!(BotCommandScopeAllChatAdministrators, BotCommandScopeAllGroupChats, BotCommandScopeAllPrivateChats, BotCommandScopeChat, BotCommandScopeChatAdministrators, BotCommandScopeChatMember, BotCommandScopeDefault);

/++ Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user. +/
struct BotCommandScopeDefault
{
    /// Scope type, must be default
    string type;
}

/++ Represents the scope of bot commands, covering all private chats. +/
struct BotCommandScopeAllPrivateChats
{
    /// Scope type, must be all_private_chats
    string type;
}

/++ Represents the scope of bot commands, covering all group and supergroup chats. +/
struct BotCommandScopeAllGroupChats
{
    /// Scope type, must be all_group_chats
    string type;
}

/++ Represents the scope of bot commands, covering all group and supergroup chat administrators. +/
struct BotCommandScopeAllChatAdministrators
{
    /// Scope type, must be all_chat_administrators
    string type;
}

/++ Represents the scope of bot commands, covering a specific chat. +/
struct BotCommandScopeChat
{
    /// Scope type, must be chat
    string type;
    /// Unique identifier for the target chat or username of the target supergroup in the format @username. Channel direct messages chats and channel chats aren't supported.
    ChatId chat_id;
}

/++ Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat. +/
struct BotCommandScopeChatAdministrators
{
    /// Scope type, must be chat_administrators
    string type;
    /// Unique identifier for the target chat or username of the target supergroup in the format @username. Channel direct messages chats and channel chats aren't supported.
    ChatId chat_id;
}

/++ Represents the scope of bot commands, covering a specific member of a group or supergroup chat. +/
struct BotCommandScopeChatMember
{
    /// Scope type, must be chat_member
    string type;
    /// Unique identifier for the target chat or username of the target supergroup in the format @username. Channel direct messages chats and channel chats aren't supported.
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
}

/++ This object represents the bot's name. +/
struct BotName
{
    /// The bot's name
    string name;
}

/++ This object represents the bot's description. +/
struct BotDescription
{
    /// The bot's description
    string description;
}

/++ This object represents the bot's short description. +/
struct BotShortDescription
{
    /// The bot's short description
    string short_description;
}

alias MenuButton = JsonableAlgebraicProxy!(MenuButtonCommands, MenuButtonDefault, MenuButtonWebApp);

/++ Represents a menu button, which opens the bot's list of commands. +/
struct MenuButtonCommands
{
    /// Type of the button, must be commands
    string type;
}

/++ Represents a menu button, which launches a Web App. +/
struct MenuButtonWebApp
{
    /// Type of the button, must be web_app
    string type;
    /// Text on the button
    string text;
    /// Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Alternatively, a t.me link to a Web App of the bot can be specified in the object instead of the Web App's URL, in which case the Web App will be opened as if the user pressed the link.
    WebAppInfo web_app;
}

/++ Describes that no specific value for the menu button was set. +/
struct MenuButtonDefault
{
    /// Type of the button, must be default
    string type;
}

alias ChatBoostSource = JsonableAlgebraicProxy!(ChatBoostSourceGiftCode, ChatBoostSourceGiveaway, ChatBoostSourcePremium);

/++ The boost was obtained by subscribing to Telegram Premium or by gifting a Telegram Premium subscription to another user. +/
struct ChatBoostSourcePremium
{
    /// Source of the boost, always “premium”
    string source;
    /// User that boosted the chat
    User user;
}

/++ The boost was obtained by the creation of Telegram Premium gift codes to boost a chat. Each such code boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription. +/
struct ChatBoostSourceGiftCode
{
    /// Source of the boost, always “gift_code”
    string source;
    /// User for which the gift code was created
    User user;
}

/++ The boost was obtained by the creation of a Telegram Premium or a Telegram Star giveaway. This boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription for Telegram Premium giveaways and prize_star_count / 500 times for one year for Telegram Star giveaways. +/
struct ChatBoostSourceGiveaway
{
    /// Source of the boost, always “giveaway”
    string source;
    /// Identifier of a message in the chat with the giveaway; the message could have been deleted already. May be 0 if the message isn't sent yet.
    long giveaway_message_id;
    /// User that won the prize in the giveaway if any; for Telegram Premium giveaways only
    @serdeOptional
    Nullable!(User) user;
    /// The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    @serdeOptional
    Nullable!(long) prize_star_count;
    /// True, if the giveaway was completed, but there was no user to win the prize
    @serdeOptional
    Nullable!(bool) is_unclaimed;
}

/++ This object contains information about a chat boost. +/
struct ChatBoost
{
    /// Unique identifier of the boost
    string boost_id;
    /// Point in time (Unix timestamp) when the chat was boosted
    long add_date;
    /// Point in time (Unix timestamp) when the boost will automatically expire, unless the booster's Telegram Premium subscription is prolonged
    long expiration_date;
    /// Source of the added boost
    // TODO(telega-generator): family type 'ChatBoostSource' can't be deserialized yet
}

/++ This object represents a boost added to a chat or changed. +/
struct ChatBoostUpdated
{
    /// Chat which was boosted
    Chat chat;
    /// Information about the chat boost
    ChatBoost boost;
}

/++ This object represents a boost removed from a chat. +/
struct ChatBoostRemoved
{
    /// Chat which was boosted
    Chat chat;
    /// Unique identifier of the boost
    string boost_id;
    /// Point in time (Unix timestamp) when the boost was removed
    long remove_date;
    /// Source of the removed boost
    // TODO(telega-generator): family type 'ChatBoostSource' can't be deserialized yet
}

/++ Describes a service message about the chat owner leaving the chat. +/
struct ChatOwnerLeft
{
    /// The user who will become the new owner of the chat if the previous owner does not return to the chat
    @serdeOptional
    Nullable!(User) new_owner;
}

/++ Describes a service message about an ownership change in the chat. +/
struct ChatOwnerChanged
{
    /// The new owner of the chat
    User new_owner;
}

/++ This object represents a list of boosts added to a chat by a user. +/
struct UserChatBoosts
{
    /// The list of boosts added to the chat by the user
    ChatBoost[] boosts;
}

/++ Represents the rights of a business bot. +/
struct BusinessBotRights
{
    /// True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
    @serdeOptional
    Nullable!(bool) can_reply;
    /// True, if the bot can mark incoming private messages as read
    @serdeOptional
    Nullable!(bool) can_read_messages;
    /// True, if the bot can delete messages sent by the bot
    @serdeOptional
    Nullable!(bool) can_delete_sent_messages;
    /// True, if the bot can delete all private messages in managed chats
    @serdeOptional
    Nullable!(bool) can_delete_all_messages;
    /// True, if the bot can edit the first and last name of the business account
    @serdeOptional
    Nullable!(bool) can_edit_name;
    /// True, if the bot can edit the bio of the business account
    @serdeOptional
    Nullable!(bool) can_edit_bio;
    /// True, if the bot can edit the profile photo of the business account
    @serdeOptional
    Nullable!(bool) can_edit_profile_photo;
    /// True, if the bot can edit the username of the business account
    @serdeOptional
    Nullable!(bool) can_edit_username;
    /// True, if the bot can change the privacy settings pertaining to gifts for the business account
    @serdeOptional
    Nullable!(bool) can_change_gift_settings;
    /// True, if the bot can view gifts and the amount of Telegram Stars owned by the business account
    @serdeOptional
    Nullable!(bool) can_view_gifts_and_stars;
    /// True, if the bot can convert regular gifts owned by the business account to Telegram Stars
    @serdeOptional
    Nullable!(bool) can_convert_gifts_to_stars;
    /// True, if the bot can transfer and upgrade gifts owned by the business account
    @serdeOptional
    Nullable!(bool) can_transfer_and_upgrade_gifts;
    /// True, if the bot can transfer Telegram Stars received by the business account to its own account, or use them to upgrade and transfer gifts
    @serdeOptional
    Nullable!(bool) can_transfer_stars;
    /// True, if the bot can post, edit and delete stories on behalf of the business account
    @serdeOptional
    Nullable!(bool) can_manage_stories;
}

/++ Describes the connection of the bot with a business account. +/
struct BusinessConnection
{
    /// Unique identifier of the business connection
    string id;
    /// Business account user that created the business connection
    User user;
    /// Identifier of a private chat with the user who created the business connection. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    long user_chat_id;
    /// Date the connection was established in Unix time
    long date;
    /// Rights of the business bot
    @serdeOptional
    Nullable!(BusinessBotRights) rights;
    /// True, if the connection is active
    bool is_enabled;
}

/++ This object is received when messages are deleted from a connected business account. +/
struct BusinessMessagesDeleted
{
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Information about a chat in the business account. The bot may not have access to the chat or the corresponding user.
    Chat chat;
    /// The list of identifiers of deleted messages in the chat of the business account
    long[] message_ids;
}

/++ Describes an inline message sent by a Web App on behalf of a user. +/
struct SentWebAppMessage
{
    /// Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message.
    @serdeOptional
    Nullable!(string) inline_message_id;
}

/++ Describes an inline message sent by a guest bot. +/
struct SentGuestMessage
{
    /// Identifier of the sent inline message
    string inline_message_id;
}

/++ Describes an inline message to be sent by a user of a Mini App. +/
struct PreparedInlineMessage
{
    /// Unique identifier of the prepared message
    string id;
    /// Expiration date of the prepared message, in Unix time. Expired prepared messages can no longer be used.
    long expiration_date;
}

/++ Describes a keyboard button to be used by a user of a Mini App. +/
struct PreparedKeyboardButton
{
    /// Unique identifier of the keyboard button
    string id;
}

/++ Describes why a request was unsuccessful. +/
struct ResponseParameters
{
    /// The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    @serdeOptional
    Nullable!(long) migrate_to_chat_id;
    /// In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    @serdeOptional
    Nullable!(long) retry_after;
}

alias InputMedia = JsonableAlgebraicProxy!(InputMediaAnimation, InputMediaAudio, InputMediaDocument, InputMediaLivePhoto, InputMediaPhoto, InputMediaVideo);

/++ Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent. +/
struct InputMediaAnimation
{
    /// Type of the media, must be animation
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Caption of the animation to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the animation caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Animation width
    @serdeOptional
    Nullable!(long) width;
    /// Animation height
    @serdeOptional
    Nullable!(long) height;
    /// Animation duration in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Pass True if the animation needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
}

/++ Represents an audio file to be treated as music to be sent. +/
struct InputMediaAudio
{
    /// Type of the media, must be audio
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Caption of the audio to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Duration of the audio in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Performer of the audio
    @serdeOptional
    Nullable!(string) performer;
    /// Title of the audio
    @serdeOptional
    Nullable!(string) title;
}

/++ Represents a general file to be sent. +/
struct InputMediaDocument
{
    /// Type of the media, must be document
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Caption of the document to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the document caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Disables automatic server-side content type detection for files uploaded using multipart/form-data. Always True, if the document is sent as part of an album.
    @serdeOptional
    Nullable!(bool) disable_content_type_detection;
}

/++ Represents an HTTP link to be sent. +/
struct InputMediaLink
{
    /// Type of the media, must be link
    string type;
    /// HTTP URL of the link
    string url;
}

/++ Represents a live photo to be sent. +/
struct InputMediaLivePhoto
{
    /// Type of the media, must be live_photo
    string type;
    /// Video of the live photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string media;
    /// The static photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string photo;
    /// Caption of the live photo to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the live photo caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the live photo needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
}

/++ Represents a location to be sent. +/
struct InputMediaLocation
{
    /// Type of the media, must be location
    string type;
    /// Latitude of the location
    double latitude;
    /// Longitude of the location
    double longitude;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
}

/++ Represents a photo to be sent. +/
struct InputMediaPhoto
{
    /// Type of the media, must be photo
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Caption of the photo to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the photo caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the photo needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
}

/++ Represents a sticker file to be sent. +/
struct InputMediaSticker
{
    /// Type of the media, must be sticker
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a .WEBP sticker from the Internet, or pass “attach://<file_attach_name>” to upload a new .WEBP, .TGS, or .WEBM sticker using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Emoji associated with the sticker; only for just uploaded stickers
    @serdeOptional
    Nullable!(string) emoji;
}

/++ Represents a venue to be sent. +/
struct InputMediaVenue
{
    /// Type of the media, must be venue
    string type;
    /// Latitude of the location
    double latitude;
    /// Longitude of the location
    double longitude;
    /// Name of the venue
    string title;
    /// Address of the venue
    string address;
    /// Foursquare identifier of the venue
    @serdeOptional
    Nullable!(string) foursquare_id;
    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    @serdeOptional
    Nullable!(string) foursquare_type;
    /// Google Places identifier of the venue
    @serdeOptional
    Nullable!(string) google_place_id;
    /// Google Places type of the venue. (See supported types.)
    @serdeOptional
    Nullable!(string) google_place_type;
}

/++ Represents a video to be sent. +/
struct InputMediaVideo
{
    /// Type of the media, must be video
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    @serdeOptional
    Nullable!(string) cover;
    /// Start timestamp for the video in the message
    @serdeOptional
    Nullable!(long) start_timestamp;
    /// Caption of the video to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the video caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Video width
    @serdeOptional
    Nullable!(long) width;
    /// Video height
    @serdeOptional
    Nullable!(long) height;
    /// Video duration in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Pass True if the uploaded video is suitable for streaming
    @serdeOptional
    Nullable!(bool) supports_streaming;
    /// Pass True if the video needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
}

/++ Represents a voice message file to be sent. +/
struct InputMediaVoiceNote
{
    /// Type of the media, must be voice_note
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Caption of the voice message to be sent, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the voice message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// List of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Duration of the voice message in seconds
    @serdeOptional
    Nullable!(long) duration;
}

alias InputPaidMedia = JsonableAlgebraicProxy!(InputPaidMediaLivePhoto, InputPaidMediaPhoto, InputPaidMediaVideo);

/++ The paid media to send is a live photo. +/
struct InputPaidMediaLivePhoto
{
    /// Type of the media, must be live_photo
    string type;
    /// Video of the live photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string media;
    /// The static photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string photo;
}

/++ The paid media to send is a photo. +/
struct InputPaidMediaPhoto
{
    /// Type of the media, must be photo
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
}

/++ The paid media to send is a video. +/
struct InputPaidMediaVideo
{
    /// Type of the media, must be video
    string type;
    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    string media;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    @serdeOptional
    Nullable!(string) cover;
    /// Start timestamp for the video in the message
    @serdeOptional
    Nullable!(long) start_timestamp;
    /// Video width
    @serdeOptional
    Nullable!(long) width;
    /// Video height
    @serdeOptional
    Nullable!(long) height;
    /// Video duration in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Pass True if the uploaded video is suitable for streaming
    @serdeOptional
    Nullable!(bool) supports_streaming;
}

alias InputProfilePhoto = JsonableAlgebraicProxy!(InputProfilePhotoAnimated, InputProfilePhotoStatic);

/++ A static profile photo in the .JPG format. +/
struct InputProfilePhotoStatic
{
    /// Type of the profile photo, must be static
    string type;
    /// The static profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    string photo;
}

/++ An animated profile photo in the MPEG4 format. +/
struct InputProfilePhotoAnimated
{
    /// Type of the profile photo, must be animated
    string type;
    /// The animated profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    string animation;
    /// Timestamp in seconds of the frame that will be used as the static profile photo. Defaults to 0.0.
    @serdeOptional
    Nullable!(double) main_frame_timestamp;
}

alias InputStoryContent = JsonableAlgebraicProxy!(InputStoryContentPhoto, InputStoryContentVideo);

/++ Describes a photo to post as a story. +/
struct InputStoryContentPhoto
{
    /// Type of the content, must be photo
    string type;
    /// The photo to post as a story. The photo must be of the size 1080x1920 and must not exceed 10 MB. The photo can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    string photo;
}

/++ Describes a video to post as a story. +/
struct InputStoryContentVideo
{
    /// Type of the content, must be video
    string type;
    /// The video to post as a story. The video must be of the size 720x1280, streamable, encoded with H.265 codec, with key frames added each second in the MPEG4 format, and must not exceed 30 MB. The video can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the video was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    string video;
    /// Precise duration of the video in seconds; 0-60
    @serdeOptional
    Nullable!(double) duration;
    /// Timestamp in seconds of the frame that will be used as the static cover for the story. Defaults to 0.0.
    @serdeOptional
    Nullable!(double) cover_frame_timestamp;
    /// Pass True if the video has no sound
    @serdeOptional
    Nullable!(bool) is_animation;
}

/++ Use this method to send text messages. On success, the sent Message is returned. +/
struct SendMessageMethod
{
    mixin TelegramMethod!"/sendMessage";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Text of the message to be sent, 1-4096 characters after entities parsing
    string text;
    /// Mode for parsing entities in the message text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
    /// Link preview generation options for the message
    @serdeOptional
    Nullable!(LinkPreviewOptions) link_preview_options;
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

/++ Use this method to send text messages. On success, the sent Message is returned. +/
Message sendMessage(BotApi api, SendMessageMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to forward messages of any kind. Service messages and messages with protected content can't be forwarded. On success, the sent Message is returned. +/
struct ForwardMessageMethod
{
    mixin TelegramMethod!"/forwardMessage";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be forwarded; required if the message is forwarded to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// Unique identifier for the chat where the original message was sent (or username of the target bot, supergroup or channel in the format @username)
    ChatId from_chat_id;
    /// New start timestamp for the forwarded video in the message
    @serdeOptional
    Nullable!(long) video_start_timestamp;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the forwarded message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Unique identifier of the message effect to be added to the message; only available when forwarding to private chats
    @serdeOptional
    Nullable!(string) message_effect_id;
    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only
    @serdeOptional
    Nullable!(SuggestedPostParameters) suggested_post_parameters;
    /// Message identifier in the chat specified in from_chat_id
    long message_id;
}

/++ Use this method to forward messages of any kind. Service messages and messages with protected content can't be forwarded. On success, the sent Message is returned. +/
Message forwardMessage(BotApi api, ForwardMessageMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to forward multiple messages of any kind. If some of the specified messages can't be found or forwarded, they are skipped. Service messages and messages with protected content can't be forwarded. Album grouping is kept for forwarded messages. On success, an Array of MessageId of the sent messages is returned. +/
struct ForwardMessagesMethod
{
    mixin TelegramMethod!"/forwardMessages";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the messages will be forwarded; required if the messages are forwarded to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// Unique identifier for the chat where the original messages were sent (or username of the target bot, supergroup or channel in the format @username)
    ChatId from_chat_id;
    /// A JSON-serialized list of 1-100 identifiers of messages in the chat from_chat_id to forward. The identifiers must be specified in a strictly increasing order.
    long[] message_ids;
    /// Sends the messages silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the forwarded messages from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
}

/++ Use this method to forward multiple messages of any kind. If some of the specified messages can't be found or forwarded, they are skipped. Service messages and messages with protected content can't be forwarded. Album grouping is kept for forwarded messages. On success, an Array of MessageId of the sent messages is returned. +/
MessageId[] forwardMessages(BotApi api, ForwardMessagesMethod method)
{
    return api.callMethod!(MessageId[])(method);
}

/++ Use this method to copy messages of any kind. Service messages, paid media messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_ids is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message. Returns the MessageId of the sent message on success. +/
struct CopyMessageMethod
{
    mixin TelegramMethod!"/copyMessage";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// Unique identifier for the chat where the original message was sent (or username of the target bot, supergroup or channel in the format @username)
    ChatId from_chat_id;
    /// Message identifier in the chat specified in from_chat_id
    long message_id;
    /// New start timestamp for the copied video in the message
    @serdeOptional
    Nullable!(long) video_start_timestamp;
    /// New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept.
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the new caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media. Ignored if a new caption isn't specified.
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    @serdeOptional
    Nullable!(bool) allow_paid_broadcast;
    /// Unique identifier of the message effect to be added to the message; only available when copying to private chats
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

/++ Use this method to copy messages of any kind. Service messages, paid media messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_ids is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message. Returns the MessageId of the sent message on success. +/
MessageId copyMessage(BotApi api, CopyMessageMethod method)
{
    return api.callMethod!(MessageId)(method);
}

/++ Use this method to copy messages of any kind. If some of the specified messages can't be found or copied, they are skipped. Service messages, paid media messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_ids is known to the bot. The method is analogous to the method forwardMessages, but the copied messages don't have a link to the original message. Album grouping is kept for copied messages. On success, an Array of MessageId of the sent messages is returned. +/
struct CopyMessagesMethod
{
    mixin TelegramMethod!"/copyMessages";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the messages will be sent; required if the messages are sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// Unique identifier for the chat where the original messages were sent (or username of the target bot, supergroup or channel in the format @username)
    ChatId from_chat_id;
    /// A JSON-serialized list of 1-100 identifiers of messages in the chat from_chat_id to copy. The identifiers must be specified in a strictly increasing order.
    long[] message_ids;
    /// Sends the messages silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent messages from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to copy the messages without their captions
    @serdeOptional
    Nullable!(bool) remove_caption;
}

/++ Use this method to copy messages of any kind. If some of the specified messages can't be found or copied, they are skipped. Service messages, paid media messages, giveaway messages, giveaway winners messages, and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct_option_ids is known to the bot. The method is analogous to the method forwardMessages, but the copied messages don't have a link to the original message. Album grouping is kept for copied messages. On success, an Array of MessageId of the sent messages is returned. +/
MessageId[] copyMessages(BotApi api, CopyMessagesMethod method)
{
    return api.callMethod!(MessageId[])(method);
}

/++ Use this method to send photos. On success, the sent Message is returned. +/
struct SendPhotoMethod
{
    mixin TelegramMethod!"/sendPhoto";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20. More information on Sending Files »
    string photo;
    /// Photo caption (may also be used when resending photos by file_id), 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the photo caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the photo needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
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

/++ Use this method to send photos. On success, the sent Message is returned. +/
Message sendPhoto(BotApi api, SendPhotoMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send live photos. On success, the sent Message is returned. +/
struct SendLivePhotoMethod
{
    mixin TelegramMethod!"/sendLivePhoto";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Live photo video to send. The video must be no longer than 10 seconds and must not exceed 10 MB in size. Pass a file_id as String to send a video that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string live_photo;
    /// The static photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    string photo;
    /// Video caption (may also be used when resending videos by file_id), 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the video caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the video needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
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

/++ Use this method to send live photos. On success, the sent Message is returned. +/
Message sendLivePhoto(BotApi api, SendLivePhotoMethod method)
{
    return api.callMethod!(Message)(method);
}

/++
Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.

For sending voice messages, use the sendVoice method instead.
+/
struct SendAudioMethod
{
    mixin TelegramMethod!"/sendAudio";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    string audio;
    /// Audio caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the audio caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Duration of the audio in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Performer
    @serdeOptional
    Nullable!(string) performer;
    /// Track name
    @serdeOptional
    Nullable!(string) title;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
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

/++
Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.

For sending voice messages, use the sendVoice method instead.
+/
Message sendAudio(BotApi api, SendAudioMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future. +/
struct SendDocumentMethod
{
    mixin TelegramMethod!"/sendDocument";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// File to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    string document;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Document caption (may also be used when resending documents by file_id), 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the document caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Disables automatic server-side content type detection for files uploaded using multipart/form-data
    @serdeOptional
    Nullable!(bool) disable_content_type_detection;
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

/++ Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future. +/
Message sendDocument(BotApi api, SendDocumentMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send video files, Telegram clients support MPEG4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future. +/
struct SendVideoMethod
{
    mixin TelegramMethod!"/sendVideo";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Video to send. Pass a file_id as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart/form-data. More information on Sending Files »
    string video;
    /// Duration of sent video in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Video width
    @serdeOptional
    Nullable!(long) width;
    /// Video height
    @serdeOptional
    Nullable!(long) height;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    @serdeOptional
    Nullable!(string) cover;
    /// Start timestamp for the video in the message
    @serdeOptional
    Nullable!(long) start_timestamp;
    /// Video caption (may also be used when resending videos by file_id), 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the video caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the video needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
    /// Pass True if the uploaded video is suitable for streaming
    @serdeOptional
    Nullable!(bool) supports_streaming;
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

/++ Use this method to send video files, Telegram clients support MPEG4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future. +/
Message sendVideo(BotApi api, SendVideoMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future. +/
struct SendAnimationMethod
{
    mixin TelegramMethod!"/sendAnimation";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Animation to send. Pass a file_id as String to send an animation that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an animation from the Internet, or upload a new animation using multipart/form-data. More information on Sending Files »
    string animation;
    /// Duration of sent animation in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Animation width
    @serdeOptional
    Nullable!(long) width;
    /// Animation height
    @serdeOptional
    Nullable!(long) height;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
    /// Animation caption (may also be used when resending animation by file_id), 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the animation caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Pass True if the animation needs to be covered with a spoiler animation
    @serdeOptional
    Nullable!(bool) has_spoiler;
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

/++ Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future. +/
Message sendAnimation(BotApi api, SendAnimationMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .OGG file encoded with OPUS, or in .MP3 format, or in .M4A format (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future. +/
struct SendVoiceMethod
{
    mixin TelegramMethod!"/sendVoice";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Audio file to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    string voice;
    /// Voice message caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the voice message caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Duration of the voice message in seconds
    @serdeOptional
    Nullable!(long) duration;
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

/++ Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .OGG file encoded with OPUS, or in .MP3 format, or in .M4A format (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future. +/
Message sendVoice(BotApi api, SendVoiceMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned. +/
struct SendVideoNoteMethod
{
    mixin TelegramMethod!"/sendVideoNote";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Video note to send. Pass a file_id as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending video notes by a URL is currently unsupported.
    string video_note;
    /// Duration of sent video in seconds
    @serdeOptional
    Nullable!(long) duration;
    /// Video width and height, i.e. diameter of the video message
    @serdeOptional
    Nullable!(long) length;
    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    @serdeOptional
    Nullable!(string) thumbnail;
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

/++ As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned. +/
Message sendVideoNote(BotApi api, SendVideoNoteMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send paid media. On success, the sent Message is returned. +/
struct SendPaidMediaMethod
{
    mixin TelegramMethod!"/sendPaidMedia";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username. If the chat is a channel, all Telegram Star proceeds from this media will be credited to the chat's balance. Otherwise, they will be credited to the bot's balance.
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// The number of Telegram Stars that must be paid to buy access to the media; 1-25000
    long star_count;
    /// A JSON-serialized Array describing the media to be sent; up to 10 items
    InputPaidMedia[] media;
    /// Bot-defined paid media payload, 0-128 bytes. This will not be displayed to the user, use it for your internal processes.
    @serdeOptional
    Nullable!(string) payload;
    /// Media caption, 0-1024 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the media caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// Pass True if the caption must be shown above the message media
    @serdeOptional
    Nullable!(bool) show_caption_above_media;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    @serdeOptional
    Nullable!(bool) allow_paid_broadcast;
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

/++ Use this method to send paid media. On success, the sent Message is returned. +/
Message sendPaidMedia(BotApi api, SendPaidMediaMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send a group of photos, live photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an Array of Message objects that were sent is returned. +/
struct SendMediaGroupMethod
{
    mixin TelegramMethod!"/sendMediaGroup";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the messages will be sent; required if the messages are sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// A JSON-serialized Array describing messages to be sent, must include 2-10 items
    InputPollMedia media;
    /// Sends messages silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent messages from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    @serdeOptional
    Nullable!(bool) allow_paid_broadcast;
    /// Unique identifier of the message effect to be added to the message; for private chats only
    @serdeOptional
    Nullable!(string) message_effect_id;
    /// Description of the message to reply to
    @serdeOptional
    Nullable!(ReplyParameters) reply_parameters;
}

/++ Use this method to send a group of photos, live photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an Array of Message objects that were sent is returned. +/
Message[] sendMediaGroup(BotApi api, SendMediaGroupMethod method)
{
    return api.callMethod!(Message[])(method);
}

/++ Use this method to send point on the map. On success, the sent Message is returned. +/
struct SendLocationMethod
{
    mixin TelegramMethod!"/sendLocation";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Latitude of the location
    double latitude;
    /// Longitude of the location
    double longitude;
    /// The radius of uncertainty for the location, measured in meters; 0-1500
    @serdeOptional
    Nullable!(double) horizontal_accuracy;
    /// Period in seconds during which the location will be updated (see Live Locations), must be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely. Must be 0 for ephemeral messages.
    @serdeOptional
    Nullable!(long) live_period;
    /// For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    @serdeOptional
    Nullable!(long) heading;
    /// For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    @serdeOptional
    Nullable!(long) proximity_alert_radius;
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

/++ Use this method to send point on the map. On success, the sent Message is returned. +/
Message sendLocation(BotApi api, SendLocationMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send information about a venue. On success, the sent Message is returned. +/
struct SendVenueMethod
{
    mixin TelegramMethod!"/sendVenue";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Latitude of the venue
    double latitude;
    /// Longitude of the venue
    double longitude;
    /// Name of the venue
    string title;
    /// Address of the venue
    string address;
    /// Foursquare identifier of the venue
    @serdeOptional
    Nullable!(string) foursquare_id;
    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    @serdeOptional
    Nullable!(string) foursquare_type;
    /// Google Places identifier of the venue
    @serdeOptional
    Nullable!(string) google_place_id;
    /// Google Places type of the venue. (See supported types.)
    @serdeOptional
    Nullable!(string) google_place_type;
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

/++ Use this method to send information about a venue. On success, the sent Message is returned. +/
Message sendVenue(BotApi api, SendVenueMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send phone contacts. On success, the sent Message is returned. +/
struct SendContactMethod
{
    mixin TelegramMethod!"/sendContact";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// For outgoing ephemeral messages, unique identifier of the user who will receive the message; for group and supergroup chats only. It is not guaranteed that the user will receive the message, especially if they are offline. See ephemeral message sending for more details.
    @serdeOptional
    Nullable!(long) receiver_user_id;
    /// For outgoing ephemeral messages, identifier of the callback query which triggered the message if any
    @serdeOptional
    Nullable!(string) callback_query_id;
    /// Contact's phone number
    string phone_number;
    /// Contact's first name
    string first_name;
    /// Contact's last name
    @serdeOptional
    Nullable!(string) last_name;
    /// Additional data about the contact in the form of a vCard, 0-2048 bytes
    @serdeOptional
    Nullable!(string) vcard;
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

/++ Use this method to send phone contacts. On success, the sent Message is returned. +/
Message sendContact(BotApi api, SendContactMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send a checklist on behalf of a connected business account. On success, the sent Message is returned. +/
struct SendChecklistMethod
{
    mixin TelegramMethod!"/sendChecklist";
    /// Unique identifier of the business connection on behalf of which the message will be sent
    string business_connection_id;
    /// Unique identifier for the target chat or username of the target bot in the format @username
    ChatId chat_id;
    /// A JSON-serialized object for the checklist to send
    InputChecklist checklist;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding and saving
    @serdeOptional
    Nullable!(bool) protect_content;
    /// Unique identifier of the message effect to be added to the message
    @serdeOptional
    Nullable!(string) message_effect_id;
    /// A JSON-serialized object for description of the message to reply to
    @serdeOptional
    Nullable!(ReplyParameters) reply_parameters;
    /// A JSON-serialized object for an inline keyboard
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to send a checklist on behalf of a connected business account. On success, the sent Message is returned. +/
Message sendChecklist(BotApi api, SendChecklistMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to send an animated emoji that will display a random value. On success, the sent Message is returned. +/
struct SendDiceMethod
{
    mixin TelegramMethod!"/sendDice";
    /// Unique identifier of the business connection on behalf of which the message will be sent
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
    /// Emoji on which the dice throw animation is based. Currently, must be one of “”, “”, “”, “”, “”, or “”. Dice can have values 1-6 for “”, “” and “”, values 1-5 for “” and “”, and values 1-64 for “”. Defaults to “”.
    @serdeOptional
    Nullable!(string) emoji;
    /// Sends the message silently. Users will receive a notification with no sound.
    @serdeOptional
    Nullable!(bool) disable_notification;
    /// Protects the contents of the sent message from forwarding
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

/++ Use this method to send an animated emoji that will display a random value. On success, the sent Message is returned. +/
Message sendDice(BotApi api, SendDiceMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to stream a partial message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendMessage with the complete message to persist it in the user's chat. Returns True on success. +/
struct SendMessageDraftMethod
{
    mixin TelegramMethod!"/sendMessageDraft";
    /// Unique identifier for the target private chat
    long chat_id;
    /// Unique identifier for the target message thread
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated.
    long draft_id;
    /// Text of the message to be sent, 0-4096 characters after entities parsing. Pass an empty text to show a “Thinking…” placeholder.
    @serdeOptional
    Nullable!(string) text;
    /// Mode for parsing entities in the message text. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) entities;
}

/++ Use this method to stream a partial message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendMessage with the complete message to persist it in the user's chat. Returns True on success. +/
bool sendMessageDraft(BotApi api, SendMessageDraftMethod method)
{
    return api.callMethod!(bool)(method);
}

/++
Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.

Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.

We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.
+/
struct SendChatActionMethod
{
    mixin TelegramMethod!"/sendChatAction";
    /// Unique identifier of the business connection on behalf of which the action will be sent
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target bot or supergroup in the format @username. Channel chats and channel direct messages chats aren't supported.
    ChatId chat_id;
    /// Unique identifier for the target message thread or topic of a forum; for supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_voice or upload_voice for voice notes, upload_document for general files, choose_sticker for stickers, find_location for location data, record_video_note or upload_video_note for video notes.
    string action;
}

/++
Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.

Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.

We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.
+/
bool sendChatAction(BotApi api, SendChatActionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the chosen reactions on a message. Service messages of some types can't be reacted to. Automatically forwarded messages from a channel to its discussion group have the same available reactions as messages in the channel. Bots can't use paid reactions. Returns True on success. +/
struct SetMessageReactionMethod
{
    mixin TelegramMethod!"/setMessageReaction";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Identifier of the target message. If the message belongs to a media group, the reaction is set to the first non-deleted message in the group instead.
    long message_id;
    /// A JSON-serialized list of reaction types to set on the message. Currently, as non-premium users, bots can set up to one reaction per message. A custom emoji reaction can be used if it is either already present on the message or explicitly allowed by chat administrators. Paid reactions can't be used by bots.
    @serdeOptional
    Nullable!(ReactionType[]) reaction;
    /// Pass True to set the reaction with a big animation
    @serdeOptional
    Nullable!(bool) is_big;
}

/++ Use this method to change the chosen reactions on a message. Service messages of some types can't be reacted to. Automatically forwarded messages from a channel to its discussion group have the same available reactions as messages in the channel. Bots can't use paid reactions. Returns True on success. +/
bool setMessageReaction(BotApi api, SetMessageReactionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object. +/
struct GetUserProfilePhotosMethod
{
    mixin TelegramMethod!"/getUserProfilePhotos";
    /// Unique identifier of the target user
    long user_id;
    /// Sequential number of the first photo to be returned. By default, all photos are returned.
    @serdeOptional
    Nullable!(long) offset;
    /// Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object. +/
UserProfilePhotos getUserProfilePhotos(BotApi api, GetUserProfilePhotosMethod method)
{
    return api.callMethod!(UserProfilePhotos)(method);
}

/++ Use this method to get a list of profile audios for a user. Returns a UserProfileAudios object. +/
struct GetUserProfileAudiosMethod
{
    mixin TelegramMethod!"/getUserProfileAudios";
    /// Unique identifier of the target user
    long user_id;
    /// Sequential number of the first audio to be returned. By default, all audios are returned.
    @serdeOptional
    Nullable!(long) offset;
    /// Limits the number of audios to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Use this method to get a list of profile audios for a user. Returns a UserProfileAudios object. +/
UserProfileAudios getUserProfileAudios(BotApi api, GetUserProfileAudiosMethod method)
{
    return api.callMethod!(UserProfileAudios)(method);
}

/++ Changes the emoji status for a given user that previously allowed the bot to manage their emoji status via the Mini App method requestEmojiStatusAccess. Returns True on success. +/
struct SetUserEmojiStatusMethod
{
    mixin TelegramMethod!"/setUserEmojiStatus";
    /// Unique identifier of the target user
    long user_id;
    /// Custom emoji identifier of the emoji status to set. Pass an empty string to remove the status.
    @serdeOptional
    Nullable!(string) emoji_status_custom_emoji_id;
    /// Expiration date of the emoji status, if any
    @serdeOptional
    Nullable!(long) emoji_status_expiration_date;
}

/++ Changes the emoji status for a given user that previously allowed the bot to manage their emoji status via the Mini App method requestEmojiStatusAccess. Returns True on success. +/
bool setUserEmojiStatus(BotApi api, SetUserEmojiStatusMethod method)
{
    return api.callMethod!(bool)(method);
}

/++
Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.

Note: This function may not preserve the original file name and MIME type. You should save the file's MIME type and name (if available) when the File object is received.
+/
struct GetFileMethod
{
    mixin TelegramMethod!"/getFile";
    /// File identifier to get information about
    string file_id;
}

/++
Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.

Note: This function may not preserve the original file name and MIME type. You should save the file's MIME type and name (if available) when the File object is received.
+/
File getFile(BotApi api, GetFileMethod method)
{
    return api.callMethod!(File)(method);
}

/++ Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct BanChatMemberMethod
{
    mixin TelegramMethod!"/banChatMember";
    /// Unique identifier for the target group or username of the target supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// Date when the user will be unbanned; Unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever. Applied for supergroups and channels only.
    @serdeOptional
    Nullable!(long) until_date;
    /// Pass True to delete all messages from the chat for the user that is being removed. If False, the user will be able to see messages in the group that were sent before the user was removed. Always True for supergroups and channels.
    @serdeOptional
    Nullable!(bool) revoke_messages;
}

/++ Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool banChatMember(BotApi api, BanChatMemberMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don't want this, use the parameter only_if_banned. Returns True on success. +/
struct UnbanChatMemberMethod
{
    mixin TelegramMethod!"/unbanChatMember";
    /// Unique identifier for the target group or username of the target supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// Do nothing if the user is not banned
    @serdeOptional
    Nullable!(bool) only_if_banned;
}

/++ Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don't want this, use the parameter only_if_banned. Returns True on success. +/
bool unbanChatMember(BotApi api, UnbanChatMemberMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success. +/
struct RestrictChatMemberMethod
{
    mixin TelegramMethod!"/restrictChatMember";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// A JSON-serialized object for new user permissions
    ChatPermissions permissions;
    /// Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    @serdeOptional
    Nullable!(bool) use_independent_chat_permissions;
    /// Date when restrictions will be lifted for the user; Unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever.
    @serdeOptional
    Nullable!(long) until_date;
}

/++ Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success. +/
bool restrictChatMember(BotApi api, RestrictChatMemberMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success. +/
struct PromoteChatMemberMethod
{
    mixin TelegramMethod!"/promoteChatMember";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// Pass True if the administrator's presence in the chat is hidden
    @serdeOptional
    Nullable!(bool) is_anonymous;
    /// Pass True if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    @serdeOptional
    Nullable!(bool) can_manage_chat;
    /// Pass True if the administrator can delete messages of other users
    @serdeOptional
    Nullable!(bool) can_delete_messages;
    /// Pass True if the administrator can manage video chats
    @serdeOptional
    Nullable!(bool) can_manage_video_chats;
    /// Pass True if the administrator can restrict, ban or unban chat members, or access supergroup statistics. For backward compatibility, defaults to True for promotions of channel administrators.
    @serdeOptional
    Nullable!(bool) can_restrict_members;
    /// Pass True if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by him)
    @serdeOptional
    Nullable!(bool) can_promote_members;
    /// Pass True if the administrator can change chat title, photo and other settings
    @serdeOptional
    Nullable!(bool) can_change_info;
    /// Pass True if the administrator can invite new users to the chat
    @serdeOptional
    Nullable!(bool) can_invite_users;
    /// Pass True if the administrator can post stories to the chat
    @serdeOptional
    Nullable!(bool) can_post_stories;
    /// Pass True if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive
    @serdeOptional
    Nullable!(bool) can_edit_stories;
    /// Pass True if the administrator can delete stories posted by other users
    @serdeOptional
    Nullable!(bool) can_delete_stories;
    /// Pass True if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    @serdeOptional
    Nullable!(bool) can_post_messages;
    /// Pass True if the administrator can edit messages of other users and can pin messages; for channels only
    @serdeOptional
    Nullable!(bool) can_edit_messages;
    /// Pass True if the administrator can pin messages; for supergroups only
    @serdeOptional
    Nullable!(bool) can_pin_messages;
    /// Pass True if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    @serdeOptional
    Nullable!(bool) can_manage_topics;
    /// Pass True if the administrator can manage direct messages within the channel and decline suggested posts; for channels only
    @serdeOptional
    Nullable!(bool) can_manage_direct_messages;
    /// Pass True if the administrator can edit the tags of regular members; for groups and supergroups only
    @serdeOptional
    Nullable!(bool) can_manage_tags;
}

/++ Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success. +/
bool promoteChatMember(BotApi api, PromoteChatMemberMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success. +/
struct SetChatAdministratorCustomTitleMethod
{
    mixin TelegramMethod!"/setChatAdministratorCustomTitle";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// New custom title for the administrator; 0-16 characters, emoji are not allowed
    string custom_title;
}

/++ Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success. +/
bool setChatAdministratorCustomTitle(BotApi api, SetChatAdministratorCustomTitleMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set a tag for a regular member in a group or a supergroup. The bot must be an administrator in the chat for this to work and must have the can_manage_tags administrator right. Returns True on success. +/
struct SetChatMemberTagMethod
{
    mixin TelegramMethod!"/setChatMemberTag";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
    /// New tag for the member; 0-16 characters, emoji are not allowed
    @serdeOptional
    Nullable!(string) tag;
}

/++ Use this method to set a tag for a regular member in a group or a supergroup. The bot must be an administrator in the chat for this to work and must have the can_manage_tags administrator right. Returns True on success. +/
bool setChatMemberTag(BotApi api, SetChatMemberTagMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to ban a channel chat in a supergroup or a channel. Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels. The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct BanChatSenderChatMethod
{
    mixin TelegramMethod!"/banChatSenderChat";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target sender chat
    long sender_chat_id;
}

/++ Use this method to ban a channel chat in a supergroup or a channel. Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels. The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool banChatSenderChat(BotApi api, BanChatSenderChatMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct UnbanChatSenderChatMethod
{
    mixin TelegramMethod!"/unbanChatSenderChat";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target sender chat
    long sender_chat_id;
}

/++ Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool unbanChatSenderChat(BotApi api, UnbanChatSenderChatMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success. +/
struct SetChatPermissionsMethod
{
    mixin TelegramMethod!"/setChatPermissions";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// A JSON-serialized object for new default chat permissions
    ChatPermissions permissions;
    /// Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
    @serdeOptional
    Nullable!(bool) use_independent_chat_permissions;
}

/++ Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success. +/
bool setChatPermissions(BotApi api, SetChatPermissionsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++
Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.

Note: Each administrator in a chat generates their own invite links. Bots can't use invite links generated by other administrators. If you want your bot to work with invite links, it will need to generate its own link using exportChatInviteLink or by calling the getChat method. If your bot needs to generate a new primary invite link replacing its previous one, use exportChatInviteLink again.
+/
struct ExportChatInviteLinkMethod
{
    mixin TelegramMethod!"/exportChatInviteLink";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
}

/++
Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.

Note: Each administrator in a chat generates their own invite links. Bots can't use invite links generated by other administrators. If you want your bot to work with invite links, it will need to generate its own link using exportChatInviteLink or by calling the getChat method. If your bot needs to generate a new primary invite link replacing its previous one, use exportChatInviteLink again.
+/
string exportChatInviteLink(BotApi api, ExportChatInviteLinkMethod method)
{
    return api.callMethod!(string)(method);
}

/++ Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object. +/
struct CreateChatInviteLinkMethod
{
    mixin TelegramMethod!"/createChatInviteLink";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Invite link name; 0-32 characters
    @serdeOptional
    Nullable!(string) name;
    /// Point in time (Unix timestamp) when the link will expire
    @serdeOptional
    Nullable!(long) expire_date;
    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    @serdeOptional
    Nullable!(long) member_limit;
    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified.
    @serdeOptional
    Nullable!(bool) creates_join_request;
}

/++ Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object. +/
ChatInviteLink createChatInviteLink(BotApi api, CreateChatInviteLinkMethod method)
{
    return api.callMethod!(ChatInviteLink)(method);
}

/++ Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object. +/
struct EditChatInviteLinkMethod
{
    mixin TelegramMethod!"/editChatInviteLink";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// The invite link to edit
    string invite_link;
    /// Invite link name; 0-32 characters
    @serdeOptional
    Nullable!(string) name;
    /// Point in time (Unix timestamp) when the link will expire
    @serdeOptional
    Nullable!(long) expire_date;
    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    @serdeOptional
    Nullable!(long) member_limit;
    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified.
    @serdeOptional
    Nullable!(bool) creates_join_request;
}

/++ Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object. +/
ChatInviteLink editChatInviteLink(BotApi api, EditChatInviteLinkMethod method)
{
    return api.callMethod!(ChatInviteLink)(method);
}

/++ Use this method to create a subscription invite link for a channel chat. The bot must have the can_invite_users administrator rights. The link can be edited using the method editChatSubscriptionInviteLink or revoked using the method revokeChatInviteLink. Returns the new invite link as a ChatInviteLink object. +/
struct CreateChatSubscriptionInviteLinkMethod
{
    mixin TelegramMethod!"/createChatSubscriptionInviteLink";
    /// Unique identifier for the target channel chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Invite link name; 0-32 characters
    @serdeOptional
    Nullable!(string) name;
    /// The number of seconds the subscription will be active for before the next payment. Currently, it must always be 2592000 (30 days).
    long subscription_period;
    /// The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat; 1-10000
    long subscription_price;
}

/++ Use this method to create a subscription invite link for a channel chat. The bot must have the can_invite_users administrator rights. The link can be edited using the method editChatSubscriptionInviteLink or revoked using the method revokeChatInviteLink. Returns the new invite link as a ChatInviteLink object. +/
ChatInviteLink createChatSubscriptionInviteLink(BotApi api, CreateChatSubscriptionInviteLinkMethod method)
{
    return api.callMethod!(ChatInviteLink)(method);
}

/++ Use this method to edit a subscription invite link created by the bot. The bot must have the can_invite_users administrator rights. Returns the edited invite link as a ChatInviteLink object. +/
struct EditChatSubscriptionInviteLinkMethod
{
    mixin TelegramMethod!"/editChatSubscriptionInviteLink";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// The invite link to edit
    string invite_link;
    /// Invite link name; 0-32 characters
    @serdeOptional
    Nullable!(string) name;
}

/++ Use this method to edit a subscription invite link created by the bot. The bot must have the can_invite_users administrator rights. Returns the edited invite link as a ChatInviteLink object. +/
ChatInviteLink editChatSubscriptionInviteLink(BotApi api, EditChatSubscriptionInviteLinkMethod method)
{
    return api.callMethod!(ChatInviteLink)(method);
}

/++ Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object. +/
struct RevokeChatInviteLinkMethod
{
    mixin TelegramMethod!"/revokeChatInviteLink";
    /// Unique identifier of the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// The invite link to revoke
    string invite_link;
}

/++ Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object. +/
ChatInviteLink revokeChatInviteLink(BotApi api, RevokeChatInviteLinkMethod method)
{
    return api.callMethod!(ChatInviteLink)(method);
}

/++ Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success. +/
struct ApproveChatJoinRequestMethod
{
    mixin TelegramMethod!"/approveChatJoinRequest";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
}

/++ Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success. +/
bool approveChatJoinRequest(BotApi api, ApproveChatJoinRequestMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success. +/
struct DeclineChatJoinRequestMethod
{
    mixin TelegramMethod!"/declineChatJoinRequest";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
}

/++ Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success. +/
bool declineChatJoinRequest(BotApi api, DeclineChatJoinRequestMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to process a received chat join request query. Returns True on success. +/
struct AnswerChatJoinRequestQueryMethod
{
    mixin TelegramMethod!"/answerChatJoinRequestQuery";
    /// Unique identifier of the join request query
    string chat_join_request_query_id;
    /// Result of the query. Must be either “approve” to allow the user to join the chat, “decline” to disallow the user to join the chat, or “queue” to leave the decision to other administrators.
    string result;
}

/++ Use this method to process a received chat join request query. Returns True on success. +/
bool answerChatJoinRequestQuery(BotApi api, AnswerChatJoinRequestQueryMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to process a received chat join request query by showing a Mini App to the user before deciding the outcome. Call answerChatJoinRequestQuery to resolve the join request query based on the user interaction with the Mini App. Returns True on success. +/
struct SendChatJoinRequestWebAppMethod
{
    mixin TelegramMethod!"/sendChatJoinRequestWebApp";
    /// Unique identifier of the join request query
    string chat_join_request_query_id;
    /// An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    string web_app_url;
}

/++ Use this method to process a received chat join request query by showing a Mini App to the user before deciding the outcome. Call answerChatJoinRequestQuery to resolve the join request query based on the user interaction with the Mini App. Returns True on success. +/
bool sendChatJoinRequestWebApp(BotApi api, SendChatJoinRequestWebAppMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct SetChatPhotoMethod
{
    mixin TelegramMethod!"/setChatPhoto";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// New chat photo, uploaded using multipart/form-data
    InputFile photo;
}

/++ Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool setChatPhoto(BotApi api, SetChatPhotoMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct DeleteChatPhotoMethod
{
    mixin TelegramMethod!"/deleteChatPhoto";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
}

/++ Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool deleteChatPhoto(BotApi api, DeleteChatPhotoMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct SetChatTitleMethod
{
    mixin TelegramMethod!"/setChatTitle";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// New chat title, 1-128 characters
    string title;
}

/++ Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool setChatTitle(BotApi api, SetChatTitleMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
struct SetChatDescriptionMethod
{
    mixin TelegramMethod!"/setChatDescription";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// New chat description, 0-255 characters
    @serdeOptional
    Nullable!(string) description;
}

/++ Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success. +/
bool setChatDescription(BotApi api, SetChatDescriptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to add a message to the list of pinned messages in a chat. In private chats and channel direct messages chats, all non-service messages can be pinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to pin messages in groups and channels respectively. Returns True on success. +/
struct PinChatMessageMethod
{
    mixin TelegramMethod!"/pinChatMessage";
    /// Unique identifier of the business connection on behalf of which the message will be pinned
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Identifier of a message to pin
    long message_id;
    /// Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
    @serdeOptional
    Nullable!(bool) disable_notification;
}

/++ Use this method to add a message to the list of pinned messages in a chat. In private chats and channel direct messages chats, all non-service messages can be pinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to pin messages in groups and channels respectively. Returns True on success. +/
bool pinChatMessage(BotApi api, PinChatMessageMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to remove a message from the list of pinned messages in a chat. In private chats and channel direct messages chats, all messages can be unpinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin messages in groups and channels respectively. Returns True on success. +/
struct UnpinChatMessageMethod
{
    mixin TelegramMethod!"/unpinChatMessage";
    /// Unique identifier of the business connection on behalf of which the message will be unpinned
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Identifier of the message to unpin. Required if business_connection_id is specified. If not specified, the most recent pinned message (by sending date) will be unpinned.
    @serdeOptional
    Nullable!(long) message_id;
}

/++ Use this method to remove a message from the list of pinned messages in a chat. In private chats and channel direct messages chats, all messages can be unpinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin messages in groups and channels respectively. Returns True on success. +/
bool unpinChatMessage(BotApi api, UnpinChatMessageMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to clear the list of pinned messages in a chat. In private chats and channel direct messages chats, no additional rights are required to unpin all pinned messages. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin all pinned messages in groups and channels respectively. Returns True on success. +/
struct UnpinAllChatMessagesMethod
{
    mixin TelegramMethod!"/unpinAllChatMessages";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
}

/++ Use this method to clear the list of pinned messages in a chat. In private chats and channel direct messages chats, no additional rights are required to unpin all pinned messages. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin all pinned messages in groups and channels respectively. Returns True on success. +/
bool unpinAllChatMessages(BotApi api, UnpinAllChatMessagesMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method for your bot to leave a group, supergroup or channel. Returns True on success. +/
struct LeaveChatMethod
{
    mixin TelegramMethod!"/leaveChat";
    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username. Channel direct messages chats aren't supported; leave the corresponding channel instead.
    ChatId chat_id;
}

/++ Use this method for your bot to leave a group, supergroup or channel. Returns True on success. +/
bool leaveChat(BotApi api, LeaveChatMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get up-to-date information about the chat. Returns a ChatFullInfo object on success. +/
struct GetChatMethod
{
    mixin TelegramMethod!"/getChat";
    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username
    ChatId chat_id;
}

/++ Use this method to get up-to-date information about the chat. Returns a ChatFullInfo object on success. +/
ChatFullInfo getChat(BotApi api, GetChatMethod method)
{
    return api.callMethod!(ChatFullInfo)(method);
}

/++ Use this method to get a list of administrators in a chat. Returns an Array of ChatMember objects. +/
struct GetChatAdministratorsMethod
{
    mixin TelegramMethod!"/getChatAdministrators";
    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username
    ChatId chat_id;
    /// Pass True to additionally receive all bots that are administrators of the chat. By default, bots other than the current bot are omitted.
    @serdeOptional
    Nullable!(bool) return_bots;
}


/++ Use this method to get the number of members in a chat. Returns Integer on success. +/
struct GetChatMemberCountMethod
{
    mixin TelegramMethod!"/getChatMemberCount";
    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username
    ChatId chat_id;
}

/++ Use this method to get the number of members in a chat. Returns Integer on success. +/
long getChatMemberCount(BotApi api, GetChatMemberCountMethod method)
{
    return api.callMethod!(long)(method);
}

/++ Use this method to get information about a member of a chat. The method is only guaranteed to work for other users if the bot is an administrator in the chat. Returns a ChatMember object on success. +/
struct GetChatMemberMethod
{
    mixin TelegramMethod!"/getChatMember";
    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
}


/++ Use this method to get the last messages from the personal chat (i.e., the chat currently added to their profile) of a given user. On success, an Array of Message objects is returned. +/
struct GetUserPersonalChatMessagesMethod
{
    mixin TelegramMethod!"/getUserPersonalChatMessages";
    /// Unique identifier for the target user
    long user_id;
    /// The maximum number of messages to return; 1-20
    long limit;
}

/++ Use this method to get the last messages from the personal chat (i.e., the chat currently added to their profile) of a given user. On success, an Array of Message objects is returned. +/
Message[] getUserPersonalChatMessages(BotApi api, GetUserPersonalChatMessagesMethod method)
{
    return api.callMethod!(Message[])(method);
}

/++ Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success. +/
struct SetChatStickerSetMethod
{
    mixin TelegramMethod!"/setChatStickerSet";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Name of the sticker set to be set as the group sticker set
    string sticker_set_name;
}

/++ Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success. +/
bool setChatStickerSet(BotApi api, SetChatStickerSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success. +/
struct DeleteChatStickerSetMethod
{
    mixin TelegramMethod!"/deleteChatStickerSet";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success. +/
bool deleteChatStickerSet(BotApi api, DeleteChatStickerSetMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to create a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator right. Returns information about the created topic as a ForumTopic object. +/
struct CreateForumTopicMethod
{
    mixin TelegramMethod!"/createForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Topic name, 1-128 characters
    string name;
    /// Color of the topic icon in RGB format. Currently, must be one of 7322096 (0x6FB9F0), 16766590 (0xFFD67E), 13338331 (0xCB86DB), 9367192 (0x8EEE98), 16749490 (0xFF93B2), or 16478047 (0xFB6F5F).
    @serdeOptional
    Nullable!(long) icon_color;
    /// Unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers.
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
}

/++ Use this method to create a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator right. Returns information about the created topic as a ForumTopic object. +/
ForumTopic createForumTopic(BotApi api, CreateForumTopicMethod method)
{
    return api.callMethod!(ForumTopic)(method);
}

/++ Use this method to edit name and icon of a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
struct EditForumTopicMethod
{
    mixin TelegramMethod!"/editForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread of the forum topic
    long message_thread_id;
    /// New topic name, 0-128 characters. If not specified or empty, the current name of the topic will be kept.
    @serdeOptional
    Nullable!(string) name;
    /// New unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers. Pass an empty string to remove the icon. If not specified, the current icon will be kept.
    @serdeOptional
    Nullable!(string) icon_custom_emoji_id;
}

/++ Use this method to edit name and icon of a topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
bool editForumTopic(BotApi api, EditForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to close an open topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
struct CloseForumTopicMethod
{
    mixin TelegramMethod!"/closeForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread of the forum topic
    long message_thread_id;
}

/++ Use this method to close an open topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
bool closeForumTopic(BotApi api, CloseForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to reopen a closed topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
struct ReopenForumTopicMethod
{
    mixin TelegramMethod!"/reopenForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread of the forum topic
    long message_thread_id;
}

/++ Use this method to reopen a closed topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success. +/
bool reopenForumTopic(BotApi api, ReopenForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete a forum topic along with all its messages in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_delete_messages administrator rights. Returns True on success. +/
struct DeleteForumTopicMethod
{
    mixin TelegramMethod!"/deleteForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread of the forum topic
    long message_thread_id;
}

/++ Use this method to delete a forum topic along with all its messages in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_delete_messages administrator rights. Returns True on success. +/
bool deleteForumTopic(BotApi api, DeleteForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to clear the list of pinned messages in a forum topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success. +/
struct UnpinAllForumTopicMessagesMethod
{
    mixin TelegramMethod!"/unpinAllForumTopicMessages";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread of the forum topic
    long message_thread_id;
}

/++ Use this method to clear the list of pinned messages in a forum topic in a forum supergroup chat or a private chat with a user. In the case of a supergroup chat the bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success. +/
bool unpinAllForumTopicMessages(BotApi api, UnpinAllForumTopicMessagesMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to edit the name of the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
struct EditGeneralForumTopicMethod
{
    mixin TelegramMethod!"/editGeneralForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
    /// New topic name, 1-128 characters
    string name;
}

/++ Use this method to edit the name of the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
bool editGeneralForumTopic(BotApi api, EditGeneralForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to close an open 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
struct CloseGeneralForumTopicMethod
{
    mixin TelegramMethod!"/closeGeneralForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to close an open 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
bool closeGeneralForumTopic(BotApi api, CloseGeneralForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to reopen a closed 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically unhidden if it was hidden. Returns True on success. +/
struct ReopenGeneralForumTopicMethod
{
    mixin TelegramMethod!"/reopenGeneralForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to reopen a closed 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically unhidden if it was hidden. Returns True on success. +/
bool reopenGeneralForumTopic(BotApi api, ReopenGeneralForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to hide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically closed if it was open. Returns True on success. +/
struct HideGeneralForumTopicMethod
{
    mixin TelegramMethod!"/hideGeneralForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to hide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically closed if it was open. Returns True on success. +/
bool hideGeneralForumTopic(BotApi api, HideGeneralForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to unhide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
struct UnhideGeneralForumTopicMethod
{
    mixin TelegramMethod!"/unhideGeneralForumTopic";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to unhide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success. +/
bool unhideGeneralForumTopic(BotApi api, UnhideGeneralForumTopicMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success. +/
struct UnpinAllGeneralForumTopicMessagesMethod
{
    mixin TelegramMethod!"/unpinAllGeneralForumTopicMessages";
    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    ChatId chat_id;
}

/++ Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success. +/
bool unpinAllGeneralForumTopicMessages(BotApi api, UnpinAllGeneralForumTopicMessagesMethod method)
{
    return api.callMethod!(bool)(method);
}

/++
Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.

Alternatively, the user can be redirected to the specified Game URL. For this option to work, you must first create a game for your bot via @BotFather and accept the terms. Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
+/
struct AnswerCallbackQueryMethod
{
    mixin TelegramMethod!"/answerCallbackQuery";
    /// Unique identifier for the query to be answered
    string callback_query_id;
    /// Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters.
    @serdeOptional
    Nullable!(string) text;
    /// If True, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to False.
    @serdeOptional
    Nullable!(bool) show_alert;
    /// URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @BotFather, specify the URL that opens your game - note that this will only work if the query comes from a callback_game button.Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
    @serdeOptional
    Nullable!(string) url;
    /// The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
    @serdeOptional
    Nullable!(long) cache_time;
}

/++
Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.

Alternatively, the user can be redirected to the specified Game URL. For this option to work, you must first create a game for your bot via @BotFather and accept the terms. Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
+/
bool answerCallbackQuery(BotApi api, AnswerCallbackQueryMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to reply to a received guest message. On success, a SentGuestMessage object is returned. +/
struct AnswerGuestQueryMethod
{
    mixin TelegramMethod!"/answerGuestQuery";
    /// Unique identifier for the query to be answered
    string guest_query_id;
    /// A JSON-serialized object describing the message to be sent
    InlineQueryResult result;
}

/++ Use this method to reply to a received guest message. On success, a SentGuestMessage object is returned. +/
SentGuestMessage answerGuestQuery(BotApi api, AnswerGuestQueryMethod method)
{
    return api.callMethod!(SentGuestMessage)(method);
}

/++ Use this method to get the list of boosts added to a chat by a user. Requires administrator rights in the chat. Returns a UserChatBoosts object. +/
struct GetUserChatBoostsMethod
{
    mixin TelegramMethod!"/getUserChatBoosts";
    /// Unique identifier for the chat or username of the channel in the format @username
    ChatId chat_id;
    /// Unique identifier of the target user
    long user_id;
}

/++ Use this method to get the list of boosts added to a chat by a user. Requires administrator rights in the chat. Returns a UserChatBoosts object. +/
UserChatBoosts getUserChatBoosts(BotApi api, GetUserChatBoostsMethod method)
{
    return api.callMethod!(UserChatBoosts)(method);
}

/++ Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success. +/
struct GetBusinessConnectionMethod
{
    mixin TelegramMethod!"/getBusinessConnection";
    /// Unique identifier of the business connection
    string business_connection_id;
}

/++ Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success. +/
BusinessConnection getBusinessConnection(BotApi api, GetBusinessConnectionMethod method)
{
    return api.callMethod!(BusinessConnection)(method);
}

/++ Use this method to get the token of a managed bot. Returns the token as String on success. +/
struct GetManagedBotTokenMethod
{
    mixin TelegramMethod!"/getManagedBotToken";
    /// User identifier of the managed bot whose token will be returned
    long user_id;
}

/++ Use this method to get the token of a managed bot. Returns the token as String on success. +/
string getManagedBotToken(BotApi api, GetManagedBotTokenMethod method)
{
    return api.callMethod!(string)(method);
}

/++ Use this method to revoke the current token of a managed bot and generate a new one. Returns the new token as String on success. +/
struct ReplaceManagedBotTokenMethod
{
    mixin TelegramMethod!"/replaceManagedBotToken";
    /// User identifier of the managed bot whose token will be replaced
    long user_id;
}

/++ Use this method to revoke the current token of a managed bot and generate a new one. Returns the new token as String on success. +/
string replaceManagedBotToken(BotApi api, ReplaceManagedBotTokenMethod method)
{
    return api.callMethod!(string)(method);
}

/++ Use this method to get the access settings of a managed bot. Returns a BotAccessSettings object on success. +/
struct GetManagedBotAccessSettingsMethod
{
    mixin TelegramMethod!"/getManagedBotAccessSettings";
    /// User identifier of the managed bot whose access settings will be returned
    long user_id;
}

/++ Use this method to get the access settings of a managed bot. Returns a BotAccessSettings object on success. +/
BotAccessSettings getManagedBotAccessSettings(BotApi api, GetManagedBotAccessSettingsMethod method)
{
    return api.callMethod!(BotAccessSettings)(method);
}

/++ Use this method to change the access settings of a managed bot. Returns True on success. +/
struct SetManagedBotAccessSettingsMethod
{
    mixin TelegramMethod!"/setManagedBotAccessSettings";
    /// User identifier of the managed bot whose access settings will be changed
    long user_id;
    /// Pass True if only selected users can access the bot. The bot's owner can always access it.
    bool is_access_restricted;
    /// A JSON-serialized list of up to 10 identifiers of users who will have access to the bot in addition to its owner. Ignored if is_access_restricted is False.
    @serdeOptional
    Nullable!(long[]) added_user_ids;
}

/++ Use this method to change the access settings of a managed bot. Returns True on success. +/
bool setManagedBotAccessSettings(BotApi api, SetManagedBotAccessSettingsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the list of the bot's commands. See this manual for more details about bot commands. Returns True on success. +/
struct SetMyCommandsMethod
{
    mixin TelegramMethod!"/setMyCommands";
    /// A JSON-serialized list of bot commands to be set as the list of the bot's commands. At most 100 commands can be specified.
    BotCommand[] commands;
    /// A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    @serdeKeys("scope")
    @serdeOptional
    Nullable!(BotCommandScope) scope_;
    /// A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands.
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to change the list of the bot's commands. See this manual for more details about bot commands. Returns True on success. +/
bool setMyCommands(BotApi api, SetMyCommandsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success. +/
struct DeleteMyCommandsMethod
{
    mixin TelegramMethod!"/deleteMyCommands";
    /// A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    @serdeKeys("scope")
    @serdeOptional
    Nullable!(BotCommandScope) scope_;
    /// A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands.
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success. +/
bool deleteMyCommands(BotApi api, DeleteMyCommandsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned. +/
struct GetMyCommandsMethod
{
    mixin TelegramMethod!"/getMyCommands";
    /// A JSON-serialized object, describing scope of users. Defaults to BotCommandScopeDefault.
    @serdeKeys("scope")
    @serdeOptional
    Nullable!(BotCommandScope) scope_;
    /// A two-letter ISO 639-1 language code or an empty string
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned. +/
BotCommand[] getMyCommands(BotApi api, GetMyCommandsMethod method)
{
    return api.callMethod!(BotCommand[])(method);
}

/++ Use this method to change the bot's name. Returns True on success. +/
struct SetMyNameMethod
{
    mixin TelegramMethod!"/setMyName";
    /// New bot name; 0-64 characters. Pass an empty string to remove the dedicated name for the given language.
    @serdeOptional
    Nullable!(string) name;
    /// A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose language there is no dedicated name.
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to change the bot's name. Returns True on success. +/
bool setMyName(BotApi api, SetMyNameMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current bot name for the given user language. Returns BotName on success. +/
struct GetMyNameMethod
{
    mixin TelegramMethod!"/getMyName";
    /// A two-letter ISO 639-1 language code or an empty string
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to get the current bot name for the given user language. Returns BotName on success. +/
BotName getMyName(BotApi api, GetMyNameMethod method)
{
    return api.callMethod!(BotName)(method);
}

/++ Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success. +/
struct SetMyDescriptionMethod
{
    mixin TelegramMethod!"/setMyDescription";
    /// New bot description; 0-512 characters. Pass an empty string to remove the dedicated description for the given language.
    @serdeOptional
    Nullable!(string) description;
    /// A two-letter ISO 639-1 language code. If empty, the description will be applied to all users for whose language there is no dedicated description.
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success. +/
bool setMyDescription(BotApi api, SetMyDescriptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current bot description for the given user language. Returns BotDescription on success. +/
struct GetMyDescriptionMethod
{
    mixin TelegramMethod!"/getMyDescription";
    /// A two-letter ISO 639-1 language code or an empty string
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to get the current bot description for the given user language. Returns BotDescription on success. +/
BotDescription getMyDescription(BotApi api, GetMyDescriptionMethod method)
{
    return api.callMethod!(BotDescription)(method);
}

/++ Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success. +/
struct SetMyShortDescriptionMethod
{
    mixin TelegramMethod!"/setMyShortDescription";
    /// New short description for the bot; 0-120 characters. Pass an empty string to remove the dedicated short description for the given language.
    @serdeOptional
    Nullable!(string) short_description;
    /// A two-letter ISO 639-1 language code. If empty, the short description will be applied to all users for whose language there is no dedicated short description.
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success. +/
bool setMyShortDescription(BotApi api, SetMyShortDescriptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success. +/
struct GetMyShortDescriptionMethod
{
    mixin TelegramMethod!"/getMyShortDescription";
    /// A two-letter ISO 639-1 language code or an empty string
    @serdeOptional
    Nullable!(string) language_code;
}

/++ Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success. +/
BotShortDescription getMyShortDescription(BotApi api, GetMyShortDescriptionMethod method)
{
    return api.callMethod!(BotShortDescription)(method);
}

/++ Changes the profile photo of the bot. Returns True on success. +/
struct SetMyProfilePhotoMethod
{
    mixin TelegramMethod!"/setMyProfilePhoto";
    /// The new profile photo to set
    InputProfilePhoto photo;
}

/++ Changes the profile photo of the bot. Returns True on success. +/
bool setMyProfilePhoto(BotApi api, SetMyProfilePhotoMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success. +/
struct SetChatMenuButtonMethod
{
    mixin TelegramMethod!"/setChatMenuButton";
    /// Unique identifier for the target private chat. If not specified, the bot's default menu button will be changed.
    @serdeOptional
    Nullable!(long) chat_id;
    /// A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault.
    @serdeOptional
    Nullable!(MenuButton) menu_button;
}

/++ Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success. +/
bool setChatMenuButton(BotApi api, SetChatMenuButtonMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current value of the bot's menu button in a private chat, or the default menu button. Returns MenuButton on success. +/
struct GetChatMenuButtonMethod
{
    mixin TelegramMethod!"/getChatMenuButton";
    /// Unique identifier for the target private chat. If not specified, the bot's default menu button will be returned.
    @serdeOptional
    Nullable!(long) chat_id;
}


/++ Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success. +/
struct SetMyDefaultAdministratorRightsMethod
{
    mixin TelegramMethod!"/setMyDefaultAdministratorRights";
    /// A JSON-serialized object describing new default administrator rights. If not specified, the default administrator rights will be cleared.
    @serdeOptional
    Nullable!(ChatAdministratorRights) rights;
    /// Pass True to change the default administrator rights of the bot in channels. Otherwise, the default administrator rights of the bot for groups and supergroups will be changed.
    @serdeOptional
    Nullable!(bool) for_channels;
}

/++ Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success. +/
bool setMyDefaultAdministratorRights(BotApi api, SetMyDefaultAdministratorRightsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success. +/
struct GetMyDefaultAdministratorRightsMethod
{
    mixin TelegramMethod!"/getMyDefaultAdministratorRights";
    /// Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.
    @serdeOptional
    Nullable!(bool) for_channels;
}

/++ Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success. +/
ChatAdministratorRights getMyDefaultAdministratorRights(BotApi api, GetMyDefaultAdministratorRightsMethod method)
{
    return api.callMethod!(ChatAdministratorRights)(method);
}

/++ Sends a gift to the given user or channel chat. The gift can't be converted to Telegram Stars by the receiver. Returns True on success. +/
struct SendGiftMethod
{
    mixin TelegramMethod!"/sendGift";
    /// Required if chat_id is not specified. Unique identifier of the target user who will receive the gift.
    @serdeOptional
    Nullable!(long) user_id;
    /// Required if user_id is not specified. Unique identifier for the chat or username of the channel (in the format @username) that will receive the gift.
    @serdeOptional
    Nullable!(ChatId) chat_id;
    /// Identifier of the gift; limited gifts can't be sent to channel chats
    string gift_id;
    /// Pass True to pay for the gift upgrade from the bot's balance, thereby making the upgrade free for the receiver
    @serdeOptional
    Nullable!(bool) pay_for_upgrade;
    /// Text that will be shown along with the gift; 0-128 characters
    @serdeOptional
    Nullable!(string) text;
    /// Mode for parsing entities in the text. See formatting options for more details. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, “custom_emoji”, and “date_time” are ignored.
    @serdeOptional
    Nullable!(string) text_parse_mode;
    /// A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, “custom_emoji”, and “date_time” are ignored.
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
}

/++ Sends a gift to the given user or channel chat. The gift can't be converted to Telegram Stars by the receiver. Returns True on success. +/
bool sendGift(BotApi api, SendGiftMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Gifts a Telegram Premium subscription to the given user. Returns True on success. +/
struct GiftPremiumSubscriptionMethod
{
    mixin TelegramMethod!"/giftPremiumSubscription";
    /// Unique identifier of the target user who will receive a Telegram Premium subscription
    long user_id;
    /// Number of months the Telegram Premium subscription will be active for the user; must be one of 3, 6, or 12
    long month_count;
    /// Number of Telegram Stars to pay for the Telegram Premium subscription; must be 1000 for 3 months, 1500 for 6 months, and 2500 for 12 months
    long star_count;
    /// Text that will be shown along with the service message about the subscription; 0-128 characters
    @serdeOptional
    Nullable!(string) text;
    /// Mode for parsing entities in the text. See formatting options for more details. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, “custom_emoji”, and “date_time” are ignored.
    @serdeOptional
    Nullable!(string) text_parse_mode;
    /// A JSON-serialized list of special entities that appear in the gift text. It can be specified instead of text_parse_mode. Entities other than “bold”, “italic”, “underline”, “strikethrough”, “spoiler”, “custom_emoji”, and “date_time” are ignored.
    @serdeOptional
    Nullable!(MessageEntity[]) text_entities;
}

/++ Gifts a Telegram Premium subscription to the given user. Returns True on success. +/
bool giftPremiumSubscription(BotApi api, GiftPremiumSubscriptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Verifies a user on behalf of the organization which is represented by the bot. Returns True on success. +/
struct VerifyUserMethod
{
    mixin TelegramMethod!"/verifyUser";
    /// Unique identifier of the target user
    long user_id;
    /// Custom description for the verification; 0-70 characters. Must be empty if the organization isn't allowed to provide a custom verification description.
    @serdeOptional
    Nullable!(string) custom_description;
}

/++ Verifies a user on behalf of the organization which is represented by the bot. Returns True on success. +/
bool verifyUser(BotApi api, VerifyUserMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success. +/
struct VerifyChatMethod
{
    mixin TelegramMethod!"/verifyChat";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username. Channel direct messages chats can't be verified.
    ChatId chat_id;
    /// Custom description for the verification; 0-70 characters. Must be empty if the organization isn't allowed to provide a custom verification description.
    @serdeOptional
    Nullable!(string) custom_description;
}

/++ Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success. +/
bool verifyChat(BotApi api, VerifyChatMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Removes verification from a user who is currently verified on behalf of the organization represented by the bot. Returns True on success. +/
struct RemoveUserVerificationMethod
{
    mixin TelegramMethod!"/removeUserVerification";
    /// Unique identifier of the target user
    long user_id;
}

/++ Removes verification from a user who is currently verified on behalf of the organization represented by the bot. Returns True on success. +/
bool removeUserVerification(BotApi api, RemoveUserVerificationMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Removes verification from a chat that is currently verified on behalf of the organization represented by the bot. Returns True on success. +/
struct RemoveChatVerificationMethod
{
    mixin TelegramMethod!"/removeChatVerification";
    /// Unique identifier for the target chat or username of the target bot or channel in the format @username
    ChatId chat_id;
}

/++ Removes verification from a chat that is currently verified on behalf of the organization represented by the bot. Returns True on success. +/
bool removeChatVerification(BotApi api, RemoveChatVerificationMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Marks incoming message as read on behalf of a business account. Requires the can_read_messages business bot right. Returns True on success. +/
struct ReadBusinessMessageMethod
{
    mixin TelegramMethod!"/readBusinessMessage";
    /// Unique identifier of the business connection on behalf of which to read the message
    string business_connection_id;
    /// Unique identifier of the chat in which the message was received. The chat must have been active in the last 24 hours.
    long chat_id;
    /// Unique identifier of the message to mark as read
    long message_id;
}

/++ Marks incoming message as read on behalf of a business account. Requires the can_read_messages business bot right. Returns True on success. +/
bool readBusinessMessage(BotApi api, ReadBusinessMessageMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Delete messages on behalf of a business account. Requires the can_delete_sent_messages business bot right to delete messages sent by the bot itself, or the can_delete_all_messages business bot right to delete any message. Returns True on success. +/
struct DeleteBusinessMessagesMethod
{
    mixin TelegramMethod!"/deleteBusinessMessages";
    /// Unique identifier of the business connection on behalf of which to delete the messages
    string business_connection_id;
    /// A JSON-serialized list of 1-100 identifiers of messages to delete. All messages must be from the same chat. See deleteMessage for limitations on which messages can be deleted.
    long[] message_ids;
}

/++ Delete messages on behalf of a business account. Requires the can_delete_sent_messages business bot right to delete messages sent by the bot itself, or the can_delete_all_messages business bot right to delete any message. Returns True on success. +/
bool deleteBusinessMessages(BotApi api, DeleteBusinessMessagesMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Changes the first and last name of a managed business account. Requires the can_change_name business bot right. Returns True on success. +/
struct SetBusinessAccountNameMethod
{
    mixin TelegramMethod!"/setBusinessAccountName";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// The new value of the first name for the business account; 1-64 characters
    string first_name;
    /// The new value of the last name for the business account; 0-64 characters
    @serdeOptional
    Nullable!(string) last_name;
}

/++ Changes the first and last name of a managed business account. Requires the can_change_name business bot right. Returns True on success. +/
bool setBusinessAccountName(BotApi api, SetBusinessAccountNameMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Changes the username of a managed business account. Requires the can_change_username business bot right. Returns True on success. +/
struct SetBusinessAccountUsernameMethod
{
    mixin TelegramMethod!"/setBusinessAccountUsername";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// The new value of the username for the business account; 0-32 characters
    @serdeOptional
    Nullable!(string) username;
}

/++ Changes the username of a managed business account. Requires the can_change_username business bot right. Returns True on success. +/
bool setBusinessAccountUsername(BotApi api, SetBusinessAccountUsernameMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Changes the bio of a managed business account. Requires the can_change_bio business bot right. Returns True on success. +/
struct SetBusinessAccountBioMethod
{
    mixin TelegramMethod!"/setBusinessAccountBio";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// The new value of the bio for the business account; 0-140 characters
    @serdeOptional
    Nullable!(string) bio;
}

/++ Changes the bio of a managed business account. Requires the can_change_bio business bot right. Returns True on success. +/
bool setBusinessAccountBio(BotApi api, SetBusinessAccountBioMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Changes the profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success. +/
struct SetBusinessAccountProfilePhotoMethod
{
    mixin TelegramMethod!"/setBusinessAccountProfilePhoto";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// The new profile photo to set
    InputProfilePhoto photo;
    /// Pass True to set the public photo, which will be visible even if the main photo is hidden by the business account's privacy settings. An account can have only one public photo.
    @serdeOptional
    Nullable!(bool) is_public;
}

/++ Changes the profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success. +/
bool setBusinessAccountProfilePhoto(BotApi api, SetBusinessAccountProfilePhotoMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Removes the current profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success. +/
struct RemoveBusinessAccountProfilePhotoMethod
{
    mixin TelegramMethod!"/removeBusinessAccountProfilePhoto";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Pass True to remove the public photo, which is visible even if the main photo is hidden by the business account's privacy settings. After the main photo is removed, the previous profile photo (if present) becomes the main photo.
    @serdeOptional
    Nullable!(bool) is_public;
}

/++ Removes the current profile photo of a managed business account. Requires the can_edit_profile_photo business bot right. Returns True on success. +/
bool removeBusinessAccountProfilePhoto(BotApi api, RemoveBusinessAccountProfilePhotoMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Changes the privacy settings pertaining to incoming gifts in a managed business account. Requires the can_change_gift_settings business bot right. Returns True on success. +/
struct SetBusinessAccountGiftSettingsMethod
{
    mixin TelegramMethod!"/setBusinessAccountGiftSettings";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Pass True if a button for sending a gift to the user or by the business account must always be shown in the input field
    bool show_gift_button;
    /// Types of gifts accepted by the business account
    AcceptedGiftTypes accepted_gift_types;
}

/++ Changes the privacy settings pertaining to incoming gifts in a managed business account. Requires the can_change_gift_settings business bot right. Returns True on success. +/
bool setBusinessAccountGiftSettings(BotApi api, SetBusinessAccountGiftSettingsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Returns the amount of Telegram Stars owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns StarAmount on success. +/
struct GetBusinessAccountStarBalanceMethod
{
    mixin TelegramMethod!"/getBusinessAccountStarBalance";
    /// Unique identifier of the business connection
    string business_connection_id;
}

/++ Returns the amount of Telegram Stars owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns StarAmount on success. +/
StarAmount getBusinessAccountStarBalance(BotApi api, GetBusinessAccountStarBalanceMethod method)
{
    return api.callMethod!(StarAmount)(method);
}

/++ Transfers Telegram Stars from the business account balance to the bot's balance. Requires the can_transfer_stars business bot right. Returns True on success. +/
struct TransferBusinessAccountStarsMethod
{
    mixin TelegramMethod!"/transferBusinessAccountStars";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Number of Telegram Stars to transfer; 1-10000
    long star_count;
}

/++ Transfers Telegram Stars from the business account balance to the bot's balance. Requires the can_transfer_stars business bot right. Returns True on success. +/
bool transferBusinessAccountStars(BotApi api, TransferBusinessAccountStarsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success. +/
struct GetBusinessAccountGiftsMethod
{
    mixin TelegramMethod!"/getBusinessAccountGifts";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Pass True to exclude gifts that aren't saved to the account's profile page
    @serdeOptional
    Nullable!(bool) exclude_unsaved;
    /// Pass True to exclude gifts that are saved to the account's profile page
    @serdeOptional
    Nullable!(bool) exclude_saved;
    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    @serdeOptional
    Nullable!(bool) exclude_unlimited;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_upgradable;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can't be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_non_upgradable;
    /// Pass True to exclude unique gifts
    @serdeOptional
    Nullable!(bool) exclude_unique;
    /// Pass True to exclude gifts that were assigned from the TON blockchain and can't be resold or transferred in Telegram
    @serdeOptional
    Nullable!(bool) exclude_from_blockchain;
    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    @serdeOptional
    Nullable!(bool) sort_by_price;
    /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    @serdeOptional
    Nullable!(string) offset;
    /// The maximum number of gifts to be returned; 1-100. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success. +/
OwnedGifts getBusinessAccountGifts(BotApi api, GetBusinessAccountGiftsMethod method)
{
    return api.callMethod!(OwnedGifts)(method);
}

/++ Returns the gifts owned and hosted by a user. Returns OwnedGifts on success. +/
struct GetUserGiftsMethod
{
    mixin TelegramMethod!"/getUserGifts";
    /// Unique identifier of the user
    long user_id;
    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    @serdeOptional
    Nullable!(bool) exclude_unlimited;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_upgradable;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can't be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_non_upgradable;
    /// Pass True to exclude gifts that were assigned from the TON blockchain and can't be resold or transferred in Telegram
    @serdeOptional
    Nullable!(bool) exclude_from_blockchain;
    /// Pass True to exclude unique gifts
    @serdeOptional
    Nullable!(bool) exclude_unique;
    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    @serdeOptional
    Nullable!(bool) sort_by_price;
    /// Offset of the first entry to return as received from the previous request; use an empty string to get the first chunk of results
    @serdeOptional
    Nullable!(string) offset;
    /// The maximum number of gifts to be returned; 1-100. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Returns the gifts owned and hosted by a user. Returns OwnedGifts on success. +/
OwnedGifts getUserGifts(BotApi api, GetUserGiftsMethod method)
{
    return api.callMethod!(OwnedGifts)(method);
}

/++ Returns the gifts owned by a chat. Returns OwnedGifts on success. +/
struct GetChatGiftsMethod
{
    mixin TelegramMethod!"/getChatGifts";
    /// Unique identifier for the target chat or username of the target channel in the format @username
    ChatId chat_id;
    /// Pass True to exclude gifts that aren't saved to the chat's profile page. Always True, unless the bot has the can_post_messages administrator right in the channel.
    @serdeOptional
    Nullable!(bool) exclude_unsaved;
    /// Pass True to exclude gifts that are saved to the chat's profile page. Always False, unless the bot has the can_post_messages administrator right in the channel.
    @serdeOptional
    Nullable!(bool) exclude_saved;
    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    @serdeOptional
    Nullable!(bool) exclude_unlimited;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_upgradable;
    /// Pass True to exclude gifts that can be purchased a limited number of times and can't be upgraded to unique
    @serdeOptional
    Nullable!(bool) exclude_limited_non_upgradable;
    /// Pass True to exclude gifts that were assigned from the TON blockchain and can't be resold or transferred in Telegram
    @serdeOptional
    Nullable!(bool) exclude_from_blockchain;
    /// Pass True to exclude unique gifts
    @serdeOptional
    Nullable!(bool) exclude_unique;
    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    @serdeOptional
    Nullable!(bool) sort_by_price;
    /// Offset of the first entry to return as received from the previous request; use an empty string to get the first chunk of results
    @serdeOptional
    Nullable!(string) offset;
    /// The maximum number of gifts to be returned; 1-100. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Returns the gifts owned by a chat. Returns OwnedGifts on success. +/
OwnedGifts getChatGifts(BotApi api, GetChatGiftsMethod method)
{
    return api.callMethod!(OwnedGifts)(method);
}

/++ Converts a given regular gift to Telegram Stars. Requires the can_convert_gifts_to_stars business bot right. Returns True on success. +/
struct ConvertGiftToStarsMethod
{
    mixin TelegramMethod!"/convertGiftToStars";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the regular gift that should be converted to Telegram Stars
    string owned_gift_id;
}

/++ Converts a given regular gift to Telegram Stars. Requires the can_convert_gifts_to_stars business bot right. Returns True on success. +/
bool convertGiftToStars(BotApi api, ConvertGiftToStarsMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Upgrades a given regular gift to a unique gift. Requires the can_transfer_and_upgrade_gifts business bot right. Additionally requires the can_transfer_stars business bot right if the upgrade is paid. Returns True on success. +/
struct UpgradeGiftMethod
{
    mixin TelegramMethod!"/upgradeGift";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the regular gift that should be upgraded to a unique one
    string owned_gift_id;
    /// Pass True to keep the original gift text, sender and receiver in the upgraded gift
    @serdeOptional
    Nullable!(bool) keep_original_details;
    /// The amount of Telegram Stars that will be paid for the upgrade from the business account balance. If gift.prepaid_upgrade_star_count > 0, then pass 0, otherwise, the can_transfer_stars business bot right is required and gift.upgrade_star_count must be passed.
    @serdeOptional
    Nullable!(long) star_count;
}

/++ Upgrades a given regular gift to a unique gift. Requires the can_transfer_and_upgrade_gifts business bot right. Additionally requires the can_transfer_stars business bot right if the upgrade is paid. Returns True on success. +/
bool upgradeGift(BotApi api, UpgradeGiftMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Transfers an owned unique gift to another user. Requires the can_transfer_and_upgrade_gifts business bot right. Requires can_transfer_stars business bot right if the transfer is paid. Returns True on success. +/
struct TransferGiftMethod
{
    mixin TelegramMethod!"/transferGift";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the regular gift that should be transferred
    string owned_gift_id;
    /// Unique identifier of the chat which will own the gift. The chat must be active in the last 24 hours.
    long new_owner_chat_id;
    /// The amount of Telegram Stars that will be paid for the transfer from the business account balance. If positive, then the can_transfer_stars business bot right is required.
    @serdeOptional
    Nullable!(long) star_count;
}

/++ Transfers an owned unique gift to another user. Requires the can_transfer_and_upgrade_gifts business bot right. Requires can_transfer_stars business bot right if the transfer is paid. Returns True on success. +/
bool transferGift(BotApi api, TransferGiftMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Posts a story on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success. +/
struct PostStoryMethod
{
    mixin TelegramMethod!"/postStory";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Content of the story
    InputStoryContent content;
    /// Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    long active_period;
    /// Caption of the story, 0-2048 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the story caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// A JSON-serialized list of clickable areas to be shown on the story
    @serdeOptional
    Nullable!(StoryArea[]) areas;
    /// Pass True to keep the story accessible after it expires
    @serdeOptional
    Nullable!(bool) post_to_chat_page;
    /// Pass True if the content of the story must be protected from forwarding and screenshotting
    @serdeOptional
    Nullable!(bool) protect_content;
}

/++ Posts a story on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success. +/
Story postStory(BotApi api, PostStoryMethod method)
{
    return api.callMethod!(Story)(method);
}

/++ Reposts a story on behalf of a business account from another business account. Both business accounts must be managed by the same bot, and the story on the source account must have been posted (or reposted) by the bot. Requires the can_manage_stories business bot right for both business accounts. Returns Story on success. +/
struct RepostStoryMethod
{
    mixin TelegramMethod!"/repostStory";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the chat which posted the story that should be reposted
    long from_chat_id;
    /// Unique identifier of the story that should be reposted
    long from_story_id;
    /// Period after which the story is moved to the archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400
    long active_period;
    /// Pass True to keep the story accessible after it expires
    @serdeOptional
    Nullable!(bool) post_to_chat_page;
    /// Pass True if the content of the story must be protected from forwarding and screenshotting
    @serdeOptional
    Nullable!(bool) protect_content;
}

/++ Reposts a story on behalf of a business account from another business account. Both business accounts must be managed by the same bot, and the story on the source account must have been posted (or reposted) by the bot. Requires the can_manage_stories business bot right for both business accounts. Returns Story on success. +/
Story repostStory(BotApi api, RepostStoryMethod method)
{
    return api.callMethod!(Story)(method);
}

/++ Edits a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success. +/
struct EditStoryMethod
{
    mixin TelegramMethod!"/editStory";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the story to edit
    long story_id;
    /// Content of the story
    InputStoryContent content;
    /// Caption of the story, 0-2048 characters after entities parsing
    @serdeOptional
    Nullable!(string) caption;
    /// Mode for parsing entities in the story caption. See formatting options for more details.
    @serdeOptional
    Nullable!(string) parse_mode;
    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    @serdeOptional
    Nullable!(MessageEntity[]) caption_entities;
    /// A JSON-serialized list of clickable areas to be shown on the story
    @serdeOptional
    Nullable!(StoryArea[]) areas;
}

/++ Edits a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns Story on success. +/
Story editStory(BotApi api, EditStoryMethod method)
{
    return api.callMethod!(Story)(method);
}

/++ Deletes a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns True on success. +/
struct DeleteStoryMethod
{
    mixin TelegramMethod!"/deleteStory";
    /// Unique identifier of the business connection
    string business_connection_id;
    /// Unique identifier of the story to delete
    long story_id;
}

/++ Deletes a story previously posted by the bot on behalf of a managed business account. Requires the can_manage_stories business bot right. Returns True on success. +/
bool deleteStory(BotApi api, DeleteStoryMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned. +/
struct AnswerWebAppQueryMethod
{
    mixin TelegramMethod!"/answerWebAppQuery";
    /// Unique identifier for the query to be answered
    string web_app_query_id;
    /// A JSON-serialized object describing the message to be sent
    InlineQueryResult result;
}

/++ Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned. +/
SentWebAppMessage answerWebAppQuery(BotApi api, AnswerWebAppQueryMethod method)
{
    return api.callMethod!(SentWebAppMessage)(method);
}

/++ Stores a message that can be sent by a user of a Mini App. Returns a PreparedInlineMessage object. +/
struct SavePreparedInlineMessageMethod
{
    mixin TelegramMethod!"/savePreparedInlineMessage";
    /// Unique identifier of the target user that can use the prepared message
    long user_id;
    /// A JSON-serialized object describing the message to be sent
    InlineQueryResult result;
    /// Pass True if the message can be sent to private chats with users
    @serdeOptional
    Nullable!(bool) allow_user_chats;
    /// Pass True if the message can be sent to private chats with bots
    @serdeOptional
    Nullable!(bool) allow_bot_chats;
    /// Pass True if the message can be sent to group and supergroup chats
    @serdeOptional
    Nullable!(bool) allow_group_chats;
    /// Pass True if the message can be sent to channel chats
    @serdeOptional
    Nullable!(bool) allow_channel_chats;
}

/++ Stores a message that can be sent by a user of a Mini App. Returns a PreparedInlineMessage object. +/
PreparedInlineMessage savePreparedInlineMessage(BotApi api, SavePreparedInlineMessageMethod method)
{
    return api.callMethod!(PreparedInlineMessage)(method);
}

/++ Stores a keyboard button that can be used by a user within a Mini App. Returns a PreparedKeyboardButton object. +/
struct SavePreparedKeyboardButtonMethod
{
    mixin TelegramMethod!"/savePreparedKeyboardButton";
    /// Unique identifier of the target user that can use the button
    long user_id;
    /// A JSON-serialized object describing the button to be saved. The button must be of the type request_users, request_chat, or request_managed_bot.
    KeyboardButton button;
}

/++ Stores a keyboard button that can be used by a user within a Mini App. Returns a PreparedKeyboardButton object. +/
PreparedKeyboardButton savePreparedKeyboardButton(BotApi api, SavePreparedKeyboardButtonMethod method)
{
    return api.callMethod!(PreparedKeyboardButton)(method);
}

/// Alias for the ReplyMarkup family of objects
alias ReplyMarkup = JsonableAlgebraicProxy!(InlineKeyboardMarkup, ReplyKeyboardMarkup, ReplyKeyboardRemove, ForceReply);
