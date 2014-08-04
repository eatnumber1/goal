exports.name = "Inmatarian";
exports.type = 5.1; // Uses bind.
exports.src = "function g(a){function o(a){return a?this+a:o.bind(this+'o')}return o.call('g',a)}";