/* see https://gcc.gnu.org/onlinedocs/gcc/Nested-Functions.html */
#include <stdio.h>

typedef int (*intfp)(int);
intfp add_n(int n) {
  char buf[10] = "message";
  int f(int x) {
    printf("this is my %s\n",buf);
    printf("n=%d\n",n);
    printf("x=%d\n",x);    
    return x+n;
  }
  return f;
}

int add5(int x) {
  intfp fp = add_n(5);
  return fp(x);
}

int main(int argc, char *argv[]) {
  int x = add5(6);
  printf("outer call: %d\n",x);
  return 0;
}
