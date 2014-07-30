/**
 * Recusively invoke g to get the result.
 * It is multi-entrant, since the temp variable `g.q` is set to null in the end.
 */

function g(al) {
  g.q = g.q || 'g';
  return al ? (g.r=g.q, g.q=null, g.r+=al) : (g.q+='o', g);
}

console.log( g('al') );
console.log( g()('al') );
console.log( g()()('al') );
