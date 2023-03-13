#include <iostream>
#include <array>
#include <set>
#include <bitset>
#include <cassert>
#include <vector>

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

bool f_wn(int n, bool val, std::bitset<SIZE> in)
{
    if (n == 1)
	    return !(val & !((!in[1]) | in[0]));
    else if (n == 2)
	    return !(!(in[3] & in[2]) & !(val | in[0]));
    else if (n == 3)
    	return !(!(in[3] & in[2]) & val);
    assert(false);
    return false;
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
        if ((f(i) ^ f_wn(X, SA1, in)) == true)
			ans.emplace(i);
	}
	return ans;
}

std::set<int> find_test_sets_Y(bool SA1)
{
    std::set<int> ans;
	for (size_t i = 0; i < (1<<SIZE); ++i)
	{
		std::bitset<SIZE> in{i};
        if ((f(i) ^ SA1) == true)
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

int dfs_ans = -1;
void dfs(std::vector<std::set<int>>& vec, int& s, size_t i = 0)
{
    if (i == vec.size()) 
    {
        if (__builtin_popcount(dfs_ans) > __builtin_popcount(s))
            dfs_ans = s;
        return;
    }

    for (auto& bit : vec[i])
    {
        bool exist = false;
        if (s & (1<<bit)) exist = true;
        s |= (1<<bit);
        dfs(vec, s, i+1);
        if (not exist) s ^= (1<<bit);
    }
}

int main()
{
	/*
	for (int i = 0; i < 16; ++i)
		std::cout << i << '\t' << (f(i) == f(std::bitset<4>{(unsigned long)i})) << '\n';
	*/
    std::vector<std::set<int>> vec;
	for (std::size_t i = 0; i < 4; ++i)
	{
		for (std::size_t SA = 0; SA <= 1; ++SA)
		{
			std::cout << "test set on A" << i << " S-A-" << SA << ":\n{ ";
			std::set ans = find_test_sets_AX(i, (bool)SA);
            vec.emplace_back(ans);
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
            vec.emplace_back(ans);
			for (auto& it : ans)
				std::cout << it << ' ';
			std::cout << "}\n";
		}
	}
	
    for (std::size_t SA = 0; SA <= 1; ++SA)
    {
        std::cout << "test set on Y S-A-" << SA << ":\n{ ";
        std::set ans = find_test_sets_Y((bool)SA);
        vec.emplace_back(ans);
        for (auto& it : ans)
            std::cout << it << ' ';
        std::cout << "}\n";
    }

    int _ = 0;
    dfs(vec, _);

    std::cout << "minimum test set: { ";
    for (size_t i = 0; i < 32; ++i)
        if (dfs_ans & (1<<i))
            std::cout << i << ' ';
    std::cout << "}\n";

	return 0;
}
