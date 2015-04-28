#include "util.h"

/////////////////////////////////////////////
#if EXTMATH
#if INTEL

	// NR Div using C code and inline

	__inline double NRc (double D, double X0){
	    return (X0 * (2. - D * X0));
	}

	__inline double DIVc (double N, double D){
	    double X0 = 1.f / (float)D;
	    return (N * NRc(D, NRc(D, NRc(D, X0))));
	}

	// NR Div using intrinsics and inline

	__inline __m256d NRi (__m256d D, __m256d X0){
	    return _mm256_mul_pd(X0, _mm256_sub_pd(_mm256_set1_pd(2.), _mm256_mul_pd(D, X0))) ;
	}

	__inline __m256d DIVi (__m256d N, __m256d D){
	    return _mm256_mul_pd(N, NRi(D, NRi(D, NRi(D, _mm256_cvtps_pd(_mm_rcp_ps(_mm256_cvtpd_ps(D)))))));
	}

/////////////////////////////////////////////

	// Exp using c

	__inline double EXPc (double x){
	    // double y; //, twok, remez, ;
	    // long long int k, kAsADB;

	    // // k = x * (1/ln(2))                     
	    // // k is approx to the smaller int value                                    
	    // k = (long long int)(1.4426950408889634 * x);
	    // // Shift k bits 52 positions to set in exponent
	    // kAsADB = ((1023+k) << (52));
	    
	    // // Find y = x - k * ln(2)    
	    // y = (x - (double)k * (0.6931471805599453));
	    
	    // // Calc. Honer's approx.  
	    // // remez = ((((((((((a10*y+a9)*y+a8)*y+a7)*y+a6)*y+a5)*y+a4)*y+a3)*y+a2)*y+a1)*y+a0);
	    // // Convert k to (treat k as) double
	    // // twok = *(double *)(&k);

	    // return ((((((((((a10*y+a9)*y+a8)*y+a7)*y+a6)*y+a5)*y+a4)*y+a3)*y+a2)*y+a1)*y+a0) * (*(double *)(&kAsADB)); 

	    long long int twok = ((1023+((long long int)(1.4426950408889634 * x))) << (52));
	    return ((((((((((a10*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a9)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a8)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a7)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a6)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a5)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a4)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a3)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a2)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a1)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a0) * (*(double *)(&twok));   
	 
	}

	__inline __m256d EXPi (__m256d x){

	    // kAsADB = 1.4426950408889634 * x;                         
	    // kAsADB = floor(kAsADB);                                      
	    __m256d k256d    = _mm256_floor_pd(_mm256_mul_pd(x, _mm256_set1_pd(1.4426950408889634)));

	    // k = (long long int)kAsADB;
	    // k = ((1023+k) << (52));
	    __m128i k128i 	 = _mm_slli_epi32(_mm_add_epi32(_mm256_cvtpd_epi32(k256d), _mm_set1_epi32(1023)),20);
	    __m128i k128i64L = _mm_slli_epi64(k128i,32);
	    __m128i k128i64H = _mm_slli_epi64(_mm_shuffle_epi32(k128i, _MM_SHUFFLE(2, 3, 0, 1)),32);
	    __m256i k256i = _mm256_set_epi64x(_mm_extract_epi64(k128i64H,1), _mm_extract_epi64(k128i64L,1), _mm_extract_epi64(k128i64H,0), _mm_extract_epi64(k128i64L,0));

	    // twok = *(double *)(&k);
	    __m256d twok = _mm256_castsi256_pd(k256i);

	    // y = x - kAsADB * (0.6931471805599453);
	    __m256d y = _mm256_sub_pd(x, _mm256_mul_pd(k256d, _mm256_set1_pd(0.6931471805599453)));

	    // remez = ((((((((((a10*y+a9)*y+a8)*y+a7)*y+a6)*y+a5)*y+a4)*y+a3)*y+a2)*y+a1)*y+a0);
	    __m256d remez = 	_mm256_add_pd(_mm256_set1_pd(a0),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a1),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a2),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a3),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a4),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a5),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a6),
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a7), 
							_mm256_mul_pd(y,
							_mm256_add_pd(_mm256_set1_pd(a8), 
							_mm256_mul_pd(y,
							_mm256_add_pd(
							_mm256_mul_pd(_mm256_set1_pd(a10), y), _mm256_set1_pd(a9)
							))))))))))))))))))); 

	    return _mm256_mul_pd(remez, twok);
	}

#else

#endif
#endif

/////////////////////////////////////////////
// Assumes little endian Print bits of any number
// void printBits(size_t const size, void const * const ptr)
// {
//     unsigned char *b = (unsigned char*) ptr;
//     unsigned char byte;
//     int i, j;

//     for (i=size-1;i>=0;i--)
//     {
//         for (j=7;j>=0;j--)
//         {
//             byte = b[i] & (1<<j);
//             byte >>= j;
//             printf("%u", byte);
//         }
//     }
//     puts("");
// }
/////////////////////////////////////////////