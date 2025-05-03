/*
#include <stdio.h>
#include <stdlib.h>
int var1 = 42;
int var2 = -1;
int main()
{
	int A[10], i; // A = array of 10 ints, i = scalar int variable 
	int * p; // p is a scalar variable that points to an int 
	for (i = 0; i < 10; i++) {
		A[i] = i;
	}
	for(i = 0; i < 10; i++) {
		printf("Element A[%d] = %d is stored in address : %x\n", i, A[i], &A[i]);
	}
	p = & var1;
	printf("Var addresses(hex): %x %x %x # p = %x, *p = %d\n", &var1, &var2, &p, p, *p);
	printf("Var values 1: %d %d hex: %x %x\n", var1, var2, var1, var2);
	*p = 0xffff;
	printf("Var values 2: %d %d hex: %x %x\n", var1, var2, var1, var2);
	*(p+1) = 1500;
	printf("Var values 3: %d %d hex: %x %x\n", var1, var2, var1, var2);
	
	printf("Var value 4: A= %d hex: %x \n", A, A);
	printf("Var value 5: A+1= %d hex: %x \n", A+1, A+1);
	printf("Var value 6: (((int)A)+1)= %d hex: %x \n", (((int)A)+1), (((int)A)+1));
	printf("size of array %d\n", sizeof(A));
	printf("size of 1 cell %d\n", sizeof(A[1]));

	return (EXIT_SUCCESS);
}




// B
#include <stdio.h>
#include <stdlib.h>

int main() {
    char c;
    int x, y, z;
    printf ("x=%d  y=%d z=%d c=%d\n", &x, &y, &z,&c);

  return (EXIT_SUCCESS);
} 


///////////////////////

// C
#include <stdio.h>
#include <stdlib.h>

int main() {
    typedef struct {
            char x;
            int c;
            char y;
    }str1;
    typedef struct {
            char x,y;
            int c;
    }str2;
    printf("str1=%d str2=%d\n", sizeof(str1), sizeof(str2));

  return (EXIT_SUCCESS);
}

//////////////////

// D
#include <stdio.h>
#include <stdlib.h>

main(){
   char *a1, *a2, *a3, *a4;

   a1 = (char*)malloc(10);
   a2 = (char*)malloc(10);
   a3 = (char*)malloc(16);
   a4 = (char*)malloc(32);

   printf("a1= %d\n", a1);
   printf("a2= %d\n", a2);
   printf("a3= %d\n", a3);
   printf("a4= %d\n", a4);

    return (EXIT_SUCCESS);
}

//////////////////////////////
*/
// E
#include <stdio.h>
#include <stdlib.h>
int glvar;

int main(){
    
    int lvar, *malp;
    
    malp = (int*)malloc(100);
    
    printf("\n\nMain is stored in the address %d\n",&main);
	
	printf("\nThe global variable is stored in the address %d\n" ,&glvar);
    
    printf("\n\nThe local variable is stored in the address %d\n",&lvar);
	
	printf("\n\nMalloc_p is stroed in the address %d\n",malp);
    
    system("PAUSE");
    return (EXIT_SUCCESS);
}

/////////////////////////////

//







