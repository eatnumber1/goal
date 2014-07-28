
def method_missing meth, *args, &block 
	super unless meth.to_s.match /^g.*/
	"#{meth}al".gsub '（）', 'o'
end

gal = g('al')
p gal

goal = g（）('al')
p goal

gooal = g（）（）('al')
p gooal