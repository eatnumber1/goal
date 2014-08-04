function g(x) {
  this.count = global.count || 0

  if (x) {
    var str = arguments.callee.name + Array(count + 1).join('o') + x

    this.count = 0

    return str
  } else {
    this.count += 1

    return g
  }
}

console.log(g('al'))         //=> gal
console.log(g()('al'))       //=> goal
console.log(g()()('al'))     //=> gooal
console.log(g()()()('al'))   //=> goooal
