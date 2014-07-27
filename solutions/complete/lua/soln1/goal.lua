-- Lua solution to the goal problem.
-- Author: Preston Guillory 7/26/14

function g(al, o)
  if al then
    return 'g' .. (o or '') .. al
  else
    return function(al)
      return g(al, (o or '') .. 'o')
    end
  end
end

assert(g('al') == 'gal')
assert(g()('al') == 'goal')
assert(g()()('al') == 'gooal')
assert(g()()()('al') == 'goooal')
assert(g()()()()('al') == 'gooooal')
