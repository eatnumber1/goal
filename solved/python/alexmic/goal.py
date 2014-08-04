class Goal(object):

    def __init__(self, count):
        self.count = count

    def __call__(self, *args):
        if not args:
            return Goal(self.count + 1)
        return 'g%sal' % ('o' * self.count)


g = Goal(0)


if __name__ == '__main__':
    print g('al')
    print g()('al')
    print g()()('al')
    print g()()()('al')
    print g()()()()()()()()()()()()()()()()()()()()()()('al')