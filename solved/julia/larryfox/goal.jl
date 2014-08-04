g(n::Int, ::()) = (x...) -> g(n+1, x)
g(n::Int, s::(String,)) = "g" * ("o"^n) * s[1]
g(s::String) = g(0, (s,))
g() = g(0, ())

assert(g()("al") == "goal")
assert(g("al") == "gal")
assert(g()()()()()()()()("al") == "gooooooooal")
