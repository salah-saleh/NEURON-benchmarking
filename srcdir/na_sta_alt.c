// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"
#include "util.h"
#if INTEL
#else
#include <massv.h>
#include <mass_simd.h>
#endif

#if EXTMATH
#if INTEL
__inline __m256d EXPi_smp (__m256d x){

    // kAsADB = 1.4426950408889634 * x;                         
    // kAsADB = floor(kAsADB);                                      
    __m256d k256d    = _mm256_floor_pd(_mm256_mul_pd(x, _mm256_set1_pd(1.4426950408889634)));

    // k = (long long int)kAsADB;
    // k = ((1023+k) << (52));
    __m128i k128i    = _mm_slli_epi32(_mm_add_epi32(_mm256_cvtpd_epi32(k256d), _mm_set1_epi32(1023)),20);
    __m128i k128i64L = _mm_slli_epi64(k128i,32);
    __m128i k128i64H = _mm_slli_epi64(_mm_shuffle_epi32(k128i, _MM_SHUFFLE(2, 3, 0, 1)),32);
    __m256i k256i    = _mm256_set_epi64x(_mm_extract_epi64(k128i64H,1), _mm_extract_epi64(k128i64L,1), _mm_extract_epi64(k128i64H,0), _mm_extract_epi64(k128i64L,0));

    // twok = *(double *)(&k);
    __m256d twok = _mm256_castsi256_pd(k256i);

    // y = x - kAsADB * (0.6931471805599453);
    __m256d y = _mm256_sub_pd(x, _mm256_mul_pd(k256d, _mm256_set1_pd(0.6931471805599453)));

    // remez = ((((((((((a10*y+a9)*y+a8)*y+a7)*y+a6)*y+a5)*y+a4)*y+a3)*y+a2)*y+a1)*y+a0);
    __m256d remez = _mm256_add_pd(_mm256_set1_pd(a0),
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a1),                        
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a2),                        
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a3),
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a4),                        
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a5),                        
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a6),                        
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a7),                         
                            _mm256_mul_pd(y, _mm256_add_pd(_mm256_set1_pd(a8),                         
                            _mm256_mul_pd(y, _mm256_add_pd(                        
                            _mm256_mul_pd(_mm256_set1_pd(a10), y), _mm256_set1_pd(a9) ))))))))))))))))))); 

    return _mm256_mul_pd(remez, twok);
}
#else
__inline vector4double EXPi_smp (vector4double x){

    // long long int n;
    
    // n = vec_extract(x,0);
    // double d = (double)((n+1023)<<52); //(long long int)
    // x = vec_insert(d,x,0);
    // n = vec_extract(x,1);
    //  d = (double)((n+1023)<<52); //(long long int)
    // x = vec_insert(d,x,1);
    // n = vec_extract(x,2);
    //  d = (double)((n+1023)<<52); //(long long int)
    // x = vec_insert(d,x,2);
    // n = vec_extract(x,3);
    //  d = (double)((n+1023)<<52); //(long long int)
    // x = vec_insert(d,x,3);        
        
    // double tmp0[4], tmp1[4]; int n=4;
    // vec_st(x,0,&tmp0[0]);
    // vexp (tmp1, tmp0, &n);
    // x=vec_ld(0,&tmp1[0]);
    return x;
}

__inline vector4double NRMACROB(vector4double D, vector4double X0) {return vec_mul(X0,vec_madd(D,X0,vec_splats(2.)));}
__inline vector4double DIVMACROB(vector4double N, vector4double D) {return vec_splats(1.);}// vec_mul(N , NRMACROB(D, NRMACROB(D, vec_re(D))));}
// #define DIVMACROB(N, D) vec_mul(N,vec_re(D))
#endif
#endif
/////////////////////////////////////////////
double NA_STA_ALT(double * restrict C_mAlpha, double * restrict C_mBeta,
    double * restrict C_mTau, double * restrict C_mInf, double * restrict C_hAlpha, 
    double * restrict C_hBeta, double * restrict C_hTau, double * restrict C_hInf, 
    double * restrict C_m, double * restrict C_h, double * restrict C_v, int n){
    
    #if INTEL
    #else
    __alignx(64, C_mAlpha);
    __alignx(64, C_mBeta);
    __alignx(64, C_mTau);
    __alignx(64, C_mInf);
    __alignx(64, C_hAlpha);
    __alignx(64, C_hBeta);
    __alignx(64, C_hTau);
    __alignx(64, C_hInf);
    __alignx(64, C_m);
    __alignx(64, C_h);
    __alignx(64, C_v);
    #endif
    
    int i, j;

    #if INTEL
    __m256d tmp0, tmp1, tmp2, tmp3;
    #else
    double tmp0[4], tmp1[4], tmp2[4], tmp3[4];
    #endif

    #if OMP
    #pragma omp parallel private(tmp0, tmp1, tmp2, tmp3, i)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("NA_STA_ALT");
    #endif
    
    #pragma ibm independent_loop
    #pragma simd_level(10)
    // #pragma stream_unroll(4)


    #if IACA 
    IACA_START
    #endif

    #if OMP
    #pragma omp for
    #endif

    #pragma vector aligned
    // #pragma unroll(4)
    for (i=0; i<n;i+=4){

        // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(DIVMACRO(_mm256_set1_pd(1.0), _mm256_set1_pd(i)), _mm256_load_pd(&C_mBeta[0])) );
        // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(_mm256_div_pd(_mm256_set1_pd(1.0), _mm256_set1_pd(i)), _mm256_load_pd(&C_mBeta[0])) );

        // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(_mm256_exp_pd( _mm256_load_pd(&C_mAlpha[i])), _mm256_load_pd(&C_mBeta[0])) );
        // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(EXPi_smp( _mm256_load_pd(&C_mAlpha[i])), _mm256_load_pd(&C_mBeta[0])) );
        #if EXTMATH 
            #if INTEL

                // tmp0        = C_v[i] + 35.0;
                _mm256_store_pd(&tmp0        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(35.0)));
                // tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
                _mm256_store_pd(&tmp1        , EXPi_smp(_mm256_mul_pd(tmp0 , _mm256_set1_pd(0.1111111111111))));
                // C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
                _mm256_store_pd(&C_mAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.128) , _mm256_mul_pd( tmp0 , DIVMACRO(tmp1 , _mm256_sub_pd(tmp1 , _mm256_set1_pd(1.))))));
                // C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
                _mm256_store_pd(&C_mBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.124) , DIVMACRO(tmp0 , _mm256_sub_pd(_mm256_set1_pd(1.) , tmp1))));
                // C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
                _mm256_store_pd(&C_mTau[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mBeta[i]))));
                // C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
                _mm256_store_pd(&C_mInf[i]   , _mm256_mul_pd( _mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mTau[i])));
          
                // tmp2        = C_v[i] + 50.;
                _mm256_store_pd(&tmp2        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(50.)));
                // tmp3        = C_v[i] + 75.;
                _mm256_store_pd(&tmp3        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(75.)));
                // C_hAlpha[i] = 0.024 * DIVMACROc(tmp2 , (1. - EXPc_smp(tmp3 * 0.2)));
                _mm256_store_pd(&C_hAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.024) , DIVMACRO(tmp2 , _mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(_mm256_mul_pd(tmp2 , _mm256_set1_pd(0.2)))))));
                // C_hBeta[i]  = -0.0091 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp4 * 0.2)));
                _mm256_store_pd(&C_hBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.0091) , DIVMACRO(tmp3 , _mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(_mm256_mul_pd(tmp3, _mm256_set1_pd(0.2)))))));
                // C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
                _mm256_store_pd(&C_hInf[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_set1_pd(1.) , _mm256_mul_pd(EXPi_smp(_mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(65.))) , _mm256_set1_pd(.0153846158462)))));
                // C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
                _mm256_store_pd(&C_hTau[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_hAlpha[i]) , _mm256_load_pd(&C_hBeta[i]))));

                // C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
                _mm256_store_pd(&C_m[i]      ,_mm256_add_pd(_mm256_load_pd(&C_m[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(DIVMACRO(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_mTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_mInf[i]) , _mm256_load_pd(&C_m[i])))));
                // C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
                _mm256_store_pd(&C_h[i]      ,_mm256_add_pd(_mm256_load_pd(&C_h[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(DIVMACRO(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_hTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_hInf[i]) , _mm256_load_pd(&C_h[i])))));
            
            #else

                vec_st(vec_add(vec_lda(0,&C_v[i]) , vec_splats(35.0)), 0, &tmp0[0]);
                vec_st(EXPi_smp(vec_mul(vec_ld(0,&tmp0[0]),vec_splats(0.1111111111111))), 0, &tmp1[0]);
                vec_sta(vec_mul(vec_mul( vec_splats(0.128), vec_ld(0,&tmp0[0]) ), DIVMACROB(vec_ld(0,&tmp1[0]),vec_sub( vec_ld(0,&tmp1[0]),vec_splats(1.) ))  ) , 0, &C_mAlpha[i]);
                vec_sta(vec_mul(vec_splats(-0.124), DIVMACROB(vec_ld(0,&tmp0[0]), vec_sub(vec_splats(1.0),vec_ld(0,&tmp1[0])))) , 0, &C_mBeta[i]);
                vec_sta(DIVMACROB(vec_splats(1.0),vec_add(vec_lda(0,&C_mAlpha[i]),vec_lda(0,&C_mBeta[i]))),0,&C_mTau[i]);
                vec_sta(vec_mul(vec_lda(0,&C_mAlpha[i]),vec_lda(0,&C_mTau[i])),0,&C_mInf[i]);
                
                vec_st(vec_add(vec_lda(0,&C_v[i]) ,vec_splats(50.)) ,0,&tmp2[0]);
                vec_st(vec_add(vec_lda(0,&C_v[i]) ,vec_splats(75.)) ,0,&tmp3[0]);
                vec_sta(vec_mul(vec_splats(0.024),DIVMACROB(vec_ld(0,&tmp2[0]),vec_sub(vec_splats(1.),EXPi_smp(vec_mul(vec_ld(0,&tmp2[0]),vec_splats(0.2)))))),0,&C_hAlpha[i]);
                vec_sta(vec_mul(vec_splats(-0.0091),DIVMACROB(vec_ld(0,&tmp3[0]),vec_sub(vec_splats(1.),EXPi_smp(vec_mul(vec_ld(0,&tmp3[0]),vec_splats(0.2)))))),0,&C_hBeta[i]);
                vec_sta(DIVMACROB(vec_splats(1.),vec_madd(vec_splats(.0153846158462),EXPi_smp(vec_add(vec_lda(0,&C_v[i]),vec_splats(65.))),vec_splats(1.))),0,&C_hInf[i]);
                vec_sta(DIVMACROB(vec_splats(1.),vec_add(vec_lda(0,&C_hAlpha[i]),vec_lda(0,&C_hBeta[i]))),0,&C_hTau[i]);

                vec_sta(vec_madd(vec_sub(vec_splats(1.),EXPi_smp(DIVMACROB(vec_splats(-1.),vec_lda(0,&C_mTau[i])))),vec_sub(vec_lda(0,&C_mInf[i]),vec_lda(0,&C_m[i])),vec_lda(0,&C_m[i])),0,&C_m[i]);
                vec_sta(vec_madd(vec_sub(vec_splats(1.),EXPi_smp(DIVMACROB(vec_splats(-1.),vec_lda(0,&C_hTau[i])))),vec_sub(vec_lda(0,&C_hInf[i]),vec_lda(0,&C_h[i])),vec_lda(0,&C_h[i])),0,&C_h[i]);

            #endif
        
        #else
            #if INTEL

                // tmp0        = C_v[i] + 35.0;
                _mm256_store_pd(&tmp0        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(35.0)));
                // tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
                _mm256_store_pd(&tmp1        , _mm256_exp_pd(_mm256_mul_pd(tmp0 , _mm256_set1_pd(0.1111111111111))));
                // C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
                _mm256_store_pd(&C_mAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.128) , _mm256_mul_pd( tmp0 , _mm256_div_pd(tmp1 , _mm256_sub_pd(tmp1 , _mm256_set1_pd(1.))))));
                // C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
                _mm256_store_pd(&C_mBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.124) , _mm256_div_pd(tmp0 , _mm256_sub_pd(_mm256_set1_pd(1.) , tmp1))));
                // C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
                _mm256_store_pd(&C_mTau[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mBeta[i]))));
                // C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
                _mm256_store_pd(&C_mInf[i]   , _mm256_mul_pd( _mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mTau[i])));
          
                // tmp2        = C_v[i] + 50.;
                _mm256_store_pd(&tmp2        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(50.)));
                // tmp3        = C_v[i] + 75.;
                _mm256_store_pd(&tmp3        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(75.)));
                // C_hAlpha[i] = 0.024 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp3 * 0.2)));
                _mm256_store_pd(&C_hAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.024) , _mm256_div_pd(tmp2 , _mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_mul_pd(tmp2 , _mm256_set1_pd(0.2)))))));
                // C_hBeta[i]  = -0.0091 * DIVMACROc(tmp4 , (1. - EXPc_smp(tmp4 * 0.2)));
                _mm256_store_pd(&C_hBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.0091) , _mm256_div_pd(tmp3 , _mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_mul_pd(tmp3 , _mm256_set1_pd(0.2)))))));
                // C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
                _mm256_store_pd(&C_hInf[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_set1_pd(1.) , _mm256_mul_pd(_mm256_exp_pd(_mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(65.))) , _mm256_set1_pd(.0153846158462)))));
                // C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
                _mm256_store_pd(&C_hTau[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_hAlpha[i]) , _mm256_load_pd(&C_hBeta[i]))));

                // C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
                _mm256_store_pd(&C_m[i]      ,_mm256_add_pd(_mm256_load_pd(&C_m[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_div_pd(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_mTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_mInf[i]) , _mm256_load_pd(&C_m[i])))));
                // C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
                _mm256_store_pd(&C_h[i]      ,_mm256_add_pd(_mm256_load_pd(&C_h[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_div_pd(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_hTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_hInf[i]) , _mm256_load_pd(&C_h[i])))));            
            
            #else

                vec_st(vec_add(vec_lda(0,&C_v[i]) , vec_splats(35.0)), 0, &tmp0[0]);
                vec_st(expd4(vec_mul(vec_ld(0,&tmp0[0]),vec_splats(0.1111111111111))), 0, &tmp1[0]);
                vec_sta(vec_mul(vec_mul( vec_splats(0.128), vec_ld(0,&tmp0[0]) ), vec_swdiv_nochk(vec_ld(0,&tmp1[0]),vec_sub( vec_ld(0,&tmp1[0]),vec_splats(1.) ))  ) , 0, &C_mAlpha[i]);
                vec_sta(vec_mul(vec_splats(-0.124), vec_swdiv_nochk(vec_ld(0,&tmp0[0]), vec_sub(vec_splats(1.0),vec_ld(0,&tmp1[0])))) , 0, &C_mBeta[i]);
                vec_sta(vec_swdiv_nochk(vec_splats(1.0),vec_add(vec_lda(0,&C_mAlpha[i]),vec_lda(0,&C_mBeta[i]))),0,&C_mTau[i]);
                vec_sta(vec_mul(vec_lda(0,&C_mAlpha[i]),vec_lda(0,&C_mTau[i])),0,&C_mInf[i]);
                
                vec_st(vec_add(vec_lda(0,&C_v[i]) ,vec_splats(50.)) ,0,&tmp2[0]);
                vec_st(vec_add(vec_lda(0,&C_v[i]) ,vec_splats(75.)) ,0,&tmp3[0]);
                vec_sta(vec_mul(vec_splats(0.024),vec_swdiv_nochk(vec_ld(0,&tmp2[0]),vec_sub(vec_splats(1.),expd4(vec_mul(vec_ld(0,&tmp2[0]),vec_splats(0.2)))))),0,&C_hAlpha[i]);
                vec_sta(vec_mul(vec_splats(-0.0091),vec_swdiv_nochk(vec_ld(0,&tmp3[0]),vec_sub(vec_splats(1.),expd4(vec_mul(vec_ld(0,&tmp3[0]),vec_splats(0.2)))))),0,&C_hBeta[i]);
                vec_sta(vec_swdiv_nochk(vec_splats(1.),vec_madd(vec_splats(.0153846158462),expd4(vec_add(vec_lda(0,&C_v[i]),vec_splats(65.))),vec_splats(1.))),0,&C_hInf[i]);
                vec_sta(vec_swdiv_nochk(vec_splats(1.),vec_add(vec_lda(0,&C_hAlpha[i]),vec_lda(0,&C_hBeta[i]))),0,&C_hTau[i]);

                vec_sta(vec_madd(vec_sub(vec_splats(1.),expd4(vec_swdiv_nochk(vec_splats(-1.),vec_lda(0,&C_mTau[i])))),vec_sub(vec_lda(0,&C_mInf[i]),vec_lda(0,&C_m[i])),vec_lda(0,&C_m[i])),0,&C_m[i]);
                vec_sta(vec_madd(vec_sub(vec_splats(1.),expd4(vec_swdiv_nochk(vec_splats(-1.),vec_lda(0,&C_hTau[i])))),vec_sub(vec_lda(0,&C_hInf[i]),vec_lda(0,&C_h[i])),vec_lda(0,&C_h[i])),0,&C_h[i]);
//div_fastd
            #endif
        #endif
 
    }  

    // // Dummy
    // if(C_mAlpha[n >>1] == 123456.123456)
    //     NA_STA_ALT(C_mAlpha, C_mBeta, C_mTau, C_mInf, C_hAlpha, 
    //         C_hBeta, C_hTau, C_hInf, C_m, C_h, C_v, n);

    // #pragma vector aligned
    // // #pragma unroll(4)
    // for (i=0; i<n;i+=4){

    // }

    // // Dummy
    // if(C_hAlpha[n >>1] == 123456.123456)
    //     NA_STA_ALT(C_mAlpha, C_mBeta, C_mTau, C_mInf, C_hAlpha, 
    //         C_hBeta, C_hTau, C_hInf, C_m, C_h, C_v, n);

    // #pragma vector aligned
    // // #pragma unroll(4)
    // for (i=0; i<n;i+=4){
    // }

    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("NA_STA_ALT"); 
    #endif

    #if OMP
        }

    #endif

    return 0.1;
}


