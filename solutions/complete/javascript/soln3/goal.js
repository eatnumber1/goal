// like soln2 but resets the state at the end so it can be called multiple times

function g(l){return l?"g"+Array([-~g.o,g.o=0][0]).join("o")+l:(g.o=-~g.o,g)}

console.log(g()()()("al"), g()()()("al")) // goooal, goooal
