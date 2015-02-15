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

	action inner_oh {
		assert(num_ohs <= UINT_MAX);
		num_ohs++;
	}

	action goal_found {
		*(strp++) = 'g';
		for (unsigned int i = 0; i < num_ohs; i++) {
			*(strp++) = 'o';
			(*len)++;
		}
		*(strp++) = 'a';
		*(strp++) = 'l';
		*len += 3;
		fhold;
		fret;
	}

	action init_goal {
		num_ohs = 0;
		chars_consumed = 0;
	}

	action goal_rollback {
		char *cp = fpc - chars_consumed;
		memcpy(strp, cp, chars_consumed);
		strp += chars_consumed;
		*len += chars_consumed;
		fhold;
		fret;
	}

	action buffer_advance_strp {
		*(strp++) = fc;
		(*len)++;
	}

	action call_goal {
		fhold;
		fcall goal;
	}

	action goal_consume_char {
		num_to_rollback++;
	}

	action buffer_init {
		*len = 0;
	}

	action goal_all {
		chars_consumed++;
	}

	quote = ["'"'"'];
	endal = '(' quote 'al' quote ')';
	goal := ('g' ('()' @inner_oh)* endal) %!goal_found %goal_found >init_goal @!goal_rollback $goal_all;

	main := (
		  (any -- 'g') $buffer_advance_strp
		| 'g' @call_goal
	)* >buffer_init;
}%%

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wunused-const-variable"
%% write data;
#pragma clang diagnostic pop

void rewrite(char *buf, size_t *len) {
	unsigned int num_ohs = 0;
	int cs = %%{ write start; }%%;
	char *strp = buf;
	unsigned int chars_consumed = 0;

	char *p = buf;
	char *pe = buf + *len;
	int stack[1024];
	int top = 0;
	char *eof = pe;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wunreachable-code"
#pragma clang diagnostic ignored "-Wunreachable-code-break"
	%% write init;
	%% write exec;
#pragma clang diagnostic pop
}
