function g(suffix){
  var store;
  
  (store = this) === window
    ? (store = {
      goal: 'g'
    }, store.g = g.bind(store))
    : store;
  
  return suffix
    ? store.goal + suffix
    : (store.goal += 'o', store.g);
}

console.log(g('al')); // gal
console.log(g()('al')); // goal
console.log(g()()()()('al')); // gooooal

var goo = g()();
console.log(goo()()('al')); // gooooal
console.log(goo('al')); // gooooal
