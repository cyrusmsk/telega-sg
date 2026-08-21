// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.webhook;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;
import telega.telegram.generated.inline;
import telega.telegram.generated.payments;
import telega.telegram.generated.poll;

/++ This object represents an incoming update.At most one of the optional fields can be present in any given update. +/
struct Update
{
    /// The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This identifier becomes especially handy if you're using webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
    long update_id;
    /// New incoming message of any kind - text, photo, sticker, etc.
    @serdeOptional
    Nullable!(Message) message;
    /// New version of a message that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    @serdeOptional
    Nullable!(Message) edited_message;
    /// New incoming channel post of any kind - text, photo, sticker, etc.
    @serdeOptional
    Nullable!(Message) channel_post;
    /// New version of a channel post that is known to the bot and was edited. This update may at times be triggered by changes to message fields that are either unavailable or not actively used by your bot.
    @serdeOptional
    Nullable!(Message) edited_channel_post;
    /// The bot was connected to or disconnected from a business account, or a user edited an existing connection with the bot
    @serdeOptional
    Nullable!(BusinessConnection) business_connection;
    /// New message from a connected business account
    @serdeOptional
    Nullable!(Message) business_message;
    /// New version of a message from a connected business account
    @serdeOptional
    Nullable!(Message) edited_business_message;
    /// Messages were deleted from a connected business account
    @serdeOptional
    Nullable!(BusinessMessagesDeleted) deleted_business_messages;
    /// New guest message. The bot can use the field Message.guest_query_id and the method answerGuestQuery to send a message in response.
    @serdeOptional
    Nullable!(Message) guest_message;
    /// A reaction to a message was changed by a user. The bot must be an administrator in the chat and must explicitly specify "message_reaction" in the list of allowed_updates to receive these updates. The update isn't received for reactions set by bots.
    @serdeOptional
    Nullable!(MessageReactionUpdated) message_reaction;
    /// Reactions to a message with anonymous reactions were changed. The bot must be an administrator in the chat and must explicitly specify "message_reaction_count" in the list of allowed_updates to receive these updates. The updates are grouped and can be sent with delay up to a few minutes.
    @serdeOptional
    Nullable!(MessageReactionCountUpdated) message_reaction_count;
    /// New incoming inline query
    @serdeOptional
    Nullable!(InlineQuery) inline_query;
    /// The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
    @serdeOptional
    Nullable!(ChosenInlineResult) chosen_inline_result;
    /// New incoming callback query
    @serdeOptional
    Nullable!(CallbackQuery) callback_query;
    /// New incoming shipping query. Only for invoices with flexible price.
    @serdeOptional
    Nullable!(ShippingQuery) shipping_query;
    /// New incoming pre-checkout query. Contains full information about checkout.
    @serdeOptional
    Nullable!(PreCheckoutQuery) pre_checkout_query;
    /// A user purchased paid media with a non-empty payload sent by the bot in a non-channel chat
    @serdeOptional
    Nullable!(PaidMediaPurchased) purchased_paid_media;
    /// New poll state. Bots receive only updates about manually stopped polls and polls, which are sent by the bot.
    @serdeOptional
    Nullable!(Poll) poll;
    /// A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself.
    @serdeOptional
    Nullable!(PollAnswer) poll_answer;
    /// The bot's chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user.
    @serdeOptional
    Nullable!(ChatMemberUpdated) my_chat_member;
    /// A chat member's status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify "chat_member" in the list of allowed_updates to receive these updates.
    @serdeOptional
    Nullable!(ChatMemberUpdated) chat_member;
    /// A request to join the chat has been sent. The bot must have the can_invite_users administrator right in the chat to receive these updates.
    @serdeOptional
    Nullable!(ChatJoinRequest) chat_join_request;
    /// A chat boost was added or changed. The bot must be an administrator in the chat to receive these updates.
    @serdeOptional
    Nullable!(ChatBoostUpdated) chat_boost;
    /// A boost was removed from a chat. The bot must be an administrator in the chat to receive these updates.
    @serdeOptional
    Nullable!(ChatBoostRemoved) removed_chat_boost;
    /// A new bot was created to be managed by the bot, or token or owner of a managed bot was changed
    @serdeOptional
    Nullable!(ManagedBotUpdated) managed_bot;
    /// User payment subscription has changed
    @serdeOptional
    Nullable!(BotSubscriptionUpdated) subscription;
}

/++
Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.

Notes1. This method will not work if an outgoing webhook is set up.2. In order to avoid getting duplicate updates, recalculate offset after each server response.
+/
struct GetUpdatesMethod
{
    mixin TelegramMethod!"/getUpdates";
    /// Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will be forgotten.
    @serdeOptional
    Nullable!(long) offset;
    /// Limits the number of updates to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
    /// Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
    @serdeOptional
    Nullable!(long) timeout;
    /// A JSON-serialized list of the update types you want your bot to receive. For example, specify ["message", "edited_channel_post", "callback_query"] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member, message_reaction, and message_reaction_count (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to getUpdates, so unwanted updates may be received for a short period of time.
    @serdeOptional
    Nullable!(string[]) allowed_updates;
}

/++
Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.

Notes1. This method will not work if an outgoing webhook is set up.2. In order to avoid getting duplicate updates, recalculate offset after each server response.
+/
Update[] getUpdates(BotApi api, GetUpdatesMethod method)
{
    return api.callMethod!(Update[])(method);
}

/++
Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request (a request with response HTTP status code different from 2XY), we will repeat the request and give up after a reasonable amount of attempts. Returns True on success.

If you'd like to make sure that the webhook was set by you, you can specify secret data in the parameter secret_token. If specified, the request will contain a header “X-Telegram-Bot-Api-Secret-Token” with the secret token as content.

Notes1. You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.2. To use a self-signed certificate, you need to upload your public key certificate using certificate parameter. Please upload as InputFile, sending a String will not work.3. Ports currently supported for webhooks: 443, 80, 88, 8443. If you're having any trouble setting up webhooks, please check out this amazing guide to webhooks.
+/
struct SetWebhookMethod
{
    mixin TelegramMethod!"/setWebhook";
    /// HTTPS URL to send updates to. Use an empty string to remove webhook integration.
    string url;
    /// Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
    @serdeOptional
    Nullable!(InputFile) certificate;
    /// The fixed IP address which will be used to send webhook requests instead of the IP address resolved through DNS
    @serdeOptional
    Nullable!(string) ip_address;
    /// The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot's server, and higher values to increase your bot's throughput.
    @serdeOptional
    Nullable!(long) max_connections;
    /// A JSON-serialized list of the update types you want your bot to receive. For example, specify ["message", "edited_channel_post", "callback_query"] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member, message_reaction, and message_reaction_count (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
    @serdeOptional
    Nullable!(string[]) allowed_updates;
    /// Pass True to drop all pending updates
    @serdeOptional
    Nullable!(bool) drop_pending_updates;
    /// A secret token to be sent in a header “X-Telegram-Bot-Api-Secret-Token” in every webhook request, 1-256 characters. Only characters A-Z, a-z, 0-9, _ and - are allowed. The header is useful to ensure that the request comes from a webhook set by you.
    @serdeOptional
    Nullable!(string) secret_token;
}

/++
Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request (a request with response HTTP status code different from 2XY), we will repeat the request and give up after a reasonable amount of attempts. Returns True on success.

If you'd like to make sure that the webhook was set by you, you can specify secret data in the parameter secret_token. If specified, the request will contain a header “X-Telegram-Bot-Api-Secret-Token” with the secret token as content.

Notes1. You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.2. To use a self-signed certificate, you need to upload your public key certificate using certificate parameter. Please upload as InputFile, sending a String will not work.3. Ports currently supported for webhooks: 443, 80, 88, 8443. If you're having any trouble setting up webhooks, please check out this amazing guide to webhooks.
+/
bool setWebhook(BotApi api, SetWebhookMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. +/
struct DeleteWebhookMethod
{
    mixin TelegramMethod!"/deleteWebhook";
    /// Pass True to drop all pending updates
    @serdeOptional
    Nullable!(bool) drop_pending_updates;
}

/++ Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. +/
bool deleteWebhook(BotApi api, DeleteWebhookMethod method)
{
    return api.callMethod!(bool)(method);
}

struct GetWebhookInfoMethod
{
    mixin TelegramMethod!"/getWebhookInfo";
}


/++ Describes the current status of a webhook. +/
struct WebhookInfo
{
    /// Webhook URL, may be empty if webhook is not set up
    string url;
    /// True, if a custom certificate was provided for webhook certificate checks
    bool has_custom_certificate;
    /// Number of updates awaiting delivery
    long pending_update_count;
    /// Currently used webhook IP address
    @serdeOptional
    Nullable!(string) ip_address;
    /// Unix time for the most recent error that happened when trying to deliver an update via webhook
    @serdeOptional
    Nullable!(long) last_error_date;
    /// Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
    @serdeOptional
    Nullable!(string) last_error_message;
    /// Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters
    @serdeOptional
    Nullable!(long) last_synchronization_error_date;
    /// The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
    @serdeOptional
    Nullable!(long) max_connections;
    /// A list of update types the bot is subscribed to. Defaults to all update types except chat_member, message_reaction, and message_reaction_count.
    @serdeOptional
    Nullable!(string[]) allowed_updates;
}
