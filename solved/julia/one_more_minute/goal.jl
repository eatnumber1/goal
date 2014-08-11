g(s) = g("g", s)
g()  = g(g, "o")
g(s, t) = s*t
g(f::Function, s) = (h() = g(f(),s);
                     h(t) = g(f(s),t))

g()("al!") #-> "goal!"
