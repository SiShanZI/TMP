#include <stdio.h>

/* #define LOWER  0
#define UPPER  300
#define STEP   20

void main(void)
{
  float fathr, celsius;

  for(fathr = UPPER; fathr >= LOWER; fathr = fathr - STEP)
  {
    celsius = (5.0/9.0)*(fathr-32);
    printf("%3.0f%6.1f\n", fathr, (5.0/9.0)*(fathr-32));
  }
} */

#define EOF '\n'

void main()
{
  long nc;

  for(nc = 0; getchar() != EOF; nc++)
  {
    ;
  }
  printf("%ld\n", nc);
}
