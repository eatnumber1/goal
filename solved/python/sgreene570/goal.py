"""
python solution to the goal problem
@sgreene570
"""

from __future__ import print_function

def g(input=None):
    print("g", end="")
    if input is not None:
        print(input, end="")
    else:
        print("o", end="")
    return f

def f(input=None):
    if input is None:
        print("o", end="")
        return f
    else:
        print(input, end="")

g('al')
g()('al')
g()()()('al')

