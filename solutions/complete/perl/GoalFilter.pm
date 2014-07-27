package GoalFilter;

use Filter::Simple;

FILTER {
	s[g((?:\(\))*)\('al'\)] {
		($o = $1) =~ s[\(\)]{o}g;
		"'g${o}al'";
	}ge
};

1
