// To compile and run:
// gcc goal.c -o goal && ./goal


#include <stdio.h>
#include <locale.h>
#include <string.h>
#include <stdlib.h>

#define g(X) p("o" X) ? "" : f
#define f(X) r("o" X) ? "" : h
#define h(X) r("o" X) ? "" : f

char * h = "g";
char * f = "g";

const char * gee = "g";
const char * gal = "gal";

int p(const char * s)
{
    const char * start = strlen(s) == 1  ? "go" : "gal";
    char * startover = malloc(strlen(start) + 1);

    startover[strlen(start)] = '\0';
    strncpy(startover, start, strlen(start));

    h = startover;
    f = startover;

    return 0;
}

int r (const char * s)
{
    const char * append = strlen(s) == 1 ? "o" : "al";

    int newLength = strlen(h) + strlen(append) + 1;
    char * newString = malloc(strlen(h) + strlen(append) + 1);

    newString[strlen(h) + strlen(append)] = '\0';

    strncpy(newString, h, strlen(h));
    strncpy(newString + strlen(h), append, strlen(append));

    h = newString;
    f = newString;

    return 0;
}



int main()
{
    printf("%s\n", g("al"));
    printf("%s\n", g()("al"));
    printf("%s\n", g()()()()()()("al"));

    return 0;
}
