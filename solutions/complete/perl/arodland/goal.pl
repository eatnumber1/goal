#!perl

use 5.012;

sub g {
  my $sub;
  $sub = sub {
    state $prefix = "g";
    if (@_) {
      $prefix . $_[0];
    } else {
      $prefix .= "o";
      return $sub;
    }
  };
  return $sub->(@_);
}

print g('al'), "\n";
print g()->('al'), "\n";
print g()->()->()->()->('al'), "\n";

