function g(str){
	var goal = 'g';

	function _g(str){
		if(str){
			return [goal, str].join('');	
		}
		goal += 'o';
		return _g;
	}

	return new _g(str);
};

console.log(g()('al'));
console.log(g()()('al'));
console.log(g()()()('al'));
