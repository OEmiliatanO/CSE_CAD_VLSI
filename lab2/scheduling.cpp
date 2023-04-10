#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <algorithm>
#define perr(...) fprintf(stderr, __VA_ARGS__)

constexpr std::size_t Size = 200;

struct cdfg{
    int op, op1, op2, result;
}sample1[Size];

struct readylist{
    int state, op, num;
}list1[Size],temp;
       
struct alu{
    int mult, add;
}alulist[Size];

void list_Scheduling(int end)
{
    int opmult, opadd;
	int timemul, timeadd;
    int i, j, state = 1, opstate = 1;
    int signal = 0;
	int breakpoint = 0;
 
    do {
        perr("\n input the number of constrained multiplier and adder: ");
        scanf("%d %d", &opmult, &opadd);
		perr("\n input the time cost of multiplier and adder: ");
		scanf("%d %d", &timemul, &timeadd);
        
        printf("\nnumber of multiplier: %d, adder: %d\n", opmult, opadd);
		printf("\nthe time cost of multiplier: %d, adder: %d\n", timemul, timeadd);
        signal = 0;
        state = 1;
        opstate = 1;
        for (i = 0; i < Size; i++) //alulist initialize 
        {
        	alulist[i].add = opadd;     
        	alulist[i].mult = opmult;
        }
             
        for (i = 0; i < end; i++)
        {
        	signal = 0;
			
            for (j = 0; j < i; j++) // find the state which op1 and op2 appear last
            {
                if ((sample1[j].op == 1) && ((sample1[i].op1 == sample1[j].result) || (sample1[i].op2 == sample1[j].result)))
                {
                    signal = 1;
					opstate = list1[j].state + timeadd - 1;
                }
                
                if ((sample1[j].op == 2) && ((sample1[i].op1 == sample1[j].result) || (sample1[i].op2 == sample1[j].result)))
                {
                    signal = 1;
					opstate = list1[j].state + timemul - 1;
                }
            }
            
			if((i > 0) && (signal == 1))
				state = opstate + 1;
             
            if (sample1[i].op == 2) // determine which state to execute this operator 
            	do {
                	if (alulist[state].mult == 0) // the multiplers are sold out in this state 
                    	state++;
                    if (alulist[state].mult > 0)
                        break;
                } while(true);

            if(sample1[i].op == 1)
                do {
                    if (alulist[state].add == 0)
                        state++;
                    if (alulist[state].add > 0)
                        break;
                } while(true);

            list1[i].op = sample1[i].op;
            list1[i].state = state;
            list1[i].num = i;

            if(sample1[i].op == 2)
				for (int i = 0; i < timemul; ++i)
					alulist[state + i].mult = alulist[state + i].mult - 1;
        	else if (sample1[i].op == 1) //there are adders and need them
				for (int i = 0; i < timeadd; ++i)
					alulist[state + i].add = alulist[state + i].add - 1;
			else 
			{ perr("error"); exit(1); }
		}

		std::sort(list1, list1+end, [](const auto& lhs, const auto& rhs) { return lhs.state < rhs.state; });

        fprintf(fptr_out,"*****************************\n");
        fprintf(fptr_out,"*    Resource Constraint    *\n");
        fprintf(fptr_out,"*                           *\n");
        fprintf(fptr_out,"*     Mult Constraint:%1d     *\n",opmult);
        fprintf(fptr_out,"*     Add  Constraint:%1d     *\n",opadd);
        fprintf(fptr_out,"*                           *\n");
        fprintf(fptr_out,"*****************************\n");
		for(i=0;i<end;i++)
		{
			int op = sample1[list1[i].num].op;
			printf("State:%3d  v%3d = v%3d %c v%3d\n", list1[i].state, \
					sample1[list1[i].num].result, \
					sample1[list1[i].num].op1, \
					" +*"[op], \
					sample1[list1[i].num].op2);

			fprintf(fptr_out,"State:%3d  v%3d = v%3d %c v%3d\n", list1[i].state, \
					sample1[list1[i].num].result, \
					sample1[list1[i].num].op1, \
					" +*"[op], \
					sample1[list1[i].num].op2);
		}
        
        fprintf(fptr_out, "\n\n\n\n");

        printf("\ncontinue? No(0) Yes(1): ");
        scanf("%d", &breakpoint);

		printf("\n\n");

    } while(breakpoint);
	printf("exit...\n");
   	fclose(fptr_out);
}

int main()
{
    int count = 0, N;
	std::cin >> N;
	
	int op, op1, op2, result;
    for (std::size_t i = 0; i < N; ++i)
	{
		std::cin >> op >> op1 >> op2 >> result;
        sample1[i].op = op;
        sample1[i].op1 = op1;
        sample1[i].op2 = op2;
        sample1[i].result = result;
    }

    list_Scheduling(N);
	return 0;
}
