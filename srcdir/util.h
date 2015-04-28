#include <math.h>
#if INTEL
#include "immintrin.h"
#include "emmintrin.h"
#include "smmintrin.h"
#endif
/////////////////////////////////////////////
// NR Div using Macro + intrinsics 
#define a0 1.0000000000000002
#define a1 9.9999999999992204e-1
#define a2 5.0000000000470407e-1 
#define a3 1.6666666655683517e-1
#define a4 4.1666667972995034e-2
#define a5 8.3333243238266834e-3 
#define a6 1.3889273989128108e-3
#define a7 1.9830766718527367e-4
#define a8 2.4984065458054751e-5 
#define a9 2.5615650803565837e-6
#define a10 3.8874526912789884e-7


#if EXTMATH
	#if INTEL
		#define NRMACROc(D, X0) (X0 * (2. - D * X0))
		#define DIVMACROc(N, D) (N * NRMACROc(D, NRMACROc(D, NRMACROc(D, (1.f / (float)D)))))

		#define NRMACRO(D, X0) _mm256_mul_pd(X0, _mm256_sub_pd(_mm256_set1_pd(2.), _mm256_mul_pd(D, X0)))
		#define DIVMACRO(N, D) _mm256_mul_pd(N, NRMACRO(D, NRMACRO(D, NRMACRO(D, _mm256_cvtps_pd(_mm_rcp_ps(_mm256_cvtpd_ps(D))))))) 

		__inline double DIVc (double N, double D);

		/////////////////////////////////////////////


		#define EXPMACRO( x ) (((((((((((a10*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a9)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a8)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a7)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a6)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a5)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a4)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a3)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a2)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a1)*(x - floor(1.4426950408889634 * x) * (0.6931471805599453))+a0) * (*(double *)(&((1023+((long long int)(floor(1.4426950408889634 * x)))) << (52)))))  

		__inline double EXPc (double x);
		__inline __m256d EXPi (__m256d x);
	#else


		#define NRMACROc(D, X0) (X0 * (2. - D * X0))
		#define DIVMACROc(N, D) (N * NRMACROc(D, NRMACROc(D, (1./D))))

	#endif
#endif
// Assumes little endian Print bits of any number
// void printBits(size_t const size, void const * const ptr);