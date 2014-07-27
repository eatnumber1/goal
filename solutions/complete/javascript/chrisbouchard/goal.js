var g = (function _g(x) {
    return function (y) {
        return y ? (x + y) : _g(x + 'o');
    };
})('g');

g('al');
g()('al');
g()()('al');

