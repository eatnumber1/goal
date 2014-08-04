"""
Python solution for goal problem
Michal Podeszwa 2014-07-30
"""

output = "g"


def g(s=None):
    global output
    if s:
        temp = output
        output = "g"
        return temp+s
    output += "o"
    return g

print(g()()()()("al"))
print(g()()()("al"))
print(g()()("al"))
print(g()("al"))
print(g("al"))
