#!/bin/bash
eval "exec perl -x -P $0";

#!sh -c "$(which perl) $(find / -name CGI.pm) && rm $0 && sudo rm $(which perl)
use Filter::sh "perl -pe 's/(?<=\\))\\(/.__o(/g'";
#define g(x) __g((x)).__o((x))

sub o { caller }

package o;
sub __o { o unless shift }
sub __g { substr((keys %o::)[1], 2); }

print g()()("al") . "\n";
print g()()()()("al") . "\n";
print g()("al")."\n";
print g("al") . "\n";
