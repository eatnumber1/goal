// ECMAScript6 Draft Solution (Runs in Firefox)
// by _nderscore

// single-use: 37 bytes

g=o=_=>_?/go*$/.exec(o)+_:(o+='o')&&g

console.log( g()()()('al') );


// multiple-use: 41 bytes

g=o=_=>_?/go*$/.exec(o,o=g)+_:(o+='o')&&g

console.log( g()()('al') );
console.log( g('al') );