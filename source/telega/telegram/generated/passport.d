// Generated from Telegram Bot API 10.2 documentation by telega-api-generator.
// Do not edit manually!

module telega.telegram.generated.passport;

import asdf.serialization : serdeOptional;
import std.typecons : Nullable;
import telega.botapi : BotApi, ChatId, HTTPMethod, TelegramMethod;
import telega.serialization : JsonableAlgebraicProxy;

/++ Describes Telegram Passport data shared with the bot by the user. +/
struct PassportData
{
    /// Array with information about documents and other Telegram Passport elements that was shared with the bot
    EncryptedPassportElement[] data;
    /// Encrypted credentials required to decrypt the data
    EncryptedCredentials credentials;
}

/++ This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB. +/
struct PassportFile
{
    /// Identifier for this file, which can be used to download or reuse the file
    string file_id;
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    string file_unique_id;
    /// File size in bytes
    long file_size;
    /// Unix time when the file was uploaded
    long file_date;
}

/++ Describes documents or other Telegram Passport elements shared with the bot by the user. +/
struct EncryptedPassportElement
{
    /// Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
    string type;
    /// Base64-encoded encrypted Telegram Passport element data provided by the user; available only for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(string) data;
    /// User's verified phone number; available only for “phone_number” type
    @serdeOptional
    Nullable!(string) phone_number;
    /// User's verified email address; available only for “email” type
    @serdeOptional
    Nullable!(string) email;
    /// Array of encrypted files with documents provided by the user; available only for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(PassportFile[]) files;
    /// Encrypted file with the front side of the document, provided by the user; available only for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(PassportFile) front_side;
    /// Encrypted file with the reverse side of the document, provided by the user; available only for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(PassportFile) reverse_side;
    /// Encrypted file with the selfie of the user holding a document, provided by the user; available if requested for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(PassportFile) selfie;
    /// Array of encrypted files with translated versions of documents provided by the user; available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    @serdeOptional
    Nullable!(PassportFile[]) translation;
    /// Base64-encoded element hash for using in PassportElementErrorUnspecified
    string hash;
}

/++ Describes data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes. +/
struct EncryptedCredentials
{
    /// Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
    string data;
    /// Base64-encoded data hash for data authentication
    string hash;
    /// Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    string secret;
}

/++
Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.

Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.
+/
struct SetPassportDataErrorsMethod
{
    mixin TelegramMethod!"/setPassportDataErrors";
    /// User identifier
    long user_id;
    /// A JSON-serialized Array describing the errors
    PassportElementError[] errors;
}

/++
Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success.

Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason. For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc. Supply some details in the error message to make sure the user knows how to correct the issues.
+/
bool setPassportDataErrors(BotApi api, SetPassportDataErrorsMethod method)
{
    return api.callMethod!(bool)(method);
}

alias PassportElementError = JsonableAlgebraicProxy!(PassportElementErrorDataField, PassportElementErrorFile, PassportElementErrorFiles, PassportElementErrorFrontSide, PassportElementErrorReverseSide, PassportElementErrorSelfie, PassportElementErrorTranslationFile, PassportElementErrorTranslationFiles, PassportElementErrorUnspecified);

/++ Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes. +/
struct PassportElementErrorDataField
{
    /// Error source, must be data
    string source;
    /// The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”
    string type;
    /// Name of the data field which has the error
    string field_name;
    /// Base64-encoded data hash
    string data_hash;
    /// Error message
    string message;
}

/++ Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes. +/
struct PassportElementErrorFrontSide
{
    /// Error source, must be front_side
    string source;
    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    string type;
    /// Base64-encoded hash of the file with the front side of the document
    string file_hash;
    /// Error message
    string message;
}

/++ Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes. +/
struct PassportElementErrorReverseSide
{
    /// Error source, must be reverse_side
    string source;
    /// The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card”
    string type;
    /// Base64-encoded hash of the file with the reverse side of the document
    string file_hash;
    /// Error message
    string message;
}

/++ Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes. +/
struct PassportElementErrorSelfie
{
    /// Error source, must be selfie
    string source;
    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    string type;
    /// Base64-encoded hash of the file with the selfie
    string file_hash;
    /// Error message
    string message;
}

/++ Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes. +/
struct PassportElementErrorFile
{
    /// Error source, must be file
    string source;
    /// The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    string type;
    /// Base64-encoded file hash
    string file_hash;
    /// Error message
    string message;
}

/++ Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes. +/
struct PassportElementErrorFiles
{
    /// Error source, must be files
    string source;
    /// The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    string type;
    /// List of base64-encoded file hashes
    string[] file_hashes;
    /// Error message
    string message;
}

/++ Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes. +/
struct PassportElementErrorTranslationFile
{
    /// Error source, must be translation_file
    string source;
    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    string type;
    /// Base64-encoded file hash
    string file_hash;
    /// Error message
    string message;
}

/++ Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change. +/
struct PassportElementErrorTranslationFiles
{
    /// Error source, must be translation_files
    string source;
    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    string type;
    /// List of base64-encoded file hashes
    string[] file_hashes;
    /// Error message
    string message;
}

/++ Represents an issue in an unspecified place. The error is considered resolved when new data is added. +/
struct PassportElementErrorUnspecified
{
    /// Error source, must be unspecified
    string source;
    /// Type of element of the user's Telegram Passport which has the issue
    string type;
    /// Base64-encoded element hash
    string element_hash;
    /// Error message
    string message;
}
