//Eamon Nerbonne (2014-07-27)
//The prefix is passed via the implicit this parameter.
//Since each invocation has its own prefix, calls are safe to interleave
//and g may be called multiple times. This is probably the shortest possible
//non-ES6 solution that's safe to interleave.

//valid in strict and non-strict mode: (65 or 61 chars)
var g=(function k(s){return s?this+s:k.bind(this+'o')}).bind('g')

//valid only in strict mode: (55 chars)
function g(s,p){return p=this||'g',s?p+s:g.bind(p+'o')}


//in your browser console, you can test strict mode as follows:
//var g = (function(){"use strict"; return function g(s,p){p=this||'g'return s?p+s:g.bind(p+'o')}})()


console.log(g('al'))
console.log(g()()()('al'))

//but also:
var tmp = g()()
console.log(g()('al')) //goal
console.log(tmp('al'))//gooal
