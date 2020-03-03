#include <stdio.h>

int var_a = 0x1234;
int var_b = 0x2222;

int var_c = 0x3333;

int main()
{
  var_c = var_a + var_b;

  printf("sum %d + %d -> %d\n", var_a, var_b, var_c);

  printf("sum 0x%x + 0x%x -> 0x%x\n", var_a, var_b, var_c);

  // unsigned int d = var_a + var_b + var_c;
  unsigned int d = 8;

  int mask = 1 << 31;

  for (int i = 0; i < 32; i++) {
    if (mask & d) {
      printf("1");
    } else {
      printf("0");
    }
    d <<= 1;
  }

  /* dumb
  char bin[100];
  int bin_len = 0;
  
  while (d > 0) {
    if (d % 2 == 0) {
      // printf("0");
      bin[bin_len] = 0;
    } else {
      // printf("1");
      bin[bin_len] = 1;
    }

    bin_len++;
    d = d >> 1;
  }
  printf("\n");

  int i;
  for (i = bin_len-1; i > -1; i--) {
    printf("%d", bin[i]);
  }
  */
  printf("\n");
  

  return 0;
}
