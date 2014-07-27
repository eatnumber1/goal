package main

import "fmt"

type K func(...interface{}) K

var p = "goooolang"
var F = func(v ...interface{}) K {
	if len(v) == 0 {
		p = p + "o"
		return K(o)
	}
	fmt.Printf("%sal\n", p)
	return nil
}
var o K

func g(v ...interface{}) K {
	p = "g"
	return F(v...)
}

func main() {
	o = K(F)
	g("al")
	g()("al")
	g()()()()("al");
}
