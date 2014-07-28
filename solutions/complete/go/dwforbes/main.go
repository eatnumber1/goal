package main

import (
	"fmt"
)

type score func(...string) score

func (s score) String() (res string) {
	defer func() {
		if r := recover(); r != nil {
			res = fmt.Sprint(r)
		}
	}()
	s("", "")
	res = ""
	return
}

func g(arg ...string) score {
	base := "go"
	var f score
	f = func(arg ...string) score {
		switch (len(arg)) {
		case 0:
			base += "o"
		case 1:
			base += arg[0]
		default:		
			panic(base)
		}
		return f
	}
	f(arg...)
	return f
}

func main() {
	fmt.Println(g("al"))
	fmt.Println(g()("al"))
	fmt.Println(g()()("al"))
	fmt.Println(g()()()("al"))
	fmt.Println(g()()()()("al"))
}
