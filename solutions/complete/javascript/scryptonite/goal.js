
//                                                                                                                                             Uses bind
//  <https://github.com/eatnumber1/goal> JavaScript g()()("al") code golfing.                                                     1   4   1024 | Uses join
//  Some of the entries have had some excess characters trimmed from their original.                                            0 | 3 | 26|    | | Uses call
//                                                                                                                              | | | | | |    | | |
//function g(a){function o(a){return a?this+a:o.bind(this+'o')}return o.call('g',a)}    // inmatarian           (82 characters) X X X X X X    X - X
//function g(l){return l?"g"+Array([-~g.o,g.o=0][0]).join("o")+l:(g.o=-~g.o,g)}         // devongovett          (77 characters) X X X - X X    - X -
//function g(a,o){return a?'g'+(o||'')+a:function(a){return g(a,(o||'')+'o')}}          // panzi                (76 characters) X X X X X X    - - -
//g=(function g(o,a){return a?'g'+o+a:g.bind(void 0,o+'o')}).bind(void 0,'')            // mrmilosz             (74 characters) X X X X X X    X - -
//g=(function _(x){return function(y){return y?(x+y):_(x+'o')}})('g')                   // chrisbouchard        (67 characters) X X X X X X    - - -
//function g(l){return l?"g"+Array(-~g.o).join("o")+l:(g.o=-~g.o,g)}                    // jed                  (66 characters) X X - - - -    - X -
//function i(p){return function(x){return x?p+x:i(p+'o')}}g=i('g')                      // vasuman              (64 characters) X X X X X X    - - -
//g=(function k(s){return s?this+s:k.bind(this+'o')}).bind('g')                         // soln7                (61 characters) X X X X X X    X - -
  g=function(l){t=this;t=t.g?"g":t;return l?t+l:g.bind(t+"o")}                          // scryptonite          (60 characters) X X X X X X    X - -
//s='g',g=function(x){return x?[s+x,s='g'][0]:(s+='o',g)}                               // zemnmez              (55 characters) X X X - X X    - - -

/**
    g = function(l){
        t = this;
        t = t.g ? "g" : t;
        return l ? t + l : g.bind(t + "o")
    }
**/

// 0 Os
var gal = g("al"); // "gal"
// 1 Os
var goal = g()("al"); // "goal"
var gooo = g()()();
// 3 Os
var goooal = gooo("al"); // "goooal" (jed: 4 Os)
// 4 Os
var gooooal = gooo()("al"); // "gooooal" (zemnmez, devongovett: 1 Os; jed: 5 Os)

// 26 Os
var gooooooooooooooooooooooooooal = g()()()()()()()()()()()()()()()()()()()()()()()()()()("al"); // "gooooooooooooooooooooooooooal" (jed: 31 Os)

// 1024 Os (jed: 1055 Os)
var uber_go = g, Os = 1024;
while(Os--){
    uber_go = uber_go();
}
uber_go = uber_go("al");

function count_o(str){
    var matches = str.match(/o/g);
    return matches == null ? 0 : matches.length;
}
console.log("\n\n");
console.log([ // test for proper length
        count_o(gal) == 0, 
        count_o(goal) == 1, 
        count_o(goooal) == 3, 
        count_o(gooooal) == 4, 
        count_o(gooooooooooooooooooooooooooal) == 26, 
        count_o(uber_go) == 1024
    ].join("\t"));
console.log([ // show length
        count_o(gal), 
        count_o(goal), 
        count_o(goooal), 
        count_o(gooooal), 
        count_o(gooooooooooooooooooooooooooal), 
        count_o(uber_go)
    ].join("\t"), "\n");
console.log([ // show string
        gal, goal, goooal, gooooal, gooooooooooooooooooooooooooal, uber_go
    ].join("\n"), "\n");