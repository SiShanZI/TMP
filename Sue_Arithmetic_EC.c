#include <stdio.h>
#include "Sue_Hdr.h"

void Sue_Arithmetic_EC(void)
{
/* Variable declaration */
  int i, j, k, C[N];
  double left, right, step;
  char tmp, msg[MAX];
/* Initialization */
  left = 0, right = 1;
  for(i = 0; i < N; i++){C[i] = 1;}
  for(i = 0; i < MAX; i++){msg[i] = '\0';}

  for(i = 0; i < MAX && (tmp = getchar()) != TAG; i++)
  {
    msg[i] = tmp;
  }
  for(i = 0, j = 0; msg[i] != '\0'; i++, C[j]++)
  {
    if(msg[i] >= 'A' && msg[i] <= 'Z'){j = msg[i] - 'A';}
    else if(msg[i] >= '0' && msg[i] <= '9'){j = msg[i] - '0' + 26;}
    else{;}
    step = (right - left)/sum(C);
    for(k = 0; k < j; k++)
    {
      left = left + C[k]*step;
    }
    right = left + C[j]*step;
  }
  printf("%f\n%f\n", left, right);
}
