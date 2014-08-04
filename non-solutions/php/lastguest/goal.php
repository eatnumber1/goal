<?php

// Limit imposed until https://wiki.php.net/rfc/uniform_variable_syntax will be accepted.
eval(preg_replace_callback('/g\(.*[\'"]\)/',function($m){
    return '"'.str_replace(array('()','"',"'",'(',')'),array('o',''),$m[0]).'"';
},file_get_contents(__FILE__,null,null,__COMPILER_HALT_OFFSET__)));__halt_compiler();


echo g('al'), PHP_EOL;
echo g()('al'), PHP_EOL;
echo g()()()('al'), PHP_EOL;
