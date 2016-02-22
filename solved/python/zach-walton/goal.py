"""
Implements g()()()('al'):

- Without returning a nested function
- Without polluting global scope (so can be run in a thread-safe manner)
- Without using a class

It accomplishes this by using the memory address of the parent's
stack frame as a unique execution context, which it stores in
__dict__ for convenience.
"""

import inspect


def g(v=None):
    f = str(inspect.currentframe().f_back)
    if not v:
        g.__dict__[f] = g.__dict__.get(f, 'G') + 'O'
    return g.__dict__.pop(f, 'G') + 'AL' if v else g

if __name__ == "__main__":
    print g('al')
    print g()('al')
    print g()()('al')
    print g()()()('al')
    print g()()()()()()()()()()()()()()()()()()()()()()('al')
