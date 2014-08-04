function g(s, i){
  i = i || 'g'
  if(s == 'al')
    return i + s

  return function (s) {
    return g(s, i+'o')
  }

}


var log = console.log

log(  g("al") )
log(  g()("al")  )
log(  g()()()("al")  )
