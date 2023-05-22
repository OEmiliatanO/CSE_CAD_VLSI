#ifndef RGB2YUV_H_
#define RGB2YUV_H_

#define N 3

typedef int din_t;
typedef int dout_t;

void RGB2YUV (dout_t *Y, dout_t *U, dout_t *V
			, din_t R, din_t G, din_t B);
//void RGB2YUV(int *r, int x, int y);

#endif
