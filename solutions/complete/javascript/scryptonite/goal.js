//  <https://github.com/eatnumber1/goal> JavaScript g()()("al") code golfing.
g=function(l){t=this;t=t.g?"g":t;return l?t+l:g.bind(t+"o")}

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