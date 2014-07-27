# coding: UTF-8
"""
Python solution to the goal problem.
Author: Mathias Panzenböck 2014.07.27
"""

from functools import partial

def g(al=None,o=''):
    return partial(g,o=o+'o') if al is None else 'g'+o+al

if __name__ == "__main__":
    print g('al')
    print g()('al')
    print g()()('al')
