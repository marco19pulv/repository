#include <stdio.h>

int main(int argc, char* args[]) {
    if (argc!=2) {
        printf("Inserire un parametro per l'esecuzione!\n"); 
        return 1; }
    int x = args[0][0];
    x++;
    printf("%d\n",x); }