\ Complete Forth goal solution by Rob Glossop

: add here c! 1 chars allot ;
: g [char] g parse 2drop ;
: par [char] ) parse swap drop 1 = 0= ;
: goal ( -- addr l ) g here [char] g add
    begin par dup if [char] a add [char] l add else [char] o add then
    until here over - ;

goal g()('al') type cr
bye
