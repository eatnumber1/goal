#!/usr/bin/env python
import sys, math, StringIO

def gees( stream=sys.stdin ):
	ridiculous = lambda (h,t),c: {'g':lambda x:(ord(c),(h,t))}.get(c, lambda x: (h*ord(c),t))("?!")
	serious = lambda (l,f),(h,t): (f(([h]+l,f),t) if t else l)

	entanglement = reduce(ridiculous, iter(stream.read()), (1,None))
	big_nums = serious(([],serious), entanglement)
	first_base = ord('(') * ord(')')
	floaters = [math.log(n, first_base) for n in big_nums]
	roundies = map(round, floaters)
	prescribed_dosages = [max(0, int(m)-4) for m in roundies]
	happiness = ['g%sal' % ('o'*o) for o in prescribed_dosages]
	return happiness


demo = StringIO.StringIO("""
g('al')
g()('al')
g()()()()()()('al')
""")
[sys.stdout.write(g+'\n') for g in gees(demo)]
