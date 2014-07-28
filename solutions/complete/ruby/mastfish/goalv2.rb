require 'pry'

def method_missing(meth, *args, &block)
	super unless meth.to_s.match(/^go*/)
	"#{meth}al"
end

begin
	load 'goalv2_.rb'
rescue SyntaxError => e
	DebatablyCorrect = eval e.message.split("\n")[1].gsub('()', 'o')
	p DebatablyCorrect
end
