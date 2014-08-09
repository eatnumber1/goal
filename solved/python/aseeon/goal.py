class g(object):
    output = 'g'

    def __new__(cls, string='o', inst=None):
        inst = inst or super(g, cls).__new__(cls)
        inst.output += string
        return inst if string == 'o' else inst.output

    def __call__(self, string='o'):
        return self.__new__(self.__class__, string, self)


if __name__ == '__main__':
    print(g('al'))
    print(g()('al'))
    print(g()()('al'))
    print(g()()()('al'))
    print(g()()()()('al'))

