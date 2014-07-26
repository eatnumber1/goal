
#include <stdio.h>


#define g(X) "g" h##X
#define h(X) "o" i##X
#define i(X) "o" h##X
#define hal "al"
#define ial "al"

int main()
{
    printf("%s\n", g(al));
    printf("%s\n", g()(al));
    printf("%s\n", g()()()()()()(al));

    return 0;
}
