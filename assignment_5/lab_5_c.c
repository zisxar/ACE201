#include <stdio.h>
#include <stdlib.h>

int ackermann(int x, int y);

main(){
       int a,b,result;
       int choice;
       printf("1.Run\n");
       printf("2.Exit\n");
       printf("Give choice: \n");
       scanf("%d",&choice);
                           while(choice<1||choice>2){
                                                     printf("Wrong choice choose again!\n");                         
                                                     scanf("%d",&choice);
                                                     }
                           
                           while(choice!=2){
                                            printf("Give first numbers: \n");
                                            scanf("%d",&a);
                                            printf("Give second numbers: \n");
                                            scanf("%d",&b);
                                            while(a<0||b<0){
                                                            printf("Wrong number!\n");
                                                            printf("Give first numbers: \n");
                                                            scanf("%d",&a);
                                                            printf("Give second numbers: \n");
                                                            scanf("%d",&b);              
                                            }
                                            
                                            result=ackermann(a,b);
                                            printf("result=%d\n",result);
       
                                             printf("1.Run\n");
                                             printf("2.Exit\n");
                                             printf("Give choice: \n");
                                             scanf("%d",&choice);
                                             while(choice<1||choice>2){
                                                                       printf("Wrong choice choose again!\n");                         
                                                                       scanf("%d",&choice);
                                                                       }
                                             }
       }

int ackermann(int x, int y)
{
 if ( x == 0 ) 
    {
    return y+1;
    } 
    else
    {
     if ( y == 0 )
     {
     return ackermann(x-1, 1);
     } 
     else 
     {
     return ackermann(x-1, ackermann(x, y-1));
     }
    }
}