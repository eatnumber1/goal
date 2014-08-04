/*
 * C++ solution using a functor & template metaprogramming
 *
 * build and run with e.g.
 * g++ -std=c++11 -Wall -pedantic -Wextra -o goal goal.cpp && ./goal
 */

#include <iostream>
#include <string>

template<unsigned N=0>
struct repeater {
    repeater(const std::string& init)
        : init_(init) { }

    std::string operator()(const std::string& terminal) const
    {
        std::string res = init_;
        for (unsigned n = 0; n < N; ++n)
            res += "o";
        res += terminal;
        return res;
    }

    repeater<N+1> operator()() const
    {
        return repeater<N+1>(init_);
    }

    const std::string init_;
};

const auto g = repeater<>("g");

int main()
{
    std::cout << g("al") << '\n';
    std::cout << g()("al") << '\n';
    std::cout << g()()()()()()("al") << '\n';
}
