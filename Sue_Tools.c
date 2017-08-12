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
