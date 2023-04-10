#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#define Size 200
struct cdfg{
       int op;
       int op1;
       int op2;
       int result;
       }sample1[Size];

struct readylist{
       int state;
       int op;
       int num;
       int dis;
       }list1[Size],temp;
       
struct alu{
       int mult;
       int add;
       }alulist[Size];

int readIn()
{
	FILE *fptr_in;

    int step=0,op=0,op1=0,op2=0,result=0,count=0,end;
	char  In_FileName[20]; 
	int i;


    printf("\nfor pic 1,type DFG1.txt \nfor pic 2, type DFG2.txt\n");    
    printf("\n Enter Input filename : ");
	scanf("%s",In_FileName);
	
    if( (fptr_in = fopen(In_FileName , "r")) == NULL )
	{
		printf("Error!!can not open file!! \nPress any key to exit. \n");
    	exit(1); 
	}
	
	fscanf(fptr_in,"%d",&end);
	
	
    while( fscanf(fptr_in," %d %d %d %d ",&op,&op1,&op2,&result) ){


                         sample1[count].op=op;
 //                        printf("op=%d",sample1[count].op);

                         sample1[count].op1=op1;
 //                        printf("op1=%d",sample1[count].op1);

                         sample1[count].op2=op2;
 //                        printf("op2=%d",sample1[count].op2);

                         sample1[count].result=result;
 //                        printf("result=%d\n\n",sample1[count].result);

    count++;
    
    if(end==count)   //end
    break;

    }
//                  sample1[count].step=-1;
//                         printf("count=%d step=%d\n",count,sample1[count].step);


    
	fclose(fptr_in);
	return end;
}


void list_Scheduling(int end)
{


     int opmult,opadd;
     int i,j,state=1,opstate=1;
     int signal=0;
     int breakpoint=1;
     
     FILE *fptr_out;
     fptr_out = fopen( "Scheduling_outcome.txt" , "w");     
     
     do{
     printf("\n input the number of constrained multiplier...");
     scanf("%d",&opmult);
     printf("\n input the number of constrained adder...");
     scanf("%d",&opadd);
     
     printf("\nnumber of multiplier: %d, number of adder: %d\n",opmult,opadd);
     signal=0;
     state=1;
     opstate=1;
     for(i=0;i<Size;i++)                                //alulist initialize 
     {
     alulist[i].add=opadd;     
     alulist[i].mult=opmult;
     }    
         
     for(i=0;i<end;i++)
     {
          signal=0;
                 
          
         if((i>0)&&(state==list1[i-1].state)&&((sample1[i].op1==sample1[i-1].result)||(sample1[i].op2==sample1[i-1].result)))
         {
                 state=state+1;
         }
         if((i>1)&&(state==list1[i-2].state)&&((sample1[i].op1==sample1[i-2].result)||(sample1[i].op2==sample1[i-2].result)))
         {
                 state=state+1;
         }
         if((i>2)&&(state==list1[i-3].state)&&((sample1[i].op1==sample1[i-3].result)||(sample1[i].op2==sample1[i-3].result)))
         {
                 state=state+1;
         }
         
         for(j=0;j<i;j++) // find the state which op1 and op2 appear last
         {
            if((sample1[j].op==1)&&((sample1[i].op1==sample1[j].result)||(sample1[i].op2==sample1[j].result)))
            {
            signal=1;
            opstate=list1[j].state;
            }
            
            if((sample1[j].op==2)&&((sample1[i].op1==sample1[j].result)||(sample1[i].op2==sample1[j].result)))
            {
            signal=1;
            opstate=list1[j].state+1;
            }
         }
         

         
         if((i>0)&&(signal==1))
         state=opstate+1;
         

         if(sample1[i].op==2)                                      // determine which state to execute this operator 
         do{
         if(alulist[state].mult==0)                                // the multiplers are sold out in this state 
         state++;
         if(alulist[state].mult>0)
         break;
         }while(1);
         
         if(sample1[i].op==1)
         do{
         if(alulist[state].add==0)
         state++;
         if(alulist[state].add>0)                               
         break;
         }while(1);

             if( sample1[i].op==2 ){
  
               list1[i].op=sample1[i].op;
               list1[i].state=state;
               list1[i].num=i;
                                              
               
               alulist[state].mult=alulist[state].mult-1;         
               alulist[state+1].mult=alulist[state+1].mult-1;
               
//               printf("*  Num=%d state=%d\n",list1[i].num,list1[i].state);
                              
              }
             else       //there are adders and need them
             {
               list1[i].op=sample1[i].op;
               list1[i].state=state;
               list1[i].num=i;
               
               
               alulist[state].add=alulist[state].add-1; 
               
//               printf("+  Num=%d state=%d\n",list1[i].num,list1[i].state);

             } 

        //    system("pause"); 
     }//for 
          for(i=0;i<end;i++)
          {
             for(j=i;j<end;j++)
             {
                if(list1[i].state>list1[j].state)
                {
                    temp.state=list1[j].state;
                    temp.op=list1[j].op;
                    temp.num=list1[j].num;
                    list1[j].state=list1[i].state;
                    list1[j].op=list1[i].op;
                    list1[j].num=list1[i].num;
                    list1[i].state=temp.state;
                    list1[i].op=temp.op;
                    list1[i].num=temp.num;
                }
             }
          }
          

    fprintf(fptr_out,"*****************************\n");
    fprintf(fptr_out,"*    Resource Constraint    *\n");
    fprintf(fptr_out,"*                           *\n");
    fprintf(fptr_out,"*     Mult Constraint:%1d     *\n",opmult);
    fprintf(fptr_out,"*     Add  Constraint:%1d     *\n",opadd);
    fprintf(fptr_out,"*                           *\n");
    fprintf(fptr_out,"*****************************\n");
    for(i=0;i<end;i++)
    {
        if(sample1[list1[i].num].op==1)
        {
               printf("State:%3d  v%3d = v%3d + v%3d  \n",list1[i].state,sample1[list1[i].num].result,sample1[list1[i].num].op1,sample1[list1[i].num].op2);
               fprintf(fptr_out,"State:%3d  v%3d = v%3d + v%3d  \n",list1[i].state,sample1[list1[i].num].result,sample1[list1[i].num].op1,sample1[list1[i].num].op2);
        }      
        else
        {
               printf("State:%3d  v%3d = v%3d * v%3d  \n",list1[i].state,sample1[list1[i].num].result,sample1[list1[i].num].op1,sample1[list1[i].num].op2);
               fprintf(fptr_out,"State:%3d  v%3d = v%3d * v%3d  \n",list1[i].state,sample1[list1[i].num].result,sample1[list1[i].num].op1,sample1[list1[i].num].op2);
        }
    }
    fprintf(fptr_out,"\n\n\n\n");     
    
    
    printf("\ncontinue?       Yes(1) No(2) ");
    scanf("%d",&breakpoint);

    printf("\n\n");
    
    }while(breakpoint==1);
    
   	fclose(fptr_out);     
          
}//list_Scheduling

     
     
     
      


int main()
{

    int end;

    end=readIn();
    

    list_Scheduling(end);



//    system("pause");
	return 0;
}
