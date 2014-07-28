function g( str )
	local o_count = 0
	local function o_func( str )
		if ( str ) then
			return 'g'..('o'):rep( o_count )..str
		else
			o_count = o_count + 1
			return o_func
		end
	end
	return o_func( str )
end

print( g('al') ) --> gal
print( g()('al') ) --> goal
print( g()()('al') ) --> gooal