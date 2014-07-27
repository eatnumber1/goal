g = (str) ->
  _g = (str) ->
    return [ goal, str ].join("")  if str
    goal += "o"
    _g
  goal = "g"
  new _g(str)
  
g() 'al'
g()() 'al'
g()()() 'al'
