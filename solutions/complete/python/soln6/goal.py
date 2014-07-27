"""
One line solution by jhgg
"""

g=lambda a=0,c=0:a and'g'+c*'o'+a or(lambda a=0,c=c+1:g(a,c))

if __name__ == "__main__":
    print g('al')
    print g()('al')
    print g()()('al')
