proc `()`(a: string): string = a & "o"

proc `()`(a, s: string): string = a & s

proc g(): string = "go"

proc g(s: string): string = 'g' & s

assert g("al") == "gal"
assert g()("al") == "goal"
assert g()()()()()()("al") == "gooooooal"
assert g()()()()()()()()()()()()()()()("al") == "goooooooooooooooal"
