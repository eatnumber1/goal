#!/usr/bin/env tclsh
# dbohdan 2014-07-27. Public domain.

# Explanation: Parens aren't meaningful in Tcl's syntax (expect for accessing
# values stored in arrays), so "go()...()('al')" is simply treated as a single
# command name. We define a special proc called "unknown" that handles non-
# existent commands and make it intercept calls to go()('al')s.

rename unknown unknownOriginal

proc unknown args {
    set regExpr {g((?:\(\))*)\('al'\)}
    if {([llength $args] == 1) && ([regexp $regExpr $args match parens])} {
        return "g[string map {() o} $parens]al"
    } else {
        unknownOriginal {*}$args
    }
}

proc test {} {
    puts [g('al')]
    puts [g()('al')]
    puts [g()()('al')]
    puts [g()()()('al')]
    puts [g()()()()()()('al')]
}

test
