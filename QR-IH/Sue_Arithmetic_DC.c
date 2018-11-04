#include "Sue_Hdr.h"
struct Trouble{int IC; char Ciphertext[600]; int C[37]; double left, right; int id;};
struct Trouble Stream(struct Trouble Trb);
struct Trouble Split_Locate(struct Trouble, double Ciphertext);

void Sue_Arithmetic_DC(char Ciphertext[limit])
{
/*C[N] is a dynamic counter which records the number of each character(member of the character set) in your message.
  i is for the for structure.
  left, right are extreme points of the interval.
  As its name implies, tmp is temporary, msg is your message.*/
  int i;
  char tmp, msg[MAX];
  struct Trouble Trb, Trb_tmp;
/*initialization*/
  for(i = 0; i < MAX; i++){msg[i] = '\0';}
  Trb.left = 0; Trb.right = 1; for(i = 0; i < N; i++){Trb.C[i] = 1;};
  Trb.IC = 0; strcpy(Trb.Ciphertext, Ciphertext);
/*decoding*/
  for(i = 0, tmp = '\0'; i < MAX && tmp != Terminator; i++)
  {
    Trb_tmp = Stream(Trb);
    Trb.left = Trb_tmp.left, Trb.right = Trb_tmp.right;
    tmp = Gps_dc(Trb_tmp.id), Trb.C[Trb_tmp.id]++;
    Trb.IC = 0;
    msg[i] = tmp;
  }
  printf("%s\n", msg);
}

struct Trouble Stream(struct Trouble Trb)
/*use IC, Ciphertext, C, left, right to get IC, id, and interval*/
{
  int i = 0;
  double tmp_l, tmp_r;
  tmp_l = tmp_r = 0;
  struct Trouble Trb_l, Trb_r, Trb_back;
  do{i++;
    tmp_l = tmp_l + (Trb.Ciphertext[Trb.IC + i - 1] - 48)/pow(10, i);
    tmp_r = tmp_r + (Trb.Ciphertext[Trb.IC + i - 1] - 48 + 1)/pow(10, i);
    while(!(tmp_l >= Trb.left && tmp_r <= Trb.right)){i++; tmp_l = tmp_l + (Trb.Ciphertext[Trb.IC + i - 1] - 48)/pow(10, i); tmp_r = tmp_r + (Trb.Ciphertext[Trb.IC + i - 1] - 48 + 1)/pow(10, i);}
    Trb_l = Split_Locate(Trb, tmp_l); Trb_r = Split_Locate(Trb, tmp_r);
  }while(Trb_l.id != Trb_r.id);
  Trb_back.IC = i - 1;
  Trb_back.id = Trb_l.id;
  Trb_back.left = Trb_l.left;
  Trb_back.right = Trb_l.right;
  return Trb_back;
}

struct Trouble Split_Locate(struct Trouble Trb, double Ciphertext)
/*use C, left, right to get id and interval*/
{
  int i;
  double step, Intervals[N+1];
  struct Trouble Trb_back;
  step = (Trb.right - Trb.left)/Sum(Trb.C);
  for(i = 1, Intervals[0] = Trb.left, Intervals[N] = Trb.right; i < N; i++){Intervals[i] = Intervals[i-1] + Trb.C[i-1]*step;}
  for(i = 0; i < N; i++){if(Ciphertext >= Intervals[i] && Ciphertext <= Intervals[i+1]){break;}}
  Trb_back.id = i;
  Trb_back.left = Intervals[i];
  Trb_back.right = Intervals[i+1];
  return Trb_back;
}
