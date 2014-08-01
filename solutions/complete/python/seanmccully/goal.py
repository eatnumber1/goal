
def g(*a, o=[]):
    if not a:
        o.append('o')
        return g
    else:
        rtr_str = 'g' + ''.join(o) + 'al'
        o.clear()
        return rtr_str 

print( g('al'))
print( g()('al'))
print( g()()()()()()()()()()()('al'))
print( g('al'))
