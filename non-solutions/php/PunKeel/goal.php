<?php

$o = '';
$g = 'g';

function g($v = ''){
        global $o;
        if($v==''){
                $o .= 'o';
                return 'g';
        }
        $_g = 'g' . $o . $v;
        $o = '';
        return $_g;
}

assert($g('al') == 'gal');
assert(${ $g() }('al') == 'goal');
assert(${ ${ $g() }() }('al') == 'gooal');
assert(${ ${ ${ $g() }() }() }('al') == 'goooal');
