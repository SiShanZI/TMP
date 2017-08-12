#include <stdio.h>
#include <math.h>
#include <string.h>

int N, MAX, limit;
char TAG, Terminator;
struct Array{char Ac[600];};
struct Accuracy{char o[600]; double l, r;};

int Sum(int a[N]);
int Gps_ec(char ec);
char Gps_dc(int dc);
struct Array Sue_Arithmetic_EC(void);
void Sue_Arithmetic_DC(char Ciphertext[limit]);
struct Accuracy Improve(double left, double right);
struct Array Tail(double left, double right);
