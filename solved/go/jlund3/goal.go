package main

import "fmt"

type score func(...interface{}) score

func (s score) String() (result string) {
	s(&result)
	return
}

func g(arg ...interface{}) (s score) {
	base := "g"
	s = func(arg ...interface{}) score {
		if len(arg) == 0 {
			base += "o"
		} else if result, ok := arg[0].(*string); ok {
			*result = base
		} else {
			base += fmt.Sprint(arg...)
		}
		return s
	}
	return s(arg...)
}

func main() {
	fmt.Println(g("al"))                          // gal
	fmt.Println(g()()()()()("al"))                // goooooal
	fmt.Println(g()()()("00oOO")()("al")(1, "!")) // gooo00oOOoal1!
}
