package main

import (
	"fmt"
)

var (
	oooo  = ""
	final = false
)

type F func(...interface{}) F

func (f F) String() string {
	return "g" + oooo + "al"
}

func g(a ...interface{}) F {
	if final {
		final = false
		oooo = ""
	}
	if a != nil {
		final = true
		return nil
	}
	oooo += "o"
	return g
}

func main() {
	fmt.Println(g()()("al"))
	fmt.Println(g("al"))
	fmt.Println(g()()()()()()()()()()()()()()()("al"))
}
