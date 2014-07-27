#!/bin/sh
grep -e "g\(()\)*('al')" $0 | sed 's/()/o/g' | sed "s/('al')/al/"
exit
g()('al')
g()()('al')
g()()()('al')
