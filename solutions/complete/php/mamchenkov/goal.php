<?php
$r=array('#\(\)#'=>'o','#\(\'#'=>'','#\'\)#'=>'','#;#'=>'');
$r=preg_replace(array_keys($r),array_values($r),array_pop(file(__FILE__)));
echo $r;
__halt_compiler();
g()('al');
