"""
Python solution to the goal problem.
Author: Nick Depinet 7/25/14
"""


def g(end=None):
    if not hasattr(g, 'out'):
        g.out = 'g'
    if not end:
        g.out = ''.join([g.out, 'o'])
        return g
    else:
        ret = ''.join([g.out, end])
        del g.out
        return ret

if __name__ == "__main__":
    print g('al')
    print g()('al')
    print g()()('al')
    print g('al')
