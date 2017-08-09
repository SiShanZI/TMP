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

#include <stdio.h>
#include <string.h>
#include <math.h> /*gcc -lm*/
#include <ctype.h> /*isdigit, isspace*/

#define TAG '\n'
#define MAX 250

int main(void)
{
  int i;
  char tmp, msg[MAX];
  for(i = 0; i < MAX; i++){msg[i] = '\0';}

  for(i = 0; i < MAX && (tmp = getchar()) != TAG; i++){msg[i] = tmp;}
  printf("%s\n%lu\n%f\n", msg, strlen(msg), sin((double)strlen(msg)));

  return 0;
}
