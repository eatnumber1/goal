"""
Python solution for goal problem
Michal Podeszwa 2014-07-30
"""

output = "g"


def g(s=None):
    global output
    if s:
        return output+s
    output += "o"
    return g

print(g("al"))
