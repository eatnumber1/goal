#include <iostream>
#include <cstring>
#include <cassert>

template<char C>
struct Char { char c; Char() : c(C) {} };

struct G : Char<'g'> {};

template<size_t N>
struct O : O<N-1>, Char<'o'> {};

template<>
struct O<0> : G {};

template<size_t N>
struct Al : O<N>, Char<'a'>, Char<'l'>, Char<'\0'> {
  operator const char*() const { return reinterpret_cast<const char*>(this); }
};

template<size_t N>
struct Go : O<N> {
  Al<N> operator()(const char* s) {
    assert(std::strcmp(s, "al") == 0);
    return Al<N>();
  }
  Go<N+1> operator()() {
    return Go<N+1>();
  }
};

Go<0> g;

int main() {
  std::cout << g("al") << std::endl;
  std::cout << g()("al") << std::endl;
  std::cout << g()()()()("al") << std::endl;
}
