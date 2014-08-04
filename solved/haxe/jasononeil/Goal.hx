class Goal {
	static function g(?al,?prefix):Dynamic {
		if (prefix==null) prefix = "g";
		return (al=="al") ? prefix+al : g.bind(_,prefix+"o");
	}
	static function main() {
		trace(g('al'));
		trace(g()('al'));
		trace(g()()('al'));
	}
}
