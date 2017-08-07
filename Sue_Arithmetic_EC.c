#include <stdio.h>

#define TAG '\n'
#define MAX 250

int main(void)
{
  int i;
  char tmp, msg[MAX];
  for(i = 0; i < MAX; i++){msg[i] = '\0';}

  for(i = 0; (tmp = getchar()) != TAG && i < MAX; i++){msg[i] = tmp;}
  printf("%s\n", msg);

  return 0;
}
