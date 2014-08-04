def g(s) {
    { prev, curr ->
        curr == "al" ? prev + curr : { next ->
            owner.call(prev + "o", next)
        }
    }("g", s)
}

println g("al")
println g()("al")
println g()()("al")
println g()()()("al")
