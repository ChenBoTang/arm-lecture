#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  clock_t start_time, finish_time;
  float elapsed_time = 0;
  
  result = scanf("%d",&number);

  start_time = clock();
  result = fibonacci(number);   
  finish_time = clock();
  elapsed_time = ( finish_time - start_time );

  printf( "The fibonacci sequence at %d is: %d elapsed time: %5.6f sec\n", number, result, elapsed_time / CLOCKS_PER_SEC );

  return 0;
}
 
