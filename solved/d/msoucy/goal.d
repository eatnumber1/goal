#!/usr/bin/env rdmd
// D version

import std.stdio;

struct Goal {
	string o = "g";
	this(string os) { o = os; }
	auto opCall(string l="o") { return Goal(o~l); }
	alias o this;
}

void main()
{
	Goal g;
	g("al").writeln();
	g()("al").writeln();
	g()()("al").writeln();
	g()()()()()("al").writeln();
}

