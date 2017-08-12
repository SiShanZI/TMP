#include <stdio.h>
#include <math.h>
#include <string.h>

int N, MAX, limit;
char TAG, Terminator;
struct Accuracy{char o[600]; double l, r;};
struct Accuracy Improve(double left, double right);

int Sum(int a[N]);
int Gps_ec(char ec);
char Gps_dc(int dc);
double Sue_Arithmetic_EC(void);
void Sue_Arithmetic_DC(double Ciphertext);
