#!/usr/bin/env perl

use strict;
use warnings;
use 5.12.0;

BEGIN {
    use Filter::Simple sub { s{\)\(}{)->(}g };
    __PACKAGE__->import;
}

say g('al');
say g()('al');
say g()()('al');
say g()()()('al');

sub g {
    state $depth = 0;
    if (@_) {
        (my $d, $depth) = ($depth, 0);
        return join '', 'g', (('o') x $d), @_;
    }
    $depth++;
    return \&g;
}
