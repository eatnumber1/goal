// Author: Andrew Bursavich (abursavich)
// Inspired By: Brad Fitzpatrick (bradfitz), Burke Libbey (burke)

// The goal command solves the g()('al') challenge as documented
// at https://github.com/eatnumber1/goal.
//
// As opposed to solution by burke, this solution doesn't rely on
// global variables, and thus is safe for concurrent use by multiple
// goroutines.
//
// As opposed to solution by bradfitz, this solution doesn't terminate
// after the first call with arguments, it supports multiple arguments,
// and it supports non-string arguments.
package main

import (
	"fmt"
	"strings"
)

type F func(...interface{}) F

func (f F) String() (s string) {
	f(&s)
	return
}

func f(s string, v ...interface{}) F {
	if len(v) == 0 {
		return f(s, "o")
	}
	a := make([]string, len(v)+1)
	a[0] = s
	for i := range v {
		a[i+1] = fmt.Sprint(v[i])
	}
	s = strings.Join(a, "")
	return func(v ...interface{}) F {
		if len(v) == 1 {
			if t, ok := v[0].(*string); ok {
				*t = s
				return nil
			}
		}
		return f(s, v...)
	}
}

func g(oal ...interface{}) F {
	return f("g", oal...)
}

func main() {
	g0, ga := g(), g("a")
	goo, golang := g0(), g0("lang")
	fmt.Println(g0)
	fmt.Println(golang, golang("-", "f*cking", "-", "nuts"))
	fmt.Println(goo, goo("d"), goo("die"), goo("gle"), goo("ber"))
	fmt.Println(goo("-", goo("-", ga("-", ga("!"))))) // o_O
	fmt.Println(g("al"), g()("al"), g()()("al"), g()()()()()()("al!!!"))
	fmt.Println(g()()()()()()()()()()()()()()()("aaaaaaal!!!"))
	fmt.Println(g()()()()()()("OOOOOOOOOOOOO")()()()()()()()()()()("aaaaaaaaaaaaaa")("l")("!!!"))
	fmt.Println(g(0, 41, "!"), g(4.1i, "e"))
}
