g = { s -> 
    if (s) "g$s" 
    else { str = "o"; h = {x -> if (x) "g${str}$x" else { str += "o"; h }}}
}

[g('al'), g()('al'), g()()('al'), g()()()('al')].each {println it}
