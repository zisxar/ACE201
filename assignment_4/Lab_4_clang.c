#include <stdio.h>
#include <stdlib.h>
int R0=0;
int R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31;
void UPPERCASE(char *a);
void Title_Case(char *a);

main(){
       int i;
       char string[80];
       int choice;
       R2=1;
       R3=3;
       R4=2;
       printf("Please enter a string (80 characters max):\n");
       scanf("%d",&choice);

       
       printf("MENU\n1.Convert string to UPPERCASE. \n2.Convert string to Title Case. \n3.Exit.\nChoose from the above menu: \n");
       scanf("%d",&choice);
       R1=choice;
       while_label_1: 
                   if(R1==R3)goto end_while_1;                
                    while_label_2:
                                  if(R1>=R2)goto second_if;
                                   goto code;     
                                   second_if:
                                  if(R1<=R3)goto end_if_1;
                                   code:
                                   printf("Wrong choice!\nChoose from the above menu: \n");
                                   scanf("%d",&choice);
                                   R1=choice;
                                   goto while_label_2;
                                  end_if_1:
                    end_while_2:
                                              
                                  if(R1!=R2)goto else_label;
                                   UPPERCASE(string);
                                   printf("%s\n",string);
                                   goto end_if_2;
                                  else_label:
                                  if(R1!=R4)goto end_if_2;
                                   Title_Case(string);
                                   printf("%s\n",string);
                                  end_if_2:
                                           
                                  if(R1==R3)goto end_while_1;
                                   printf("Please enter a string (80 characters max):\n");
                                   scanf("%d",&choice);
                                   printf("Choose from the above menu: \n");
                                   scanf("%d",&choice);
                                   R1=choice;     
                 goto while_label_1;                             
       end_while_1:
         return ("EXIT_SUCCESS");        
}

void UPPERCASE(char *a)
{
     int i=R0,k=R0;
     R5=i;
     R6=k;
     while_label_3:
                 if(a[R6]=='\0')goto end_while_3;
                       R6=R6+1;
                       k=R6;
                       R5=R5+1;
                       i=R5;
                       goto while_label_3;
     end_while_3:

     i=R0;
     R5=i;
     while_label_4:
                   if(R5>=R6)goto end_while_4;
                   if(a[R5]<97)goto end_if_3;
                    if(a[R5]>122)goto end_if_3;
                     a[R5]=a[R5]-32;
                    end_if_3:
                    R5=R5+1;
                    goto while_label_4;
     end_while_4:
     R5=0;
     R6=0;                        
}

void Title_Case(char *a)
{
     int i=R0,k=R0;
     R5=i;
     R6=k;
     while_label_5:
                 if(a[R6]=='\0')goto end_while_5;
                       R6=R6+1;
                       k=R6;
                       R5=R5+1;
                       i=R5;
                       goto while_label_5;
     end_while_5:
     
     i=R0;
     R5=i;
     if(a[R5]<97)goto end_if_4;
      if(a[R5]>122)goto end_if_4;
      a[R5]=a[R5]-32;
     end_if_4:
     R5=R5+1;
     while_label_6:
                   if(R5>=R6)goto end_while_6;
                   R7=R5-1;
                    if(a[R7]>=65)goto else_if_5;
                     goto code1;
                     else_if_5:
                      if(a[R7]<91)goto else_if_6;
                       if(a[R7]>96)goto else_if_6;
                       goto code1;
                      else_if_6:
                       if(a[R7]<=122)goto else_if_7;
                       code1:
                       if(a[R5]<97)goto end_if_6;
                        if(a[R5]>122)goto end_if_6;
                             a[R5]=a[R5]-32;
                        goto end_if_6;
                     else_if_7:
                       if(a[R5]<65)goto end_if_6;
                        if(a[R5]>90)goto end_if_6;
                             a[R5]=a[R5]+32;
                     end_if_6:      
                     
                     R5=R5+1;
                     goto while_label_6;       
     end_while_6:
     R5=0;
     R6=0; 
}
