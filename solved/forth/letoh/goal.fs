\ Copyright (C) 2014 Meng-Cheng Cheng (letoh)
\ 
\ Description:
\     A compact, and well-factored solution of the g()('al') challenge
\     (https://github.com/eatnumber1/goal)
\ 
\ Usage: gforth goal.fs 2>/dev/null
\ 
: g here [char] g c, ;
: ) [char] o c, ;
: 'al') [char] a c, [char] l c, here over - ;
:noname begin [char] ( parse evaluate 0 until ;
execute g()('al') type cr bye
