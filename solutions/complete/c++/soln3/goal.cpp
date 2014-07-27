// compile and run with:
// $ g++ -Wall -Werror -Wextra -pedantic goal.cpp -O3 -o goal && ./goal

#include <string>
#include <iostream>

struct G {
	std::string o;
	G(const std::string&o=""):o(o){}
	G operator()(){return o+"o";}
	std::string operator()(const std::string&al){return"g"+o+al;}
};

G g;

int main() {
	std::cout << g("al") << std::endl;
	std::cout << g()("al") << std::endl;
	std::cout << g()()("al") << std::endl;
	return 0;
}
