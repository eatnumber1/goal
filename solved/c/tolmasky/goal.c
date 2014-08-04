// To compile and run:
// gcc goal.c -o goal && ./goal
//
// To view expansion:
// gcc -E goal.c
//
// Author: @tolmasky


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define g(X) start("o" #X) ? "" : goal0
#define goal0(X) update("o" #X) ? "" : goal1
#define goal1(X) update("o" #X) ? "" : goal0

char * goal0 = "g";
char * goal1 = "g";

int start(const char * s)
{
    goal0 = goal1 = strdup(strlen(s) == 1  ? "go" : "gal");

    return 0;
}

int update(const char * s)
{
    const char * append = strlen(s) == 1 ? "o" : "al";

    int length = strlen(goal0) + strlen(append) + 1;
    char * updated = calloc(length, sizeof(char));

    strcat(updated, goal0);
    strcat(updated, append);

    goal0 = goal1 = updated;

    return 0;
}

int main()
{
    printf("%s\n", g('al'));
    printf("%s\n", g()('al'));
    printf("%s\n", g()()()()()()('al'));

    const char * s = g()()()()()()()()()("al");

    printf("%s\n", s);

    return 0;
}
