function g(tail, head) {
    head = head || 'g';
    return tail ? head + tail : function (tail) {return g(tail, head + 'o');};
}
console.log(g('al'));
console.log(g()('al'));
console.log(g()()('al'));
