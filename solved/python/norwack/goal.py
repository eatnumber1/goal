g=lambda e=None,c=0: "g" + "o"*c + "al" if e else lambda e=e: g(e, c+1)

if __name__ == "__main__":
    print g()("al")
    print g()()("al")
    print g()()()("al")
    print g()()()()("al")