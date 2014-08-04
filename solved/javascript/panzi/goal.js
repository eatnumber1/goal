// Mathias Panzenböck 2014.07.27

function g(al,o){return al?'g'+(o||'')+al:function(al){return g(al,(o||'')+'o');};}

console.log(g('al'))
console.log(g()('al'))
console.log(g()()('al'))
