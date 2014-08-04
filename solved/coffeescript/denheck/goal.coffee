repeat = (character, num) -> Array(num + 1).join(character)

g = (al) ->
  if (al)
    times = this.count ? 0
    this.count = 0
    "g" + repeat('o', times) + "al"
  else
    this.count = if this.count? then this.count + 1 else 0
    g

console.log(g('al'))
console.log(g()('al'))
console.log(g()()('al'))
console.log(g()()()('al'))
