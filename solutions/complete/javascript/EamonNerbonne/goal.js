//Eamon Nerbonne (2014-07-27)
//Solution using ES6 arrows (works in FF today). The prefix is passed as p.
//Since each invocation has its own prefix, calls are safe to interleave
// and g may be called multiple times.
var m=p=>s=>s?p+s:m(p+'o'),g=m('g')

console.log(g('al'))//gal
var tmp = g()()
console.log(g()('al'))//goal
console.log(tmp()('al'))//goooal
