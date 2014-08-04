
def g(al=None, count=0):
	if al:
		return 'g' + count * 'o' + al
	else:
		return lambda al=None: g(al, count+1)

if __name__ == "__main__":
	print g('al')
	print g()('al')
	print g()()('al')
	print g()()()('al')
