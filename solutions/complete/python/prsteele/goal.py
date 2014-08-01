"""The goal is to make the code `g()('al')` return 'goal', the code
`g()()('al')` return 'gooal', etc. Additionally, `g('al')` must return 'gal'.

This code uses Python 3.

Author: Patrick Steele
E-mail: steele.pat@gmail.com
Date: 27 July 2014

This document has been placed in the public domain.

"""

def g(*args, count=0):
    if len(args) == 0:
        return lambda *x: g(*x, count=(count + 1))
    elif len(args) == 1 and args[0] == 'al':
        return 'g' + 'o' * count + 'al'
    else:
        raise ValueError('Unknown arguments: {}'.format(args))

if __name__ == '__main__':
    print(g('al'))
    print(g()('al'))
    print(g()()('al'))
    print(g()()()('al'))
