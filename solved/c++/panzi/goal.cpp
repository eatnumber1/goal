// compile and run with:
// $ g++ -Wall -Werror -Wextra -pedantic goal.cpp -O3 -o goal && ./goal

#include <string>
#include <iostream>

struct G {
	std::string o;
	G operator()(){G i;i.o=o+'o';return i;}
	std::string operator()(const char*l){return'g'+o+l;}
} g;

int main() {
	std::cout << g("al") << std::endl;
	std::cout << g()("al") << std::endl;
	std::cout << g()()("al") << std::endl;
	return 0;
}
