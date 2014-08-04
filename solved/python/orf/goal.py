#!/usr/bin/python3
# One liner that inspects the callstack to print the correct value

import inspect
import re

g = lambda s=None: re.sub('\(?\'\)?', '', re.search('g(\(\))*', inspect.stack()[1][4][0].strip()).group(0).replace('()', 'o')) + s if s else g

if __name__ == '__main__':
    print(g('al'))
    print(g()('al'))
    print(g()()('al'))