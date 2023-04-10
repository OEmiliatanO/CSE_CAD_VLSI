#include <iostream>
#include <algorithm>
#include <array>
constexpr std::size_t SIZE = 200;

struct cdfg
{
    int op, op1, op2, result;
    cdfg() = default;
    cdfg(int op_, int op1_, int op2_, int result_): op{op_}, op1{op1_}, op2{op2_}, result{result_} {}
};

std::array<cdfg, SIZE> sample1;

struct readylist
{
    std::size_t step, num;
    int op;
    readylist() = default;
    readylist(std::size_t step_, std::size_t num_, int op_): step{step_}, num{num_}, op{op_} {}
}temp;

std::array<readylist, SIZE> list1;
       
struct alu
{
    std::size_t mult, add;
    alu() = default;
    alu(std::size_t mult_, std::size_t add_): mult{mult_}, add{add_} {}
};

std::array<alu, SIZE> alulist;

void list_scheduling(std::size_t N, std::size_t n_add = 1, std::size_t n_mul = 1, std::size_t t_add = 1, std::size_t t_mul = 1)
{
    std::size_t time[3]{0, t_add, t_mul};
    std::size_t step = 1;
 
    for (auto& alu_ : alulist) 
    {
        alu_.add = n_add;
        alu_.mult = n_mul;
    }
         
    for (std::size_t i = 0; i < N; ++i)
    {
        for (std::size_t j = 0; j < i; ++j)
            if (sample1[i].op1 == sample1[j].result || sample1[i].op2 == sample1[j].result)
                step = list1[j].step + time[sample1[j].op];
 
        if (sample1[i].op == 1)
            for (; alulist[step].add == 0; ++step);
        else if (sample1[i].op == 2) 
            for (; alulist[step].mult == 0; ++step);
        else
        {
            std::cerr << "invalid oper: " << sample1[i].op << std::endl;
            exit(1);
        }

        list1[i].op = sample1[i].op;
        list1[i].step = step;
        list1[i].num = i;

        if (sample1[i].op == 1)
            for (std::size_t t = 0; t < t_add; ++t)
                --alulist[step + t].add;
        else if(sample1[i].op == 2)
            for (std::size_t t = 0; t < t_mul; ++t)
                --alulist[step + t].mult;
    }

    std::sort(list1.begin(), list1.begin() + N, [](const auto& lhs, const auto& rhs) { return lhs.step < rhs.step; });

    std::cout << "Mult Constraint:" << n_mul << "\n" << "Add Constraint:" << n_add << "\n" << std::endl;
    for(std::size_t i = 0; i < N; ++i)
    {
        auto n = list1[i].num;
        //std::cerr << n << std::endl;
        auto op = sample1[n].op, op1 = sample1[n].op1, op2 = sample1[n].op2, result = sample1[n].result;

        std::cout << list1[i].step << " v" << result << " = v" << op1 << " " << " +*"[op] << " v" << op2 << "\n";
    }

    return;
}

int main(int argc, char **argv)
{
    std::size_t N;
	std::cin >> N;
	
    for (std::size_t i = 0; i < N; ++i)
	{
        auto& oper = sample1[i];
		std::cin >> oper.op >> oper.op1 >> oper.op2 >> oper.result;
    }

    std::size_t n_mul = (std::size_t)std::atoi(argv[1]), n_add = (std::size_t)std::atoi(argv[2]);
    std::size_t t_mul = (std::size_t)std::atoi(argv[3]), t_add = (std::size_t)std::atoi(argv[4]);

    list_scheduling(N, n_add, n_mul, t_add, t_mul);
	return 0;
}
