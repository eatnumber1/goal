Goal := Object clone
Goal value := "g"
Goal setSlot("", method(arg,
  if (arg == nil,
    value = value .. "o"; self,
    value .. arg)
))

g := method(arg,
  Goal clone()(arg)
)

writeln(g("al"))
writeln(g()("al"))
writeln(g()()("al"))
writeln(g()()()("al"))
