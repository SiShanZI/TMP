#include "Sue_Hdr.h"
int sum(int a[N])
{
  int i, S;
  for(i = 0, S = 0; i < N; i++){S = S + a[i];}
  return S;
}
