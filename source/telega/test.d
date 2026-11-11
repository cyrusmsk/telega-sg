module telega.test;

import std.format : format;

/++
Asserts that `actual` equals `expected`.

Throws an `Exception` naming the failing file and line and printing both
values when they differ.

This helper is the library's whole test-assertion surface: the Bot API is
covered by plain `unittest` blocks run through `dub test`, so depending on a
test framework (or, previously, on `dests`) would buy nothing but
dependencies.
++/
void assertEquals(A, E)(A actual, E expected, string file = __FILE__, size_t line = __LINE__)
{
    if (actual == expected) {
        return;
    }

    // file/line are the caller's, so test runners point at the failing
    // assertion rather than at this helper
    throw new Exception(format(
            "%s(%s): assertEquals failed\n  actual:   %s\n  expected: %s",
            file, line, actual, expected), file, line);
}

unittest
{
    assertEquals(42, 42);
    assertEquals("abc", "abc");
    assertEquals(true, true);

    bool threw;

    try {
        assertEquals(1, 2);
    } catch (Exception e) {
        threw = true;
    }

    assert(threw, "assertEquals must throw when values differ");
}
