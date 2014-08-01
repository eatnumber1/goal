package main

import "fmt"

type goal func(x ...interface{}) goal

func (x goal) String() string {
	var out string
	_ = x(&out)
	return out
}

func g(x ...interface{}) goal {
	out := "g"
	var push goal
	push = goal(func(y ...interface{}) goal {
		switch len(y) {
		case 0:
			out = out + "o"
		case 1:
			switch arg := y[0].(type) {
			case string:
				out = out + arg
			case *string:
				*arg = out
			default:
				panic("Unexpected argument type")
			}
		default:
			panic("Too many arguments")
		}
		return push
	})
	return push(x...)
}

func main() {
	fmt.Println(g("al"))
	fmt.Println(g()("al"))
	fmt.Println(g()()()()()()()("al"))
}