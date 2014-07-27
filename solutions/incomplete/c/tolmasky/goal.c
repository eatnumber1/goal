
// To compile and run
// gcc goal.c -o goal && ./goal

#include "goal.h"
#include <stdio.h>


const char * call()
{
    return g()()()()()("al");
}

int main()
{
    printf("%s\n", g("al"));
    printf("%s\n", g()("al"));
    printf("%s\n", g()()()()()()("al"));

    // extra
    const char * s = g("al");
    const char * s2 = g(  )()()("al");

    printf("%s\n", s);
    printf("%s\n", s2);
    printf("%s\n", call());

    return 0;
}
