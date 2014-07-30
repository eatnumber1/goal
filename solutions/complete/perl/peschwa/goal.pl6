=pod
This solution works exactly as per the rules.
Conceptionally it's rather simple, the result is created
by appending to a dynamic variable, which is looked up
through the caller. This is functionally similar to a
global variable here. Resetting the dynamic variable
happens with a boolean mixin, which makes it get
reinitialized on repeated calls.

This requires perl6
=cut

my $*GOAL;

sub g($in = 'o') {
    $*GOAL = $*GOAL ?? $*GOAL ~ $in !! 'g' ~ $in;
    if $in eq 'al' {
        $*GOAL ~= "\n";
        return $*GOAL = $*GOAL but False
    }
    &?ROUTINE
}

print g('al');
print g()('al');
print g()()()()('al');
