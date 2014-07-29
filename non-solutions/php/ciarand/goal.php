<?php

// This is the best that you can do in PHP without going into the weird
// self-modifying code because of this:
// https://wiki.php.net/rfc/uniform_variable_syntax

// I've inclued two ways of doing it, one using concat (.) and one using method
// calls (->). If the UVS thing passes the __invoke method will make this 
// solution work as expected.

class Container
{
    private $current_string = "g";

    public function ​($str = null)
    {
        if ($str !== null) {
            return $this->current_string . $str;
        }

        $this->current_string .= "o";

        return $this;
    }

    public function __invoke($str = null)
    {
        return $this->​($str);
    }
}

function g($str = null)
{
    if ($str === "al") {
        return "gal";
    }

    return new Container();
}

function gg($str = null)
{
    return "g" . $str;
}

function ​($str = null) {
    return $str ?: "o";
}
