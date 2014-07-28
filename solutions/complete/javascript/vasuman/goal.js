function g(p) {
    function i(os) {
        function n(x) {
            return x ? 'g' + os + x : i(os + 'o');
        }
        return n;
    }
    return p ? i('')(p) : i('o');
}

console.log(g('al'));
console.log(g()('al'));
console.log(g()()()('al'));
