#include <stdio.h>
#include <stdlib.h>

int R0=0;
int R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;

int ackermann(int x, int y);

main()
{
      int a,b,result;
      int choice;
      printf("1.Run\n");
      printf("2.Exit\n");
      printf("Give choice: \n");
      scanf("%d",&R1);
      choice=R1;
      while_label:
                   R5=(R1>=1)&&(R1<=2);
                   if(R5)goto end_while;       
                   printf("Wrong choice choose again!\n");                         
                   scanf("%d",&R1);
				   choice=R1;
                   goto while_label;
      end_while:
                
      while_label_1:
                   if(R1==2)goto end_while_1;
                    printf("Give first numbers: \n");
                    scanf("%d",&a);
                    R2=a;
                    printf("Give second numbers: \n");
                    scanf("%d",&b);
                    R3=b;
                    while_label_2:
                      R4=(R2>=0)&&(R3>=0);
                      if(R4)goto end_while_2;
                      printf("Wrong number!\n");
                      printf("Give first numbers: \n");
                      scanf("%d",&a);
                      R2=a;
                      printf("Give second numbers: \n");
                      scanf("%d",&b);
                      R3=b;
                      goto while_label_2;
                    end_while_2:
                                
                    R6=ackermann(R2,R3);
                    result=R6;
                    printf("result=%d\n",result);
       
                    printf("1.Run\n");
                    printf("2.Exit\n");
                    printf("Give choice: \n");
                    scanf("%d",&R1);
					choice=R1;
                    
                    while_label_3:
                            R5=(R1>=1)&&(R1<=2);
                             if(R5)goto end_while_3;      
                              printf("Wrong choice choose again!\n");                         
                              scanf("%d",&R1);
							  choice=R1;
                              goto while_label_3;
                    end_while_3:
        goto while_label_1;
       end_while_1:
       system("PAUSE");
}

int ackermann (int x, int y) {
 R7=x;
 R8=y;
 if (R7!=R0) goto else_if_label;
  return R8+1;
 
 else_if_label:
 if (R8!=0) goto else_label;
  x=R7;
  y=R8;
  R9=ackermann(R7-1,1);
  R7=x;
  R8=y;
  return R9;
 else_label:
  x=R7;
  y=R8;
  R9=ackermann(R7,R8-1);
  R7=x;
  R8=y;
  x=R7;
  y=R8;
  R10=ackermann(R7-1,R9);
  R7=x;
  R8=y;
  
  return R10;
}












