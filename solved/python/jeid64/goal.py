"""
Python solution to the Roy problem.
Author: Julien Eid 7/25/14
"""


def m(end=None):
    if not hasattr(m, 'out'):
        m.out = 'm'
    if not end:
        m.out = ''.join([m.out, 'o'])
        return m
    else:
        return ''.join([m.out, end])


if __name__ == "__main__":
    print m('rton')
    print m()('rton')
    print m()()('rton')
