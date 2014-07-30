//Eamon Nerbonne (2014-07-27)
//The prefix is passed via the implicit this parameter.
//Since each invocation has its own prefix, calls are safe to interleave
//and g may be called multiple times. This is probably the shortest possible
//non-ES6 solution that's safe to interleave.
var g=(function k(s){return s?this+s:k.bind(this+'o')}).bind('g')

consolse.log(g('al'))
consolse.log(g()()()('al'))

//but also:
var tmp = g()()
consolse.log(g()('al')) //goal
consolse.log(tmp('al'))//gooal