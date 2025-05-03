#include<stdio.h>
#include<stdlib.h>
int R0=0;
int R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;
int a( int a,int b);
main(){
       int x,y,z;
       R1=x;
       R2=y;
       R3=z;
       R1=R0;
       R2=100;
       R3=-17;
       R1=a(R2,R3);
       printf("x=%d,x=0x%x\n",R1,R1);
       x=R1;y=R2;z=R3;
       system("pause");
       }
int a(int a,int b){
    int cnt=0;
    R4=a;
    R5=b;
    R6=0;
    while_label:
                if(R4<=R5)goto end_while;
                 if(R5>=R0)goto else_label;
                  R5=R5+5;
				  b=R5;
                 goto end_if;
                 else_label:
                            R5=R5+10;
							b=R5;
                 end_if:
                  R6=R6+1;
				  cnt=R6;
                  printf("a=%d,b=%d,cnt=%d\n",R4,R5,R6);
				  goto while_label;
                 end_while:
     a=R4;
   return R6;                      
}