-- 70 characters solution for g()('lf')
-- catwell, 2014-08-04

o='';function g(x)r=x and'g'..o..x or g;o=x and''or o..'o'return r;end

-- test

assert(g('al') == 'gal')
assert(g()('al') == 'goal')
assert(g()()('al') == 'gooal')
assert(g()()()('al') == 'goooal')
assert(g()()()()('al') == 'gooooal')
