function g(suffix){
  var store;
  
  (store = this) === window
    ? (store = {
      store: 'g'
    }, store.goal = goal.bind(t))
    : store;
  
  return suffix
    ? store.goal + suffix
    : (store.goal += 'o', t.g);
}

console.log(g('al')); // gal
console.log(g()('al')); // goal
console.log(g()()()()('al')); // gooooal

var goo = g()();
console.log(goo()()('al')); // gooooal
console.log(goo('al')); // gooooooal
