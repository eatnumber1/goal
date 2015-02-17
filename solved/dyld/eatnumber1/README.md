This solution leverages the [dynamic linker][dyld] in order to override the
`write` system call. Then, when an application calls `write`, this program
enters the bytes to be written into a [state machine][fsm] written in [Ragel]
which rewrites the buffer in-place in order to change instances of `g()('al')`
to `goal`. It then calls the real `write` system call with the modified buffer.

Ragel is able to generate a graph of the state machine it generates. The state
machine used here is available [here][dyld-fsm].

This should work on both Linux and OS X. Just `make`, then you can run any
application prefixed with the `./goal` wrapper script. E.x.
`./goal cat somefile`

[dyld]: http://en.wikipedia.org/wiki/Dynamic_linking
[fsm]: https://en.wikipedia.org/wiki/Finite-state_machine
[ragel]: http://www.colm.net/open-source/ragel/
[dyld-fsm]: src/goal.svg
