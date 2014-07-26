//
// To compile and run:
//
// $ g++ -W -Wall -Wextra -pedantic -std=c++0x -o goal goal.cpp && ./goal

#include <string>
#include <iostream>

const std::string g = "g";
const std::string h = "al";
const std::string i = "al";

#define g(X) g + h
#define h(X) "o" + i
#define i(X) "o" + h

int main()
{
    std::cout << g("al") << std::endl;
    std::cout << g()("al") << std::endl;
    std::cout << g()()()()()()("al") << std::endl;

    return 0;
}
