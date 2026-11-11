module telega.serialization;

import std.meta : AliasSeq, staticIndexOf;
import asdf : Asdf, SerdeException, serializeValue, serializeToAsdf, serializeToJson, parseJson;

version (unittest)
{
    import telega.test : assertEquals;
}

string serializeToJsonString(T)(T value)
{
    import std.conv : to;

    Asdf asdf = serializeToAsdf(value);
    removeNulledNodes(asdf);

    return  asdf.to!string;
}

unittest
{
    alias FewTypes = AliasSeq!(int, string);

    struct S
    {
        JsonableAlgebraicProxy!FewTypes a;
    }

    S s;
    s.a = 42;

    s.serializeToJson()
        .assertEquals(`{"a":42}`);

    s.a = "123";
    s.serializeToJson()
        .assertEquals(`{"a":"123"}`);
}

void removeNulledNodes(ref Asdf a)
{
    if (a.kind == Asdf.Kind.null_) {
        a.remove();
    } else if (a.kind == Asdf.Kind.array) {
        foreach (v; a.byElement) {
            removeNulledNodes(v);
        }
    } else if (a.kind == Asdf.Kind.object) {
        foreach (kv; a.byKeyValue) {
            removeNulledNodes(kv.value);
        }
    }
}

unittest
{
    import std.conv: to;

    string jsonWithNulls = `{
        "chat_id":"100000001",
        "text":"o",
        "reply_markup":{
            "keyboard":[
                [
                    {"text":"First Button","request_contact":null,"request_location":null},
                    {"text":"Second Button","request_contact":null,"request_location":null}
                ],
                [
                    {"text":"Ask location","request_contact":false,"request_location":true}
                ],
                [
                    {"text":"Remove Keyboard","request_contact":null,"request_location":null}
                ]
            ],
            "resize_keyboard":false,
            "selective":false,
            "one_time_keyboard":false
        }
    }`;
    const string cleanJson = `{
        "chat_id":"100000001",
        "text":"o",
        "reply_markup":{
            "keyboard":[
                [
                    {"text":"First Button"},
                    {"text":"Second Button"}
                ],
                [
                    {"text":"Ask location","request_contact":false,"request_location":true}
                ],
                [
                    {"text":"Remove Keyboard"}
                ]
            ],
            "resize_keyboard":false,
            "selective":false,
            "one_time_keyboard":false
        }
    }`;

    Asdf asdf = jsonWithNulls.parseJson();

    removeNulledNodes(asdf);

    asdf.to!string
        .assertEquals(cleanJson.parseJson.to!string);
}

/// Constant value of the discriminator field of one union member.
/// Emitted by the API generator, e.g. `@SerdeDiscriminator("type", "data")`.
struct SerdeDiscriminator
{
    string field;
    string value;
}

private bool knowsJsonKey(T)(const(char)[] key)
{
    import mir.serde : serdeFinalProxyDeserializableMembers, serdeGetKeysIn;

    static foreach (member; serdeFinalProxyDeserializableMembers!T) {
        static foreach (candidate; serdeGetKeysIn!(T, member)) {
            if (key == candidate) {
                return true;
            }
        }
    }

    return false;
}

private struct UnionBox(T)
{
    T value;
}

struct JsonableAlgebraicProxy(Typelist ...)
{
    private void* payload;
    private TypeInfo payloadType;

    this(T)(T value)
        if (staticIndexOf!(T, Typelist) >= 0)
    {
        opAssign(value);
    }

    void opAssign(T)(T value)
        if (staticIndexOf!(T, Typelist) >= 0)
    {
        auto stored = new UnionBox!T;
        stored.value = value;
        payload = cast(void*) stored;
        payloadType = typeid(T);
    }

    /// True when a union member is stored.
    bool hasValue() const
    {
        return payload !is null;
    }

    /// True when the stored member has type T.
    bool holds(T)() const
        if (staticIndexOf!(T, Typelist) >= 0)
    {
        return payload !is null && payloadType is typeid(T);
    }

    /// Returns the stored member. Precondition: holds!T.
    ref T get(T)()
        if (staticIndexOf!(T, Typelist) >= 0)
    {
        assert(holds!T, "JsonableAlgebraicProxy.get: member type mismatch");

        return (cast(UnionBox!T*) payload).value;
    }

    SerdeException deserializeFromAsdf(Asdf data)
    {
        import asdf : deserializeScopedString, deserializeValue;
        import std.traits : getUDAs, hasUDA;

        // Prefer an explicit constant discriminator emitted by the generator.
        static foreach (T; Typelist) {{
            static if (hasUDA!(T, SerdeDiscriminator)) {
                enum discriminator = getUDAs!(T, SerdeDiscriminator)[0];

                string actual;

                if (!data[discriminator.field].deserializeScopedString(actual)
                        && actual == discriminator.value) {
                    T candidate;

                    if (data.deserializeValue(candidate) is null) {
                        opAssign(candidate);
                        return null;
                    }
                }
            }
        }}

        // Structurally discriminated unions have no constant field.
        // Pick the member that explains the JSON best: fewest unknown keys.
        if (data.kind == Asdf.Kind.object) {
            size_t bestUnknown = size_t.max;
            bool found;

            static foreach (T; Typelist) {{
                T candidate;

                if (data.deserializeValue(candidate) is null) {
                    size_t unknown;

                    foreach (kv; data.byKeyValue) {
                        if (!knowsJsonKey!T(kv.key)) {
                            unknown++;
                        }
                    }

                    if (!found || unknown < bestUnknown) {
                        bestUnknown = unknown;
                        opAssign(candidate);
                        found = true;
                    }
                }
            }}

            if (found) {
                return null;
            }
        }

        return new SerdeException("JsonableAlgebraicProxy: no matching union member");
    }

    void serialize(S)(ref S serializer)
    {
        if (payload is null) {
            serializer.putValue(null);

            return;
        }

        static foreach (T; Typelist) {
            if (payloadType is typeid(T)) {
                serializer.serializeValue((cast(UnionBox!T*) payload).value);
            }
        }
    }
}

unittest
{
    struct A {
        int val;
    }

    alias AProxy = JsonableAlgebraicProxy!A;

    AProxy[] aelements;

    assert(__traits(compiles, aelements ~= cast(AProxy)A(3)));
}

/++
Heap-backed reference to a potentially recursive Telegram type.

The Telegram API contains self-referential types (Message.reply_to_message,
ChecklistTasksDone.message, ...). Such types can't be embedded by value in D.
Fields declared as $(LREF Ref) deserialize their payload onto the heap
through the asdf `deserializeFromAsdf` hook and serialize it back transparently.
+/
struct Ref(T)
    if (is(T == struct))
{
    import asdf : Asdf, SerdeException, deserializeValue;

    private Asdf _raw;
    private T* _cache;

    /// True when the referenced object was not present.
    /// Covers both "key absent" (Asdf.init, data length 0) and JSON null.
    bool isNull() const @safe pure @nogc
    {
        return _raw.data.length == 0 || _raw.data[0] == Asdf.Kind.null_;
    }

    /// Deserializes (once) and returns the referenced object.
    /// Precondition: !isNull.
    ///
    /// Eponymous template on purpose: a plain method would have its body
    /// semantically analyzed while the enclosing recursive type is still
    /// being laid out, and `new T` would fail with a forward reference.
    template get()
    {
        ref T get() return
        {
            assert(!isNull(), "telega.serialization.Ref.get: object is not present");

            if (_cache is null) {
                auto payload = new T;

                if (auto err = deserializeValue(_raw, *payload)) {
                    throw err;
                }

                _cache = payload;
            }

            return *_cache;
        }
    }

    public SerdeException deserializeFromAsdf(Asdf data)
    {
        this._raw = data;

        return null;
    }

    void serialize(S)(ref S serializer)
    {
        if (isNull()) {
            serializer.putValue(null);

            return;
        }

        static if (__traits(compiles, serializer.sink.put('\0'))) {
            // Emit the originally received JSON verbatim; rebuilding the
            // payload through serializeToAsdf would resurrect null members.
            import std.conv : to;

            foreach (char c; _raw.to!string) {
                serializer.sink.put(c);
            }
        } else {
            serializer.serializeValue(get());
        }
    }
}

unittest
{
    import asdf.serialization : deserialize, serdeOptional;
    import std.typecons : Nullable;

    struct Node
    {
        string name;
        @serdeOptional
        Nullable!(Ref!Node) child;
    }

    auto node = deserialize!Node(`{"name":"parent","child":{"name":"child","child":{"name":"grandchild"}}}`);

    node.name
        .assertEquals("parent");
    node.child.isNull
        .assertEquals(false);
    node.child.get().get().name
        .assertEquals("child");
    node.child.get().get().child.get().get().name
        .assertEquals("grandchild");


    node.serializeToJson
        .assertEquals(`{"name":"parent","child":{"name":"child","child":{"name":"grandchild"}}}`);
}

unittest
{
    import asdf.serialization : deserialize, serdeOptional;
    import std.typecons : Nullable;

    struct Node
    {
        string name;
        @serdeOptional
        Nullable!(Ref!Node) child;
    }

    // absent field stays null and is dropped from output
    auto node = deserialize!Node(`{"name":"only"}`);

    node.child.isNull
        .assertEquals(true);
    node.serializeToJson
        .assertEquals(`{"name":"only","child":null}`);
}
