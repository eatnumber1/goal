package main

import "fmt"

type F func(...interface{}) F

func (f F) String() (ans string) {
	f(&ans)
	return
}

func wrap(f F) (ff F) {
	ff = func(x ...interface{}) F {
		switch len(x) {
		case 0:
			return wrap(ff)
		case 1:
			return f("o" + x[0].(string))
		}
		return nil
	}
	return
}

func g(x ...interface{}) F {
	switch len(x) {
	case 0:
		return wrap(g)
	case 1:
		return func(y ...interface{}) F {
			*y[0].(*string) = "g" + x[0].(string)
			return nil
		}
	}
	return nil
}

func main() {
	fmt.Println(g("al"))
	fmt.Println(g()("al"))
	fmt.Println(g()()()()("al"))
}
