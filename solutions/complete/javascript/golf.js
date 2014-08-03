// $ node golf.js
var fs = require("fs");
var colors = require("colors");

console.log("");

function width(str, l){
	if(typeof str == "number"){
		l = str;
		str = "";
	}
	while(str.length < l){
		str += " ";
	}
	return str;
}

console.log("%s %s gal", width("    g('al') == 'gal'", 82).grey, width(14));
console.log("%s %s | goal", width("    g()('al') == 'goal'", 82).grey, width(14));
console.log("%s %s | | gooal", width("    var goo = g()(); goo('al') == 'gooal' ", 82).grey, width(14));
console.log("%s %s | | | goooal ", width("    goo()('al') == 'goooal' ", 82).grey, width(14));
console.log("%s %s | | | | golf", width("    g()('lf') == 'golf' ", 82).grey, width(14));
console.log("%s %s | | | | |", width(82), width(14));

var dirs = fs.readdirSync(__dirname);
dirs.forEach(function(dir){
	var stat = fs.statSync(__dirname + "/" + dir);
	if(stat.isDirectory()){
		if(fs.existsSync(__dirname + "/" + dir + "/golf.js")){
			//console.log("%s/ is a directory.", dir);
			//console.log("\t has golf.js!");
			var golf = require(__dirname + "/" + dir + "/golf.js");
			var _gal = "-",
				_goal = "-",
				_gooal = "-",
				_goooal = "-",
				_golf = "-";
				_goo = null;
			var err = false;
			try {
				// No bother eval()'ing; Node doesn't support ES6's arrow functions
				if(golf.type <= 5.1) eval(golf.src);
			} catch(e){
				err = true;
			}
			try {
				if(!err && g) _gal = g("al") == "gal" ? "\u2713".green : "\u00D7".red;
				if(!err && g) _goal = g()("al") == "goal" ? "\u2713".green : "\u00D7".red;
				if(!err && g){
					_goo = g()();
					_gooal = _goo("al") == "gooal" ? "\u2713".green : "\u00D7".red;
				}
				if(!err && g) _goooal = _goo()("al") == "goooal" ? "\u2713".green : "\u00D7".red;
				if(!err && g) _golf = g()("lf") == "golf" ? "\u2713".green : "\u00D7".red;
			} catch(e){
				console.log(e);
			}
			console.log("%s %s %s %s %s %s %s  %s chars", width(golf.name || dir, 14).grey, width(golf.src, 82),
				_gal,
				_goal,
				_gooal,
				_goooal,
				_golf,
				golf.src.length);
		}
	} else if(stat.isFile()) {
		// console.log("'%s' is a file.", dir)
	}
});