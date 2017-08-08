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
