/*
 * To compile and run:
 * gcc -Werror -W -Wall -pedantic --std=c99 goal.c -o goal && ./goal
 *  
 * To view expansion:
 * gcc -E goal.c | less 
 * 
 * Author: nicopauss
 *
 */

#include <stdio.h>

#define GOAL_COMMA(...) ,
#define GOAL_NO_COMMA(...) GOAL_NO_COMMA_N(__VA_ARGS__, 0, 1, 1)
#define GOAL_NO_COMMA_N(_0, _1, _2, ...) _2
#define GOAL_HAS_VAR(...) GOAL_NO_COMMA(GOAL_COMMA __VA_ARGS__ ())

#define GOAL_NEXT_0(X) GOAL_NEXT_0_N1(GOAL_HAS_VAR(X), X)
#define GOAL_NEXT_0_N1(N, X) GOAL_NEXT_0_N2(N, X)
#define GOAL_NEXT_0_N2(N, X) GOAL_NEXT_0_##N (X)
#define GOAL_NEXT_0_0() "o"GOAL_NEXT_1
#define GOAL_NEXT_0_1(X) X

#define GOAL_NEXT_1(X) GOAL_NEXT_1_N1(GOAL_HAS_VAR(X), X)
#define GOAL_NEXT_1_N1(N, X) GOAL_NEXT_1_N2(N, X)
#define GOAL_NEXT_1_N2(N, X) GOAL_NEXT_1_##N (X)
#define GOAL_NEXT_1_0() "o"GOAL_NEXT_0
#define GOAL_NEXT_1_1(X) X

#define g(X) "g"GOAL_NEXT_0(X)

int main()
{
    printf("%s\n", g("al"));
    printf("%s\n", g()("al"));
    printf("%s\n", g()()()()()()("al"));

    const char * s = g()()()()()()()()()("al");

    printf("%s\n", s);
    
    /* g()...("al") is expanded as a string literal, so you can do this: */
    
    puts("Goal? " g()()()()()("al"));
    return 0;
}

