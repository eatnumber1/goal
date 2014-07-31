//Eamon Nerbonne (2014-07-27)
//The prefix is passed via the implicit this parameter.
//Since each invocation has its own prefix, calls are safe to interleave
//and g may be called multiple times. This is probably the shortest possible
//non-ES6 solution that's safe to interleave.
var g=(function k(s){return s?this+s:k.bind(this+'o')}).bind('g')

console.log(g('al'))
console.log(g()()()('al'))

//but also:
var tmp = g()()
console.log(g()('al')) //goal
console.log(tmp('al'))//gooal
