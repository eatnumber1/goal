#define _POSIX_C_SOURCE 200809L
//#define _XOPEN_SOURCE 700
#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <assert.h>
#include <stddef.h>
#include <stdlib.h>

#include "goal.h"

%%{
	machine goal;

	action incr_ohs {
		assert(num_ohs < UINT_MAX);
		num_ohs++;
	}

	action advance_strp {
		*(strp++) = fc;
	}

	action init_goal {
		num_ohs = 0;
	}

	action goal {
		static const unsigned int NCHARS_WITHOUT_OHS = 7; // g('al')
		static const unsigned int NCHARS_WITHOUT_OHS_AFTER = 3; // gal
		static const unsigned int NCHARS_IN_OH = 2; // ()

		char *sp = strp - NCHARS_WITHOUT_OHS - (num_ohs * NCHARS_IN_OH);
		assert(*sp == 'g');
		sp++;
		for (unsigned int i = 0; i < num_ohs; i++) {
			*(sp++) = 'o';
		}
		*(sp++) = 'a';
		*(sp++) = 'l';

		strp = sp;
		*len -= num_ohs + (NCHARS_WITHOUT_OHS - NCHARS_WITHOUT_OHS_AFTER);
	}

	quote = ["'"'"'];
	endal = '(' quote 'al' quote ')';
	goal = ('g' ('()' @incr_ohs)* endal);

	main := (
		  any+
		| goal >init_goal %goal
	)* $advance_strp;
}%%

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wunused-const-variable"
%% write data;
#pragma clang diagnostic pop

void rewrite(char *buf, size_t *len) {
	unsigned int num_ohs = 0;
	char *strp = buf;

	int cs = %%{ write start; }%%;
	char *p = buf;
	char *pe = buf + *len;
	char *eof = pe;

	%% write init;
	%% write exec;
}
