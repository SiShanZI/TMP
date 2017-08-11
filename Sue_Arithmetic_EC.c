#include <stdio.h>
#include "Sue_Hdr.h"

double Sue_Arithmetic_EC(void)
{
/*C[N] is a dynamic counter which records the number of each character(member of the character set) in your message.
  i, j & k are for the for structure.
  left, right are extreme points of the interval, and step is (right - left)/Sum(C[N]).
  As its name implies, tmp is temporary, msg is your message.*/
  int i, j, k, C[N];
  double left, right, step;
  char tmp, msg[MAX];
/*input your message*/
  for(i = 0; i < MAX; i++){msg[i] = '\0';} /*initialization*/
  for(i = 0; i < MAX && (tmp = getchar()) != TAG; i++){msg[i] = tmp;}
/*interval*/
  for(i = 0; i < N; i++){C[i] = 1;} /*initialization*/
  for(i = 0, left = 0, right = 1; msg[i] != '\0'; i++, C[j]++)
  {
    j = Gps_ec(msg[i]);
    step = (right - left)/Sum(C);
    for(k = 0; k < j; k++){left = left + C[k]*step;}
    right = left + C[j]*step;
  }
  return (left + right)/2;
}
