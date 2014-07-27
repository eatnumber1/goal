import functools

def g(count=0, al=None):
    if al:
        return 'g' + count * 'o' + al
    else:
        return functools.partial(g, count+1)

if __name__ == "__main__":
    print g()('al')
    print g()()('al')
    print g()()()('al')
    #print g('al')
