function g() {
	var arg = Array.prototype.join.call(arguments, '');
	return (!arg  || arg.match(/^o*$/)) ? g.bind(this,arg+'o') : 'g'+arg;
}

console.log(g('al'))
console.log(g()('al'));
console.log(g()()('al'));
console.log(g()()()()()()()()()()()()('al'));
