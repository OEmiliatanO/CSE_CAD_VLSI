#include <iostream>
#include <array>
#include <set>
#include <bitset>
#include <cassert>
#include <vector>
#include <iomanip>

constexpr std::size_t SIZE = 4;
bool f(std::bitset<SIZE> in)
{
	//return (in[3] & in[2]) | (!in[1]) | in[0];
    return !(!(in[3] & in[2]) & !((!in[1]) | in[0]));
}

bool f(size_t v)
{
	std::bitset<SIZE> in{v};
	//return (in[3] & in[2]) | (!in[1]) | in[0];
	return f(in);
}

bool f(std::bitset<SIZE> in, int which, bool SA1)
{
    bool n1 = which & 0b0001;
    bool n2 = which & 0b0010;
    bool n3 = which & 0b0100;

    if (n1)
	    return !(SA1 & !((!in[1]) | in[0]));
    else if (n2)
	    return !(!(in[3] & in[2]) & !(SA1 | in[0]));
    else if (n3)
    	return !(!(in[3] & in[2]) & SA1);

    return f(in);
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
        if ( (f(i) ^ f(in, 1<<(X-1), SA1)) == true )
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

int dfs_ans = -1;
std::set<int> ans;
void dfs(std::vector<std::set<int>>& vec, int& s, size_t i = 0)
{
    if (i == vec.size()) 
    {
        if (__builtin_popcount(dfs_ans) > __builtin_popcount(s))
            dfs_ans = s;
		if (5 == __builtin_popcount(s))
			ans.emplace(s);
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
	/* step 1
	std::cout << "the test set of A3 S-A-1 is: { ";
	for (auto& it : find_test_sets_A3_SA1())
		std::cout << it << ' ';
	std::cout << "}\n";
	*/
	/* step 2 */
    std::vector<std::set<int>> vec;
	for (int i = 3; i >= 0; --i)
	{
		for (int SA = 1; SA >= 0; --SA)
		{
			std::cout << "test set on A" << i << " S-A-" << SA << ":\n{ ";
			std::set ans = find_test_sets_AX((std::size_t)i, (bool)SA);
            vec.emplace_back(ans);
			for (auto& it : ans)
				std::cout << it << ' ';
			std::cout << "}\n";
		}
	}
	for (int i = 1; i <= 3; ++i)
	{
		for (int SA = 1; SA >= 0; --SA)
		{
			std::cout << "test set on n" << i << " S-A-" << SA << ":\n{ ";
			std::set ans = find_test_sets_nX((std::size_t)i, (bool)SA);
            vec.emplace_back(ans);
			for (auto& it : ans)
				std::cout << it << ' ';
			std::cout << "}\n";
		}
	}
	
    for (int SA = 1; SA >= 0; --SA)
    {
        std::cout << "test set on Y S-A-" << SA << ":\n{ ";
        std::set ans = find_test_sets_Y((bool)SA);
        vec.emplace_back(ans);
        for (auto& it : ans)
            std::cout << it << ' ';
        std::cout << "}\n";
    }
	
	/* step 3 */
	std::cout << "==================================\n\n";

	bool table[16]{};
	for (int i = 0; i < 16; ++i)
	{
		for (int j : vec[i])
			table[j] = true;
		for (int j = 0; j < 16; ++j)
		{
			std::cout << table[j] << ' ';
			table[j] = false;
		}
		std::cout << '\n';
	}

    int _ = 0;
    dfs(vec, _);

    std::cout << "\n==================================\n";
    std::cout << "minimum test set: \n";
	for (auto& dfs_ans : ans)
	{
		std::cout << "{ ";
		for (size_t i = 0; i < 32; ++i)
        	if (dfs_ans & (1<<i))
            	std::cout << i << ' ';
    	std::cout << "}\n";
	}
	std::cout << "\n";
	return 0;
}
