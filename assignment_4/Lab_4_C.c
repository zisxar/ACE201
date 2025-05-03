#include <stdio.h>
#include <stdlib.h>

void UPPERCASE(char *a);
void Title_Case(char *a);
     
int main()
{
       int i;
       char string[80];
       int choice;
       
       printf("Please enter a string (80 characters max):\n");
       scanf("%s",string);

       printf("MENU\n1.Convert string to UPPERCASE. \n2.Convert string to Title Case. \n3.Exit.\nChoose from the above menu: \n");
       scanf("%d",&choice);
                               
       while(choice!=3){
                         while(choice<1||choice>3)
                         {                       
                         printf("Wrong choice!\nChoose from the above menu: \n");
                         scanf("%d",&choice);
                         }
                         if(choice==1)
                         {
                          UPPERCASE(string);
                          printf("%s\n",string);
                         }
                         else if(choice==2)
                         {
                          Title_Case(string);
                          printf("%s\n",string);
                         }
                         if(choice!=3)
                         {
                          printf("Please enter a string (80 characters max):\n");       
                          scanf("%s",string);
                          printf("Choose from the above menu: \n");
                          scanf("%d",&choice);
                         }
                       }
       return ("EXIT_SUCCESS");
}


void UPPERCASE(char *a)
{
     int i=0,k=0;
     
     while(a[i]!='\0'){
                       k++;
                       i++;
                       }

     i=0;
     while(i<k){
                if(a[i]>=97&&a[i]<=122)
                {
                 a[i]=a[i]-32;
                 }
                 i++;
                }    
                 
}

void Title_Case(char *a)
{
     int i=0,k=0;
     
     while(a[i]!='\0'){
                       k++;
                       i++;
                       }
     
     i=0;
     if(a[i]>=97&&a[i]<=122)
                {
                 a[i]=a[i]-32;
                 }
                i++;
     while(i<k){
                if(a[i-1]<65||(a[i-1]>=91&&a[i-1]<=96)||a[i-1]>122)
                {
                           if(a[i]>=97&&a[i]<=122)
                           {
                           a[i]=a[i]-32;
                           }   
                }
                else{
                      if(a[i]>=65&&a[i]<=90)
                           {
                           a[i]=a[i]+32;
                           } 
                     }
     
                
                i++;
               }
}   
                 

     
