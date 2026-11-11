module telega.drivers.requests;

version(TelegaRequestsDriver) enum HaveRequestsDriver = true;
else enum HaveRequestsDriver = false;

import telega.http;
import core.time;

static if(HaveRequestsDriver)
{
    import requests;
    import socks.socks5;
    import requests.streams;
}
else
{
    // Dummy NetworkStream for interface conformance when driver is disabled
    interface NetworkStream
    {
        @property bool isConnected() const;
        @property bool isOpen() const;
        void close() @trusted;
        NetworkStream connect(string host, ushort port, Duration timeout = 10.seconds);
        ptrdiff_t send(const(void)[] buff);
        ptrdiff_t receive(void[] buff);
        NetworkStream accept();
        @property void reuseAddr(bool);
        void bind(string);
        void bind(string);  // simplified second bind overload
        void listen(int);
        @property void readTimeout(Duration timeout);
    }
}

class RequestsHttpClient: HttpClient
{
    protected:
        string proxyHost;
        ushort proxyPort;

    private:
        static if(HaveRequestsDriver)
            Request rq;

    public:
        this()
        {
            static if(HaveRequestsDriver)
            {
                rq.socketFactory = &createNetworkStream;
                rq.timeout = 0.seconds;
            }
        }

        string sendGetRequest(string url)
        {
            static if(HaveRequestsDriver)
            {
                Response rs = rq.get(url);
                return rs.responseBody.toString();
            }
            else
                assert(false, "Requests driver not enabled");
        }

        string sendPostRequestJson(string url, string bodyJson)
        {
            static if(HaveRequestsDriver)
            {
                rq.addHeaders(["Content-Type": "application/json"]);
                Response rs = rq.post(url, bodyJson);
                return rs.responseBody.toString();
            }
            else
                assert(false, "Requests driver not enabled");
        }

        string sendPostRequestRaw(string url, string contentType, in ubyte[] body)
        {
            static if(HaveRequestsDriver)
            {
                rq.addHeaders(["Content-Type": contentType]);
                Response rs = rq.post(url, cast(ubyte[]) body);
                return rs.responseBody.toString();
            }
            else
                assert(false, "Requests driver not enabled");
        }

        void setProxy(string host, ushort port)
        {
            proxyHost = host;
            proxyPort = port;
        }

    private:
        NetworkStream createNetworkStream(string scheme, string host, ushort port)
        {
            static if(HaveRequestsDriver)
            {
                NetworkStream stream = new TCPSocketStream();
                stream.readTimeout = 0.seconds;

                if (proxyHost !is null) {
                    proxyConnect(stream, host, port);
                } else {
                    stream.connect(host, port);
                }

                final switch (scheme) {
                    case "http":
                        break;

                    case "https":
                        auto sslOptions = SSLOptions();
                        sslOptions.setVerifyPeer(false);
                        stream = new SSLSocketStream(stream, sslOptions);
                        stream.readTimeout = 0.seconds;
                        break;
                }
                return stream;
            }
            else
                assert(false, "Requests driver not enabled");
        }

        void proxyConnect(NetworkStream stream, string host, ushort port)
        {
            static if(HaveRequestsDriver)
            {
                const Socks5Options options = {
                    host: proxyHost,
                    port: proxyPort,
                    resolveHost: true
                };

                SocksTCPConnector connector = (in string host, in ushort port)
                {
                    stream.connect(host, port);
                    return true;
                };
                SocksDataReader reader = (ubyte[] data) { stream.receive(data); };
                SocksDataWriter writer = (in ubyte[] data) { stream.send(data); };
                Socks5 proxy = Socks5(reader, writer, connector);
                proxy.connect(options, host, port);
            }
            else
                assert(false, "Requests driver not enabled");
        }
}