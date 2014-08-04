// one limitation due to terseness is that this function mutates itself, which means it only works once.

function g(l){return l?"g"+Array(-~g.o).join("o")+l:(g.o=-~g.o,g)}

console.log(g()()()("al")) // goooal
