#include <stdio.h>
CallFun(int *);

int main(){
    int a = 3;
    
    CallFun(&a);
    
    printf("%d", a);
    
    return 0;
}

CallFun(int * a){
    
    *a = 17;
    
}