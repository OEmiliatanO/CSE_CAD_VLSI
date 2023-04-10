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


    printf("\n欲選擇圖1，請輸入 p1.txt \n欲選擇圖2，請輸入 p2.txt\n");    
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
    
    if(end==count)   //終止用 
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
     printf("\n 輸入限制的乘法器個數...");
     scanf("%d",&opmult);
     printf("\n 輸入限制的加法器個數...");
     scanf("%d",&opadd);
     
     printf("\n乘法器個數：%d,加法器個數：%d\n",opmult,opadd);
     signal=0;
     state=1;
     opstate=1;
     for(i=0;i<Size;i++)                                //alulist 初始化 
     {
     alulist[i].add=opadd;     
     alulist[i].mult=opmult;
     }    
         
     for(i=0;i<end;i++)
     {
          signal=0;
                 
          
         if((i>0)&&(state==list1[i-1].state)&&((sample1[i].op1==sample1[i-1].result)||(sample1[i].op2==sample1[i-1].result)))
         {
                 state=state+1;                             //如果前面一個state的result 跟現在的op1 op2重複 就直接跳到下一個state 
         }
         if((i>1)&&(state==list1[i-2].state)&&((sample1[i].op1==sample1[i-2].result)||(sample1[i].op2==sample1[i-2].result)))
         {
                 state=state+1;                             //如果前面兩個state的result 跟現在的op1 op2重複 就直接跳到下一個state
         }
         if((i>2)&&(state==list1[i-3].state)&&((sample1[i].op1==sample1[i-3].result)||(sample1[i].op2==sample1[i-3].result)))
         {
                 state=state+1;                             //如果前面兩個state的result 跟現在的op1 op2重複 就直接跳到下一個state
         }
         
         for(j=0;j<i;j++)                                  //尋找op1 跟 op2 最後出現的state 
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
         

         
         if((i>0)&&(signal==1))                                      //state改為result最後出現後的下一筆 
         state=opstate+1;
         

         if(sample1[i].op==2)                                      //決定此運算要在哪一個state執行 
         do{
         if(alulist[state].mult==0)                                //此state乘法器已經用完 找下一個  
         state++;
         if(alulist[state].mult>0)
         break;
         }while(1);
         
         if(sample1[i].op==1)                                     //決定此運算要在哪一個state執行 
         do{
         if(alulist[state].add==0)                                //此state加法器已經用完 找下一個 
         state++;
         if(alulist[state].add>0)                               
         break;
         }while(1);

             if( sample1[i].op==2 ){
  
               list1[i].op=sample1[i].op;                        //把乘法器 或加法器 儲存起來 
               list1[i].state=state;                             //紀錄它的state 
               list1[i].num=i;                                   //紀錄它的運算編號 
                                              
               
               alulist[state].mult=alulist[state].mult-1;         
               alulist[state+1].mult=alulist[state+1].mult-1;
               
//               printf("*  Num=%d state=%d\n",list1[i].num,list1[i].state);
                              
              }
             else       //如果加法器還沒用完 且裡面需要加法運算
             {
               list1[i].op=sample1[i].op;                        //把乘法器 或加法器 儲存起來 
               list1[i].state=state;                             //紀錄它的state 
               list1[i].num=i;                                   //紀錄它的運算編號 
               
               
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
    
    
    printf("\n繼續使用       Yes(輸入1) No(輸入2) ");
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
