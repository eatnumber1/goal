\ Forth goal solution by Rob Glossop

: g [char] g parse 2drop ;
: par [char] ) parse swap drop 1 = 0= ;
: goal g ." g" begin par dup if ." al" else ." o" then until ;

goal g()('al') cr
bye
