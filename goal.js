function g(str){	
	var self = this;
	self.str = self.str || 'g';
	
	if(str){
		return console.log([self.str, str].join(''));	
	}
	
	self.str += 'o';
	return g;
};

g()('al');
g()()('al');
g()()()('al');
