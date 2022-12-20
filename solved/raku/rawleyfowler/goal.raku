use v6;

sub g($str = "") {
  my $goal = "g";

  sub aux($str = "") {
    return $goal ~ $str if $str.chars > 0;

    $goal ~= "o";
    return &aux;
  }

  return aux($str);
}

say g()()()('al'); # goooal
