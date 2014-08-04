#!/usr/bin/env perl

BEGIN {
    open(F, $0);
    /\b(?:g(?{ print "g" }))(?:\(\)(?{ print "o"; }))+(?:\(\"al\"\)(?{ print "al\n" }))\b/ foreach <F>;
    exit;
}

g()()("al");
g()()()()("al");
