# To run:
#
# perl goal.pl

use GoalFilter;

print g('al'), "\n";

print g()('al'), "\n";

print g()()()()()()()()('al'), "\n";

die unless (g()()()('al') eq 'goooal');
