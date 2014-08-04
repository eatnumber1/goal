This mildly obfuscated and very obtuse script is probably the grossest thing
I've ever written.

## Requirements

1. The script must be made executable
2. `bash` must be installed
3. `perl` must be <= 5.10

## How it works

The script is technically a bash script. This bash script calls `perl` on
itself with the `-P` flag, which runs the C preprocessor over the source file,
as well as the `-x` flag.  The `-x` flag will only start parsing the file
provided when it encounters a shebang-like that contains the string "perl".
This is why the second shebang can look as gross and misleading as it does but
still trigger execution of Perl.

I use `Filter::sh` to use `bash` to execute `perl` as a source filter. Writing my
own filter in pure Perl is trivial, but this is grosser. The filter simply
translates '()' to '.__o()'. As we'll see, `__o()` returns a string, and we
use Perl's string concat operator to join the return value of `__o()`

Since my filter doesn't catch 'g()', I use a C preprocessor macro to do that
replacement.

`__o()` is simple, as it calls a different function, `o`, unless it was passed
an argument. If it was passed an argument ('al', in our case) it just returns
it.

`o` on the other hand, returns the return value caller, which is a stringified
version of the package that the current function was called from, in this
case, `o`.

`__g()` is a much simpler function. It grabs the symbol table from the `o`
package, grabs the second symbol (`__g()` itself), and then does a substring
into that symbol name ("g") and returns it.
