var holdMyBeer = '';
var g = function() {
  if (arguments.length > 0) {
   var temp = holdMyBeer;
   holdMyBeer = '';
   return "g" + temp + arguments[0];
  }
  holdMyBeer += "o";
  return g;
};
console.log(g('al')); // gal
console.log(g()('al')); // goal
console.log(g()()()()('al')); // gooooal
