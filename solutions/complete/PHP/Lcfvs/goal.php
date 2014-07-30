<?php

    function g() {
        $goal = 'g';
        
        $g = function ($suffix = null) use (&$g, &$goal) {
            if ($suffix) {
                return $goal . $suffix;
            }
            
            $goal .= 'o';
            
            return $g;
        };
        
        return $g();
    }

    $g = g();
    $g = $g();
    $g = $g();
    echo $g('al');
