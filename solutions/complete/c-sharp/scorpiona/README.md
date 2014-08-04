The secret: [string interning](http://en.wikipedia.org/wiki/String_interning).

In .NET languages, strings are immutable reference objects. This makes them a
handy candidate for interning, since the runtime can collect all strings that
have the same value and make them point to a single interned reference.

If it were possible to get a reference to the CLR's hash table with all of the
interned strings, we could abuse it by modifying strings at runtime, breaking
the guarantee of immutability. So I did! :star:

<sup><sub>(Technically the whole walking-the-interned-string-pool bit is
overkill, but it was fun, so whatchagonnado.)</sub></sup>

Once we have the **al** string, it gets pinned so the garbage collector can't
move it around on us, and we read the 2-char long (each char is 2-bytes wide)
string as a 4-byte integer. If you add `0x3000E` to the integer value of **al**,
you get... **oo**!

Write that back to the memory address for **al**, and every single instance of
**al** is a reference back to the interned string that we just overwrote. You
can see the *Press any key to continue* looks a little funky because of it. ;)

The interning trick only affects strings with the same value. The **gal** string
used later is completely unaffected. So what looks like inserting an **al** into
**gal** is really just stuffing **o**'s into the middle, which makes a goal!
