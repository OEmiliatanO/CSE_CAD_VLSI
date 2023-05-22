#include "RGB2YUV.h"
/*
void RGB2YUV (dout_t *Y, dout_t *U, dout_t *V
			, din_t R, din_t G, din_t B) {
	*Y = 0.299*R + 0.587*G + 0.114*B;
	*U = -0.169*R - 0.331*G + 0.5*B + 128;
	*V = 0.5*R - 0.419*G -0.081*B + 128;
}*/


void RGB2YUV (dout_t *Y, dout_t *U, dout_t *V
			, din_t R, din_t G, din_t B) {
	*Y = ((66 * R + 129 * G +  25 * B + 128) >> 8) +  16;
	*U = ((-38 * R -  74 * G + 112 * B + 128) >> 8) + 128;
	*V = (( 112 * R -  94 * G -  18 * B + 128) >> 8) + 128;
}

/*
void RGB2YUV(int *r, int x, int y){
	*r = x + y;
}*/
