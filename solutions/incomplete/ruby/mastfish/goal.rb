
def method_missing(meth, *args, &block)
	super unless meth.to_s.match(/^go*/)
	"#{meth}al"
end

code = DATA.read.gsub('()','o')
eval(code)

__END__

gal = g('al')
goal = g()('al')
gooal = g()()('al')


puts gal
puts goal
puts gooal
puts g()()()()()()()()()()('al')