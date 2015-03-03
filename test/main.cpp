#include <iostream>
#include <algorithm>
#include <iterator>
#include <deque>
#include <folly/FBVector.h>
#include <folly/FBString.h>

struct NoneTrivial
{
    NoneTrivial(int){}

    folly::fbvector<int> vec;
};

FOLLY_ASSUME_FBVECTOR_COMPATIBLE(NoneTrivial);

int main()
{
    folly::fbvector<int> vec;
    for (int i = 0; i < 100; ++i) {
        vec.push_back(i);
    }
    folly::fbstring str = "Hello World";
    folly::fbvector<char> toAppend({ '0', '1', '2', '3', '4' });
    std::copy(toAppend.begin(), toAppend.end(), std::back_inserter(str));
    std::cout << str << std::endl;

    static_assert(!std::is_trivially_copyable<NoneTrivial>::value, "oops!");
    static_assert(folly::IsRelocatable<NoneTrivial>::value, "oops!!");
    return !(vec.size() == 100);
}