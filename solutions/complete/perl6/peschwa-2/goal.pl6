=pod
I am calling the this solution incomplete, because I
have not been able to make it work without the sigil.
It works by assign the empty string to a variable and mixing
in a role that implements the postfix operator () and returns
the string 'g' with a different role mixed in, which implements
the same operator differently, to create the correct output.
=cut

role o-role {
    multi method postcircumfix:<( )>($o) {
        return (self ~ 'o') does o-role;
    }
    multi method postcircumfix:<( )>($o where $o eq 'al') {
        return (self ~ "al\n");
    }
}

role g-role {
    method postcircumfix:<( )>($g = '') {
        return ('g' does o-role)($g);
    }
}

my $g = '' does g-role;
sub g { return $g(@_); }

print g('al');
print g()()()('al');
