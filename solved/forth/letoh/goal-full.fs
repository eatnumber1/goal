\ Copyright (C) 2014 Meng-Cheng Cheng (letoh)
\ 
\ Description:
\     A simple, and well-factored solution of the g()('al') challenge
\     (https://github.com/eatnumber1/goal)
\ 
\ Usage: gforth goal-full.fs
\ 

vocabulary goal
goal definitions

: g     here [char] g c, ;
: )     [char] o c, ;
: 'al') [char] a c, [char] l c, here over - ;
: kick-off begin [char] ( parse dup 0= if 2drop
	refill 0= if exit then else evaluate then 0 until ;

forth definitions goal
kick-off

g('al') type cr
g()('al') type cr
g()()('al') type cr
g()()()('al') type cr
g()()()()('al') type cr
g()()()()()('al') type cr
g()()()()()()('al') type cr

bye
