#include "Sue_Hdr.h"
struct AI{int id; double l, r;};
struct AI Split_Locate(double left, double right, int C[N], double Ciphertext);

void Sue_Arithmetic_DC(char Ciphertext[limit])
{
/*C[N] is a dynamic counter which records the number of each character(member of the character set) in your message.
  i is for the for structure.
  left, right are extreme points of the interval.
  As its name implies, tmp is temporary, msg is your message.*/
  int i, C[N];
  double left, right;
  char tmp, msg[MAX];
  struct AI AI;
/*initialization*/
  for(i = 0; i < MAX; i++){msg[i] = '\0';}
  for(i = 0; i < N; i++){C[i] = 1;}
/*decoding*/
  for(i = 0, left = 0, right = 1; i < MAX && tmp != Terminator; i++)
  {
    AI = Split_Locate(left, right, C, Ciphertext);
    left = AI.l, right = AI.r;
    tmp = Gps_dc(AI.id), C[AI.id]++;
    msg[i] = tmp;
  }
  printf("%s\n", msg);
}

double Stream(double left, double right, int C[N], char Ci[limit])
{
  double step, Intervals[N+1];
  step = (right - left)/Sum(C);
  for(i = 1, Intervals[0] = left, Intervals[N] = right; i < N; i++){Intervals[i] = Intervals[i-1] + C[i-1]*step;}
}

struct AI Split_Locate(double left, double right, int C[N], double Ciphertext)
{
  int i;
  double step, Intervals[N+1];
  struct AI AI;
  step = (right - left)/Sum(C);
  for(i = 1, Intervals[0] = left, Intervals[N] = right; i < N; i++){Intervals[i] = Intervals[i-1] + C[i-1]*step;}
  for(i = 0; i < N; i++){if(Ciphertext >= Intervals[i] && Ciphertext <= Intervals[i+1]){break;}}
  AI.id = i;
  AI.l = Intervals[i];
  AI.r = Intervals[i+1];
  return AI;
}
