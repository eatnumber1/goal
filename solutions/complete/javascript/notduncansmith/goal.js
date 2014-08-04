function g () {
  g.count = 0;
  return o;
}

function o () {
  if (arguments.length === 0) {
    g.count += 1;
    return arguments.callee;
  }
  else {
    var str = '';
    
    for (var i = g.count; i >= 0; i--) {
      str += 'o';
    };
    
    str = 'g' + str + arguments[0];
    g.count = 0;
    return str;
  }
};

console.log(g()('al')) // goal
console.log(g()()()('al')) // goooal
