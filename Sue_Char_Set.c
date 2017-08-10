/* The character set: {A~Z, 0~9} */
int N = 36;
int MAX = 300;
char TAG = '\n';

int Gps(char c)
{
  int j = 0;
  if(c >= 'A' && c <= 'Z'){j = c - 'A';}
  else if(c >= '0' && c <= '9'){j = c - '0' + 26;}
  else{;}
  return j;
}
