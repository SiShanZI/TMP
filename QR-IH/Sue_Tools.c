#include "Sue_Hdr.h"

int Sum(int a[N])
{
  int i, S;
  for(i = 0, S = 0; i < N; i++){S = S + a[i];}
  return S;
}

struct Accuracy Improve(double left, double right)
{
  int i;
  struct Accuracy acc;
  for(i = 0; i < limit; i++){acc.o[i] = '\0';}
  i = 0;
  while((int)(left*10) == (int)(right*10))
  {
    acc.o[i] = (int)(left*10) + 48; i++;
    left = left*10 - (int)(left*10); right = right*10 - (int)(right*10);
  }
  acc.l = left; acc.r = right;
  return acc;
}

struct Array Tail(double left, double right)
{
  int i, j;
  double tmp, Mid = (left + right)/2;
  struct Array Ac_tmp;
  for(i = 0; i < limit; i++){Ac_tmp.Ac[i] = '\0';}
  for(i = 1; i < limit; i++)
  {
    tmp = ((int)(Mid*pow(10.0, i)))/pow(10.0, i);
    if(tmp > left){break;}
  }
  for(j = 0; j < i; j++)
  {
    Ac_tmp.Ac[j] = (int)(Mid*10) + 48;
    Mid = Mid*10 - (int)(Mid*10);
  }
  return Ac_tmp;
}
