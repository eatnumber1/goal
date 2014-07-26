#include <stdio.h>
#include <string.h>

typedef void *(*(*(*(func_o)())())())();

char _goal[100];

func_o *o(const char *str)
{
	if ((str[0] == 'a') && (str[1] == 'l'))
	{
		strcat(_goal, str);
		return (func_o *)_goal;
	}
	else
	{
		strcat(_goal, "o");
		return (func_o *)&o;
	}
}

func_o *(*g())()
{
	memset(_goal, 0, sizeof(_goal));
	strcat(_goal, "go");
	return (void *)&o;
}

int main(int argc, char **argv)
{
	printf("%s\n", g()("al"));
	printf("%s\n", g()()("al"));
	printf("%s\n", g()()()("al"));
	printf("%s\n", g()()()()("al"));
	printf("%s\n", g()()()()()("al"));
}

