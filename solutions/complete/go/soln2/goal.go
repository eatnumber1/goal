// Author: Brad Fitzpatrick

// The goal command solves the g()('al') challenge as documented
// at https://github.com/eatnumber1/goal.
//
// As opposed to solution #1, this solution doesn't rely on global
// variables, and thus is safe for concurrent use by multiple
// goroutines.
package main

import (
	"fmt"
	"strings"
)

type F func(...interface{}) F

func (f F) String() string {
	var n int
	var suffix string
	f(&n, &suffix)
	return "g" + strings.Repeat("o", n) + suffix
}

func g(oal ...interface{}) F {
	term := func(n int, suffix string) F {
		return func(out ...interface{}) F {
			*(out[0].(*int)) = n
			*(out[1].(*string)) = suffix
			return nil
		}
	}
	var f func(int, ...interface{}) F
	f = func(n int, v ...interface{}) F {
		switch len(v) {
		case 0:
			return func(v ...interface{}) F {
				switch len(v) {
				case 0:
					return f(n + 1)
				case 1:
					return term(n+1, v[0].(string))
				}
				panic("invalid")
			}
		case 1:
			return term(n, v[0].(string))
		}
		panic("invalid")
	}
	return f(0, oal...)
}

func main() {
	fmt.Println(g("al"))
	fmt.Println(g()("al"))
	fmt.Println(g()()("al"))
	fmt.Println(g()()()("al!!"))
	fmt.Println(g()()()()()()()()()()()()()()()("allll!!!"))
}
