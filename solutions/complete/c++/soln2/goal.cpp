/**
 * C++ Solution using a functor instead of #defines.
 * To compile and run:
 * g++ -W -Wall -Wextra -pedantic -std=c++0x -o goal goal.cpp && ./goal
 */

#include <string>
#include <iostream>
#include <sstream>

struct g
{
    g()
    {
        build = "go";
    }

    g(const std::string& s)
    {
        build = "g" + s;
    }

    g(const g& g) : build(g.build) { }

    g& operator()()
    {
        build += "o";
        return *this;
    }

    g& operator()(const std::string& s)
    {
        build += s;
        return *this;
    }

    friend std::ostream& operator<<(std::ostream& os, const g& g)
    {
        os << g.build;
        return os;
    }

protected:
    std::string build;
};

int main()
{
    std::cout << g("al") << std::endl;
    std::cout << g()("al") << std::endl;
    std::cout << g()()()()()()("al") << std::endl;

    return 0;
}
