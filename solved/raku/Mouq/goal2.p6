# One-liner/golf, based on solved/python/jhgg/goal.py
sub g($a?,\c=0){$a??"g{"o"x c}$a"!!{.&g(c+1)}}

say g()('al');
say g()()()('al');
say g()()()()()()()()('al');
say g('al');
