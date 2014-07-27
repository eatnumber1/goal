#!/usr/bin/env node

/*
 * This solution borrows concepts from functional programming. It relies on
 * JavaScript's function argument binding, whereby one can construct a copy
 * of a function with any number of items prepended to the argument list.
 *
 * In this case, a string with an incrementing number of 'o's is prepended to
 * the original function's argument list with each successive partial function.
 * The chain of partial functions ends when the function is invoked with two
 * arguments, at which point a string is returned instead of a function.
 */

var g = (function g(o, al) {
  return al ? 'g' + o + al : g.bind(undefined, o + 'o');
}).bind(undefined, '');

console.log(([
          g('al'), // gal
        g()('al'), // goal
      g()()('al'), // gooal
  g()()()()('al')  // gooooal
]).join(', '));
