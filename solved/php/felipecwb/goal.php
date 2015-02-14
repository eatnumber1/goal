<?php
/*
 * Now with uniform variable syntax (https://wiki.php.net/rfc/uniform_variable_syntax)
 * We can do this nice things like in others languages.
 *
 * Tested in: 
 * |$ php -v
 * |PHP 7.0.0-dev (cli) (built: Feb 11 2015 02:07:44) 
 * |Copyright (c) 1997-2015 The PHP Group
 * |Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies
 * |    with Zend OPcache v7.0.4-dev, Copyright (c) 1999-2015, by Zend Technologies
 */

function g($a = null, $s = 'g') {
    $s .= $a ?: 'o';

    return $a ? $s : function ($a = null) use ($s){
        return g($a, $s);
    };
}

print g('al') . PHP_EOL;
print g()('al') . PHP_EOL;
print g()()()('al') . PHP_EOL;
print g()()()()()('al') . PHP_EOL;
print g()()()()()()('al') . PHP_EOL;
print g()()()()()()()('al') . PHP_EOL;
print g()()()()()()()()('al') . PHP_EOL;

