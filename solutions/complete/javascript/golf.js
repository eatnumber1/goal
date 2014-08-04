// $ node golf.js
var fs = require("fs");
var colors = require("colors");

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

console.log("");
console.log("%s %s    gal", width("    g('al') == 'gal'", 82).grey, width(14));
console.log("%s %s   /  goal", width("    g()('al') == 'goal'", 82).grey, width(14));
console.log("%s %s  |  /  gooal", width("    var goo = g()(); goo('al') == 'gooal' ", 82).grey, width(14));
console.log("%s %s  | |  /  goooal ", width("    goo()('al') == 'goooal' ", 82).grey, width(14));
console.log("%s %s  | | |  /  golf", width("    g()('lf') == 'golf' ", 82).grey, width(14));
console.log("%s %s  | | | |  / ", width(82), width(14));

var dirs = fs.readdirSync(__dirname); // get solutions
dirs.filter(function(dir){ // filter for golf solutions
	var stat = fs.statSync(__dirname + "/" + dir);
	return stat.isDirectory() && fs.existsSync(__dirname + "/" + dir + "/golf.js");	
}).map(function(dir){
	var sol;
	try {
		sol = require(__dirname + "/" + dir + "/golf.js");
		if(!sol.src) throw new Error("Was not a valid golf solution.");
		sol.name = sol.name || dir;
		sol.path = __dirname + "/" + dir + "/golf.js";
	} catch(e) {
		sol = {
			"name": dir,
			"type": null,
			"src": "[ERR] " + e.message,
			"path": __dirname + "/" + dir + "/golf.js"
		};
	}
	return sol;
}).sort(function(a, b){
	var a_len = a.src.length;
	var b_len = b.src.length;
	if(a.type == null) a_len = Infinity;
	if(b.type == null) b_len = Infinity;
	return a_len > b_len ? -1 : 1;
}).forEach(function(sol){ // test golf solutions
	var src = width(sol.src, 82);
	var name = width(sol.name, 14).grey;
	if(sol.type > 0.0 && sol.type < 5.1) src = src.bold;
	if(sol.type > 5.1) src = src.grey;
	if(sol.type === null) src = src.red;

	var success = "\u2713".green;
	var failure = "\u00D7".red;
	var unknown = "-".grey;

	var _gal =
		_goal = 
		_gooal =
		_goooal =
		_golf = unknown;

	if(sol.type <= 5.1){
		try {
			g = null;
			if(sol.type !== null) eval(sol.src);
			if(!g) throw new Error("g() does not exist!");
			_gal = g("al") == "gal" ? success : failure;
			_goal = g()("al") == "goal" ? success : failure;
			_goo = g()();
			_gooal = _goo("al") == "gooal" ? success : failure;
			_goooal = _goo()("al") == "goooal" ? success : failure;
			_golf = g()("lf") == "golf" ? success : failure;
		} catch(e){
			console.log("[ERROR] %s".red, e.message);
		}
	}
	console.log("%s %s  %s %s %s %s %s  %s chars", name, src,
		_gal, _goal,_gooal, _goooal, _golf,
		sol.type === null ? "-".grey : sol.src.length);
});
