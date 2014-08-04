function g(a){function o(a){return a?this+a:o.bind(this+'o')}return o.call('g',a)}
console.log(g()('al'));

/*
Ungolfified version: I'm making use of a string being bound to the 'this' context.

    function g(al) {
      function o(al) {
        if (al) {
          return this + al;
        } else {
          return o.bind(this + 'o');
        }
      }
      return o.call('g', al);
    }
	
*/