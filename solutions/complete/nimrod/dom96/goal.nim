proc `()`(a: string): string = a & "o"

proc `()`(a, s: string): string = a & s

let g = "g"

assert g("al") == "gal"
assert g()("al") == "goal"
assert g()()()()()()("al") == "gooooooal"
assert g()()()()()()()()()()()()()()()("al") == "goooooooooooooooal"
