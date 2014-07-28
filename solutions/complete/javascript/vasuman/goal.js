function i(pre) {
    return function (x) {
        return x ? pre + x : i(pre + 'o');
    }
}
var g = i('g');

console.log(g('al'));
console.log(g()('al'));
console.log(g()()()('al'));
