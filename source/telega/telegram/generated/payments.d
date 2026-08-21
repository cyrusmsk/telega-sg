// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.payments;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;
import telega.telegram.generated.basic;

/++ Use this method to send invoices. On success, the sent Message is returned. +/
struct SendInvoiceMethod
{
    mixin TelegramMethod!"/sendInvoice";
    /// Unique identifier for the target chat or username of the target bot, supergroup or channel in the format @username
    ChatId chat_id;
    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    @serdeOptional
    Nullable!(long) message_thread_id;
    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    @serdeOptional
    Nullable!(long) direct_messages_topic_id;
    /// Product name, 1-32 characters
    string title;
    /// Product description, 1-255 characters
    string description;
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    string payload;
    /// Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    @serdeOptional
    Nullable!(string) provider_token;
    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    string currency;
    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    LabeledPrice[] prices;
    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    @serdeOptional
    Nullable!(long) max_tip_amount;
    /// A JSON-serialized Array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    @serdeOptional
    Nullable!(long[]) suggested_tip_amounts;
    /// Unique deep-linking parameter. If left empty, forwarded copies of the sent message will have a Pay button, allowing multiple users to pay directly from the forwarded message, using the same invoice. If non-empty, forwarded copies of the sent message will have a URL button with a deep link to the bot (instead of a Pay button), with the value used as the start parameter.
    @serdeOptional
    Nullable!(string) start_parameter;
    /// JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    @serdeOptional
    Nullable!(string) provider_data;
    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    @serdeOptional
    Nullable!(string) photo_url;
    /// Photo size in bytes
    @serdeOptional
    Nullable!(long) photo_size;
    /// Photo width
    @serdeOptional
    Nullable!(long) photo_width;
    /// Photo height
    @serdeOptional
    Nullable!(long) photo_height;
    /// Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_name;
    /// Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_phone_number;
    /// Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_email;
    /// Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_shipping_address;
    /// Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_phone_number_to_provider;
    /// Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_email_to_provider;
    /// Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) is_flexible;
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
    /// A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
    @serdeOptional
    Nullable!(InlineKeyboardMarkup) reply_markup;
}

/++ Use this method to send invoices. On success, the sent Message is returned. +/
Message sendInvoice(BotApi api, SendInvoiceMethod method)
{
    return api.callMethod!(Message)(method);
}

/++ Use this method to create a link for an invoice. Returns the created invoice link as String on success. +/
struct CreateInvoiceLinkMethod
{
    mixin TelegramMethod!"/createInvoiceLink";
    /// Unique identifier of the business connection on behalf of which the link will be created. For payments in Telegram Stars only.
    @serdeOptional
    Nullable!(string) business_connection_id;
    /// Product name, 1-32 characters
    string title;
    /// Product description, 1-255 characters
    string description;
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    string payload;
    /// Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    @serdeOptional
    Nullable!(string) provider_token;
    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    string currency;
    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    LabeledPrice[] prices;
    /// The number of seconds the subscription will be active for before the next payment. The currency must be set to “XTR” (Telegram Stars) if the parameter is used. Currently, it must always be 2592000 (30 days) if specified. Any number of subscriptions can be active for a given bot at the same time, including multiple concurrent subscriptions from the same user. Subscription price must no exceed 10000 Telegram Stars.
    @serdeOptional
    Nullable!(long) subscription_period;
    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    @serdeOptional
    Nullable!(long) max_tip_amount;
    /// A JSON-serialized Array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    @serdeOptional
    Nullable!(long[]) suggested_tip_amounts;
    /// JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    @serdeOptional
    Nullable!(string) provider_data;
    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    @serdeOptional
    Nullable!(string) photo_url;
    /// Photo size in bytes
    @serdeOptional
    Nullable!(long) photo_size;
    /// Photo width
    @serdeOptional
    Nullable!(long) photo_width;
    /// Photo height
    @serdeOptional
    Nullable!(long) photo_height;
    /// Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_name;
    /// Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_phone_number;
    /// Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_email;
    /// Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) need_shipping_address;
    /// Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_phone_number_to_provider;
    /// Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) send_email_to_provider;
    /// Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    @serdeOptional
    Nullable!(bool) is_flexible;
}

/++ Use this method to create a link for an invoice. Returns the created invoice link as String on success. +/
string createInvoiceLink(BotApi api, CreateInvoiceLinkMethod method)
{
    return api.callMethod!(string)(method);
}

/++ If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned. +/
struct AnswerShippingQueryMethod
{
    mixin TelegramMethod!"/answerShippingQuery";
    /// Unique identifier for the query to be answered
    string shipping_query_id;
    /// Pass True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
    bool ok;
    /// Required if ok is True. A JSON-serialized Array of available shipping options.
    @serdeOptional
    Nullable!(ShippingOption[]) shipping_options;
    /// Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. “Sorry, delivery to your desired address is unavailable”). Telegram will display this message to the user.
    @serdeOptional
    Nullable!(string) error_message;
}

/++ If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned. +/
bool answerShippingQuery(BotApi api, AnswerShippingQueryMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent. +/
struct AnswerPreCheckoutQueryMethod
{
    mixin TelegramMethod!"/answerPreCheckoutQuery";
    /// Unique identifier for the query to be answered
    string pre_checkout_query_id;
    /// Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
    bool ok;
    /// Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
    @serdeOptional
    Nullable!(string) error_message;
}

/++ Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent. +/
bool answerPreCheckoutQuery(BotApi api, AnswerPreCheckoutQueryMethod method)
{
    return api.callMethod!(bool)(method);
}

struct GetMyStarBalanceMethod
{
    mixin TelegramMethod!"/getMyStarBalance";
}


/++ Returns the bot's Telegram Star transactions in chronological order. On success, returns a StarTransactions object. +/
struct GetStarTransactionsMethod
{
    mixin TelegramMethod!"/getStarTransactions";
    /// Number of transactions to skip in the response
    @serdeOptional
    Nullable!(long) offset;
    /// The maximum number of transactions to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    @serdeOptional
    Nullable!(long) limit;
}

/++ Returns the bot's Telegram Star transactions in chronological order. On success, returns a StarTransactions object. +/
StarTransactions getStarTransactions(BotApi api, GetStarTransactionsMethod method)
{
    return api.callMethod!(StarTransactions)(method);
}

/++ Refunds a successful payment in Telegram Stars. Returns True on success. +/
struct RefundStarPaymentMethod
{
    mixin TelegramMethod!"/refundStarPayment";
    /// Identifier of the user whose payment will be refunded
    long user_id;
    /// Telegram payment identifier
    string telegram_payment_charge_id;
}

/++ Refunds a successful payment in Telegram Stars. Returns True on success. +/
bool refundStarPayment(BotApi api, RefundStarPaymentMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars. Returns True on success. +/
struct EditUserStarSubscriptionMethod
{
    mixin TelegramMethod!"/editUserStarSubscription";
    /// Identifier of the user whose subscription will be edited
    long user_id;
    /// Telegram payment identifier for the subscription
    string telegram_payment_charge_id;
    /// Pass True to cancel extension of the user subscription; the subscription must be active up to the end of the current subscription period. Pass False to allow the user to re-enable a subscription that was previously canceled by the bot.
    bool is_canceled;
}

/++ Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars. Returns True on success. +/
bool editUserStarSubscription(BotApi api, EditUserStarSubscriptionMethod method)
{
    return api.callMethod!(bool)(method);
}

/++ This object represents a portion of the price for goods or services. +/
struct LabeledPrice
{
    /// Portion label
    string label;
    /// Price of the product in the smallest units of the currency (integer, not float/double). For example, for a price of US$$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    long amount;
}

/++ This object contains basic information about an invoice. +/
struct Invoice
{
    /// Product name
    string title;
    /// Product description
    string description;
    /// Unique bot deep-linking parameter that can be used to generate this invoice
    string start_parameter;
    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars
    string currency;
    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    long total_amount;
}

/++ This object represents a shipping address. +/
struct ShippingAddress
{
    /// Two-letter ISO 3166-1 alpha-2 country code
    string country_code;
    /// State, if applicable
    string state;
    /// City
    string city;
    /// First line for the address
    string street_line1;
    /// Second line for the address
    string street_line2;
    /// Address post code
    string post_code;
}

/++ This object represents information about an order. +/
struct OrderInfo
{
    /// User name
    @serdeOptional
    Nullable!(string) name;
    /// User's phone number
    @serdeOptional
    Nullable!(string) phone_number;
    /// User email
    @serdeOptional
    Nullable!(string) email;
    /// User shipping address
    @serdeOptional
    Nullable!(ShippingAddress) shipping_address;
}

/++ This object represents one shipping option. +/
struct ShippingOption
{
    /// Shipping option identifier
    string id;
    /// Option title
    string title;
    /// List of price portions
    LabeledPrice[] prices;
}

/++ This object contains basic information about a successful payment. Note that if the buyer initiates a chargeback with the relevant payment provider following this transaction, the funds may be debited from your balance. This is outside of Telegram's control. +/
struct SuccessfulPayment
{
    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars
    string currency;
    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    long total_amount;
    /// Bot-specified invoice payload
    string invoice_payload;
    /// Expiration date of the subscription, in Unix time; for recurring payments only
    @serdeOptional
    Nullable!(long) subscription_expiration_date;
    /// True, if the payment is a recurring payment for a subscription
    @serdeOptional
    Nullable!(bool) is_recurring;
    /// True, if the payment is the first payment for a subscription
    @serdeOptional
    Nullable!(bool) is_first_recurring;
    /// Identifier of the shipping option chosen by the user
    @serdeOptional
    Nullable!(string) shipping_option_id;
    /// Order information provided by the user
    @serdeOptional
    Nullable!(OrderInfo) order_info;
    /// Telegram payment identifier
    string telegram_payment_charge_id;
    /// Provider payment identifier
    string provider_payment_charge_id;
}

/++ This object contains basic information about a refunded payment. +/
struct RefundedPayment
{
    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars. Currently, always “XTR”.
    string currency;
    /// Total refunded price in the smallest units of the currency (integer, not float/double). For example, for a price of US$$ 1.45, total_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    long total_amount;
    /// Bot-specified invoice payload
    string invoice_payload;
    /// Telegram payment identifier
    string telegram_payment_charge_id;
    /// Provider payment identifier
    @serdeOptional
    Nullable!(string) provider_payment_charge_id;
}

/++ This object contains information about an incoming shipping query. +/
struct ShippingQuery
{
    /// Unique query identifier
    string id;
    /// User who sent the query
    User from;
    /// Bot-specified invoice payload
    string invoice_payload;
    /// User specified shipping address
    ShippingAddress shipping_address;
}

/++ This object contains information about an incoming pre-checkout query. +/
struct PreCheckoutQuery
{
    /// Unique query identifier
    string id;
    /// User who sent the query
    User from;
    /// Three-letter ISO 4217 currency code, or “XTR” for payments in Telegram Stars
    string currency;
    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    long total_amount;
    /// Bot-specified invoice payload
    string invoice_payload;
    /// Identifier of the shipping option chosen by the user
    @serdeOptional
    Nullable!(string) shipping_option_id;
    /// Order information provided by the user
    @serdeOptional
    Nullable!(OrderInfo) order_info;
}

/++ This object contains information about a paid media purchase. +/
struct PaidMediaPurchased
{
    /// User who purchased the media
    User from;
    /// Bot-specified paid media payload
    string paid_media_payload;
}

alias RevenueWithdrawalState = JsonableAlgebraicProxy!(RevenueWithdrawalStateFailed, RevenueWithdrawalStatePending, RevenueWithdrawalStateSucceeded);

/++ The withdrawal is in progress. +/
struct RevenueWithdrawalStatePending
{
    /// Type of the state, always “pending”
    string type;
}

/++ The withdrawal succeeded. +/
struct RevenueWithdrawalStateSucceeded
{
    /// Type of the state, always “succeeded”
    string type;
    /// Date the withdrawal was completed in Unix time
    long date;
    /// An HTTPS URL that can be used to see transaction details
    string url;
}

/++ The withdrawal failed and the transaction was refunded. +/
struct RevenueWithdrawalStateFailed
{
    /// Type of the state, always “failed”
    string type;
}

/++ Contains information about the affiliate that received a commission via this transaction. +/
struct AffiliateInfo
{
    /// The bot or the user that received an affiliate commission if it was received by a bot or a user
    @serdeOptional
    Nullable!(User) affiliate_user;
    /// The chat that received an affiliate commission if it was received by a chat
    @serdeOptional
    Nullable!(Chat) affiliate_chat;
    /// The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the bot from referred users
    long commission_per_mille;
    /// Integer amount of Telegram Stars received by the affiliate from the transaction, rounded to 0; can be negative for refunds
    long amount;
    /// The number of 1/1000000000 shares of Telegram Stars received by the affiliate; from -999999999 to 999999999; can be negative for refunds
    @serdeOptional
    Nullable!(long) nanostar_amount;
}

alias TransactionPartner = JsonableAlgebraicProxy!(TransactionPartnerAffiliateProgram, TransactionPartnerChat, TransactionPartnerFragment, TransactionPartnerOther, TransactionPartnerTelegramAds, TransactionPartnerTelegramApi, TransactionPartnerUser);

/++ Describes a transaction with a user. +/
struct TransactionPartnerUser
{
    /// Type of the transaction partner, always “user”
    string type;
    /// Type of the transaction, currently one of “invoice_payment” for payments via invoices, “paid_media_payment” for payments for paid media, “gift_purchase” for gifts sent by the bot, “premium_purchase” for Telegram Premium subscriptions gifted by the bot, “business_account_transfer” for direct transfers from managed business accounts
    string transaction_type;
    /// Information about the user
    User user;
    /// Information about the affiliate that received a commission via this transaction. Can be available only for “invoice_payment” and “paid_media_payment” transactions.
    @serdeOptional
    Nullable!(AffiliateInfo) affiliate;
    /// Bot-specified invoice payload. Can be available only for “invoice_payment” transactions.
    @serdeOptional
    Nullable!(string) invoice_payload;
    /// The duration of the paid subscription. Can be available only for “invoice_payment” transactions.
    @serdeOptional
    Nullable!(long) subscription_period;
    /// Information about the paid media bought by the user; for “paid_media_payment” transactions only
    // TODO(telega-generator): family type 'PaidMedia[]' can't be deserialized yet
    /// Bot-specified paid media payload. Can be available only for “paid_media_payment” transactions.
    @serdeOptional
    Nullable!(string) paid_media_payload;
    /// The gift sent to the user by the bot; for “gift_purchase” transactions only
    @serdeOptional
    Nullable!(Gift) gift;
    /// Number of months the gifted Telegram Premium subscription will be active for; for “premium_purchase” transactions only
    @serdeOptional
    Nullable!(long) premium_subscription_duration;
}

/++ Describes a transaction with a chat. +/
struct TransactionPartnerChat
{
    /// Type of the transaction partner, always “chat”
    string type;
    /// Information about the chat
    Chat chat;
    /// The gift sent to the chat by the bot
    @serdeOptional
    Nullable!(Gift) gift;
}

/++ Describes the affiliate program that issued the affiliate commission received via this transaction. +/
struct TransactionPartnerAffiliateProgram
{
    /// Type of the transaction partner, always “affiliate_program”
    string type;
    /// Information about the bot that sponsored the affiliate program
    @serdeOptional
    Nullable!(User) sponsor_user;
    /// The number of Telegram Stars received by the bot for each 1000 Telegram Stars received by the affiliate program sponsor from referred users
    long commission_per_mille;
}

/++ Describes a withdrawal transaction with Fragment. +/
struct TransactionPartnerFragment
{
    /// Type of the transaction partner, always “fragment”
    string type;
    /// State of the transaction if the transaction is outgoing
    // TODO(telega-generator): family type 'RevenueWithdrawalState' can't be deserialized yet
}

/++ Describes a withdrawal transaction to the Telegram Ads platform. +/
struct TransactionPartnerTelegramAds
{
    /// Type of the transaction partner, always “telegram_ads”
    string type;
}

/++ Describes a transaction with payment for paid broadcasting. +/
struct TransactionPartnerTelegramApi
{
    /// Type of the transaction partner, always “telegram_api”
    string type;
    /// The number of successful requests that exceeded regular limits and were therefore billed
    long request_count;
}

/++ Describes a transaction with an unknown source or recipient. +/
struct TransactionPartnerOther
{
    /// Type of the transaction partner, always “other”
    string type;
}

/++ Describes a Telegram Star transaction. Note that if the buyer initiates a chargeback with the payment provider from whom they acquired Stars (e.g., Apple, Google) following this transaction, the refunded Stars will be deducted from the bot's balance. This is outside of Telegram's control. +/
struct StarTransaction
{
    /// Unique identifier of the transaction. Coincides with the identifier of the original transaction for refund transactions. Coincides with SuccessfulPayment.telegram_payment_charge_id for successful incoming payments from users.
    string id;
    /// Integer amount of Telegram Stars transferred by the transaction
    long amount;
    /// The number of 1/1000000000 shares of Telegram Stars transferred by the transaction; from 0 to 999999999
    @serdeOptional
    Nullable!(long) nanostar_amount;
    /// Date the transaction was created in Unix time
    long date;
    /// Source of an incoming transaction (e.g., a user purchasing goods or services, Fragment refunding a failed withdrawal). Only for incoming transactions.
    // TODO(telega-generator): family type 'TransactionPartner' can't be deserialized yet
    /// Receiver of an outgoing transaction (e.g., a user for a purchase refund, Fragment for a withdrawal). Only for outgoing transactions.
    // TODO(telega-generator): family type 'TransactionPartner' can't be deserialized yet
}

/++ Contains a list of Telegram Star transactions. +/
struct StarTransactions
{
    /// The list of transactions
    StarTransaction[] transactions;
}
