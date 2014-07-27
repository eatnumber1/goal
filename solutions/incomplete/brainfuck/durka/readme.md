A complete solution in [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) is not possible as that language has never heard of functions, parameters, return values, rvales, or strings. So I was forced to resort to using stdin and stdout.

Brainfuck programs are generally tied to a particular interpreter because the language doesn't specify what to do at EOF, integer overflow, etc. This program was developed with [FabianM's interpreter](https://github.com/FabianM/brainfuck).

It takes the input on stdin in the form "g()()()(al)" (note the lack of quotation marks). The input must be null-terminated. Output is produced on stdout. If you look closely (with a hex editor), you'll notice it prints some invisible chars in between the output; they happen to have ASCII code 1. These two limitations (no quotation marks, and unprintable characters) could presumably be fixed, but I ran out of time.

Here are some examples demonstrating full functionality:

    $ echo -e "g(al)\0" | brainfuck goal.bf
    gal
    $ "g()(al)\0" | brainfuck goal.bf
    goal
    $ echo -e "g()()()()()()()()(al)\0" | brainfuck goal.bf
    gooooooooal
    $ echo -e "g()()()()()()()()(brainfuck)\0" | brainfuck goal.bf
    goooooooobrainfuck

