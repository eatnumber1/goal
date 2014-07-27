def g(*a, o=[]):
    if not a:
        o.append('o')
        return g
    else:
        return 'g' + ''.join(o) + 'al'

print( g('al'))
print( g()('al'))
print( g()()()()()()()()()()()('al'))
