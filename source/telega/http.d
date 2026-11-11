module telega.http;

import std.exception;

interface HttpClient
{
    string sendGetRequest(string url);

    string sendPostRequestJson(string url, string bodyJson);

    /// Posts a pre-encoded body (e.g. multipart/form-data for file uploads)
    /// with an explicit Content-Type header.
    string sendPostRequestRaw(string url, string contentType, in ubyte[] body);
}
