#include <stdio.h>
#include <string.h>

void main(void)
{
  char a[4] = "12";
  char b[3] = "r";
  strcat(a, b);
  printf("%s\n", a);
}
