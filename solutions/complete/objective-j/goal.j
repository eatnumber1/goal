// one limitation due to terseness is that this function mutates itself, which means it only works once.
// minor inpsiration from @jed: https://github.com/eatnumber1/goal/blob/de150828e2bb1736c858aa2b602bbfbe38a7da55/solutions/complete/javascript/soln2/goal.js

function g(l){return l?"g"+Array(-~g.o).join("o")+l:(g.o=-~g.o,g)}

console.log(g()()()("al")) // goooal