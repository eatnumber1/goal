function g(x) {
  global.count = global.count || 0

  if (x) {
    var str = arguments.callee.name + Array(count + 1).join('o') + x

    global.count = 0

    return str
  } else {
    global.count += 1

    return g
  }
}

console.log(g('al'))         //=> gal
console.log(g()('al'))       //=> goal
console.log(g()()('al'))     //=> gooal
console.log(g()()()('al'))   //=> goooal
