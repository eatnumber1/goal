g = (param, ret) ->
  val = ret ? 'g'
  return val + param if param?
  (param) ->
    val += 'o'
    g param, val

console.log g('al')
console.log g()('al')
console.log g()()('al')
console.log g()()()('al')
