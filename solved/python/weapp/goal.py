"""
One line solution by weapp
"""

g=lambda a=0,o='':a and 'g'+o+a or(lambda a=0:g(a,o+'o'))

if __name__ == "__main__":
    print g('al')
    print g()('al')
    print g()()('al')
