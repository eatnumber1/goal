function goal(str){	
	var self = this;
	self.str = self.str || 'g';
	
	if(str){
		return console.log([self.str, str].join(''));	
	}
	
	self.str += 'o';
	return goal;
};

goal()('al');
goal()()('al');
goal()()()('al');
