function g(v=null){var s='g';return v?s+v:function o(v=null){s+='o';return v?s+v:o}}

trace( g('al') ); 		    // gal
trace( g()('al') ); 		  // goal
trace( g()()('al') ); 		// gooal
trace( g()()()('al') ); 	// goooal
