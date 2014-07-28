package main

import (
	"bytes"
	"fmt"
)

type oSBResult *string

type OStringBuilder func(strs ...interface{}) OStringBuilder

func NewOStringBuilder() (builder OStringBuilder) {
	var result bytes.Buffer
	return func(v ...interface{}) OStringBuilder {
		if len(v) == 0 {
			result.WriteString("o")
		}

		for i := range v {
			switch in := v[i].(type) {
			case string:
				result.WriteString(in)
			case oSBResult:
				*in = result.String()
			default:
				fmt.Fprint(&result, in)
			}
		}

		return builder
	}
}

func (builder OStringBuilder) String() (result string) {
	builder(oSBResult(&result))
	return
}

func g(v ...interface{}) OStringBuilder {
	return NewOStringBuilder()("g")(v...)
}

func main() {
	fmt.Println(g("al"))
	fmt.Println(g()("al"))

	for oCount := 2; oCount <= 10; oCount++ {
		result := g
		for i := 0; i < oCount; i++ {
			result = result()
		}
		fmt.Println(result("al"))	
	}
}
