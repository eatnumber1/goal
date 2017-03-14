def goal(t=None, a=['g']):
    if 'al' in a:
        while len(a) != 1:
            a.remove(a[-1])
    if t is None:
        a.append('o')
        return goal
    if t == 'al':
        a.append('al')
        print ''.join(a)

if __name__ == '__main__':
    goal()('al')
    goal()()('al')
    goal()()()('al')
    goal()()()()('al')
