function g(str){
	var goal = 'g';

	function _g(str){
		if(str){
			return console.log([goal, str].join(''));	
		}
		goal += 'o';
		return _g;
	}

	return new _g(str);
};

g()('al');
g()()('al');
g()()()('al');
