#include "lib1.h"
#include "lib2.h"
#include <stdio.h>

#define A 6
#define B -1

int main (int argc, char* argv[]) {
    int (*f)(int,int) = sum; 
    int x = f(A,B);
    printf("Result = %d\n",x);
    }