from __future__ import print_function


class G(str):
    def __call__(self, right='o'):
        return G(self + right)

g = G('g')


if __name__ == '__main__':
    # With the class-based solution we have the ability to store values for
    # later use because we aren't relying on global variables.
    go = g()
    print(g()('al'))
    print(g()()('al'))
    print(g()()()('al'))
    print(g('al'))
    print(go('al'))
