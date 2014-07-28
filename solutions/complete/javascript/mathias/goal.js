// This implementation uses ES6 `String.prototype.repeat` to shorten Jed’s
// solution (http://git.io/4H0xWw) from 66 bytes to 62 bytes.
// This function mutates itself, which means it only works once.
// To try it in browsers that don’t support `String#repeat` yet, use this
// polyfill: http://mths.be/repeat

function g(l){return l?"g"+"o".repeat(g.o)+"al":(g.o=-~g.o,g)}

console.log(g()()()("al")) // "goooal"

// Note: by using ES6 arrow functions, this can be shortened to 47 bytes:
// g=(l=>l?"g"+"o".repeat(g.o)+"al":(g.o=-~g.o,g))
