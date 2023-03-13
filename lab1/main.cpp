#include <iostream>
#include <array>
#include <set>
#include <bitset>


constexpr std::size_t SIZE = 4;
bool f(std::bitset<SIZE> in)
{
	return (in[3] & in[2]) | (!in[1]) | in[0];
}

bool f(size_t v)
{
	std::bitset<SIZE> in{v};
	//return (in[3] & in[2]) | (!in[1]) | in[0];
	return !(!(in[3] & in[2]) & !((!in[1]) | in[0]));
}


std::set<int> find_test_sets_A3_SA1()
{
	std::set<int> ans;
	for (size_t i = 0; i < (1<<SIZE); ++i)
		if ((f(i) ^ f(std::bitset<SIZE>{i|0b1000})) == true)
			ans.emplace(i);
	return ans;
}

std::set<int> find_test_sets_AX(std::size_t X, bool SA1)
{
	std::set<int> ans;
	for (size_t i = 0; i < (1<<SIZE); ++i)
	{
		std::bitset<SIZE> in{i};
		in[X] = SA1;
		if ((f(i) ^ f(in)) == true)
			ans.emplace(i);
	}
	return ans;
}
std::set<int> find_test_sets_nX(std::size_t X, bool SA1)
{
	std::set<int> ans;
	for (size_t i = 0; i < (1<<SIZE); ++i)
	{
		std::bitset<SIZE> in{i};
		bool n[4] = {0, !(in[3] & in[2]), !in[1], !((!in[1]) | in[0])};
		if (n[X] == SA1)
			ans.emplace(i);
	}

	return ans;
}

template<class T>
std::set<T> union_set(std::set<T> a, std::set<T> b)
{
	std::set<T> res;
	set_union(a.begin(), a.end(),
		      b.begin(), b.end,
			  res.begin());
	return res;
}

int main()
{
	/*
	for (int i = 0; i < 16; ++i)
		std::cout << i << '\t' << (f(i) == f(std::bitset<4>{(unsigned long)i})) << '\n';
	*/
	for (std::size_t i = 0; i < 4; ++i)
	{
		for (std::size_t SA = 0; SA <= 1; ++SA)
		{
			std::cout << "test set on A" << i << " S-A-" << SA << ":\n{ ";
			std::set ans = find_test_sets_AX(i, (bool)SA);
			for (auto& it : ans)
				std::cout << it << ' ';
			std::cout << "}\n";
		}
	}
	for (std::size_t i = 1; i <= 3; ++i)
	{
		for (std::size_t SA = 0; SA <= 1; ++SA)
		{
			std::cout << "test set on n" << i << " S-A-" << SA << ":\n{ ";
			std::set ans = find_test_sets_nX(i, (bool)SA);
			for (auto& it : ans)
				std::cout << it << ' ';
			std::cout << "}\n";
		}
	}
	return 0;
}
