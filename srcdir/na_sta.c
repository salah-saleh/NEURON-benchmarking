// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"
#include "util.h"



    // __inline double multAdd(double a, double b, double c){
    //     return a*b+c;
    // }

    __inline double EXPc_smp (double x){
        long long int twok = ((1023+((long long int)(1.4426950408889634 * x))) << (52));
        return ((((((((((a10*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a9)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a8)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a7)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a6)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a5)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a4)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a3)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a2)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a1)*(x - ((double)((int)(1.4426950408889634 * x))) * (0.6931471805599453))+a0) * (*(double *)(&twok));   

        // long long int k = (long long int)(1.4426950408889634 * x);
        // long long int kAsADB = ((1023+k) << (52));  
        // double y = (x - (double)k * (0.6931471805599453));
        // return multAdd(multAdd(multAdd(multAdd(multAdd(multAdd(multAdd(multAdd(multAdd(multAdd(a10,y,a9),y,a8),y,a7),y,a6),y,a5),y,a4),y,a3),y,a2),y,a1),y,a0) * (*(double *)(&kAsADB)); 
    }



// double NA_STA(double * restrict C_mAlpha, double * restrict C_mBeta,
//     double * restrict C_mTau, double * restrict C_mInf, double * restrict C_hAlpha, 
//     double * restrict C_hBeta, double * restrict C_hTau, double * restrict C_hInf, 
//     double * restrict C_m, double * restrict C_h, double * restrict C_v, int n){
  
//     #if INTEL
//     #else
//     __alignx(64, C_mAlpha);
//     __alignx(64, C_mBeta);
//     __alignx(64, C_mTau);
//     __alignx(64, C_mInf);
//     __alignx(64, C_hAlpha);
//     __alignx(64, C_hBeta);
//     __alignx(64, C_hTau);
//     __alignx(64, C_hInf);
//     __alignx(64, C_m);
//     __alignx(64, C_h);
//     __alignx(64, C_v);
//     #endif

//     int i;
//     double tmp0, tmp1, tmp2, tmp3, tmp4;

//     #if OMP
//     #pragma omp parallel private(tmp0, tmp1, tmp2, tmp3, i)
//     {
//     #endif

//     #if LIKWID
//     likwid_markerStartRegion("NA_STA");
//     #endif

//     #if IACA 
//     IACA_START
//     #endif

//     #pragma ibm independent_loop
//     #pragma simd_level(10)

//     #if OMP
//     #pragma omp for schedule(static)
//     #endif

//     #pragma vector aligned
//     #pragma simd
//     //#pragma unroll(8)
//     for (i=0; i<n;++i){

//         // C_mAlpha[0] += EXPc_smp(C_mBeta[i]);
//         // C_mAlpha[0] += exp(C_mBeta[i]);
//         // C_mAlpha[0] += DIVMACROc(1.0,i);
//         // tmp4 += 1.0/i;

//         #if EXTMATH        
//             tmp0        = C_v[i] + 35.0;
//             tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
//             C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
//             C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
//             C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
//             C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
//             tmp2        = C_v[i] + 50.;
//             tmp3        = C_v[i] + 75.;
//             C_hAlpha[i] = 0.024 * DIVMACROc(tmp2 , (1. - EXPc_smp(tmp2 * 0.2)));
//             C_hBeta[i]  = -0.0091 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp3 * 0.2)));
//             C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
//             C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
//             C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
//             C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
//         #else
//             tmp0        = C_v[i] + 35.0;
//             tmp1        = exp(tmp0 * 0.1111111111111);
//             C_mAlpha[i] = 0.128 * tmp0 * tmp1 / (tmp1 - 1.);
//             C_mBeta[i]  = -0.124 * tmp0 / (1. - tmp1);
//             C_mTau[i]   = 1. / (C_mAlpha[i] + C_mBeta[i]);
//             C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
//             tmp2        = C_v[i] + 50.;
//             tmp3        = C_v[i] + 75.;
//             C_hAlpha[i] = 0.024 * tmp2 / (1. - exp(tmp2 * 0.2));
//             C_hBeta[i]  = -0.0091 * tmp3 / (1. - exp(tmp3 * 0.2));
//             C_hInf[i]   = 1. / (1. + exp(C_v[i] + 65.) * .0153846158462);
//             C_hTau[i]   = 1. / (C_hAlpha[i] + C_hBeta[i]);
//             C_m[i]     += (1. - exp(-0.1 / C_mTau[i])) * (C_mInf[i] - C_m[i]);
//             C_h[i]     += (1. - exp(-0.1 / C_hTau[i])) * (C_hInf[i] - C_h[i]);
//         #endif
//     }  
//     #if IACA 
//     IACA_END
//     #endif

//     #if LIKWID
//     likwid_markerStopRegion("NA_STA"); 
//     #endif

//     #if OMP
//         }
//     #endif

//     return 0.1;
// }



double NA_STA(double * restrict C_mAlpha, double * restrict C_mBeta,
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

    #define SIMD 1024
    int i,j;
    double tmp0, tmp1, tmp2, tmp3, tmp4;

    #if OMP
    #pragma omp parallel private(tmp0, tmp1, tmp2, tmp3, i,j)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("NA_STA");
    #endif

    #if IACA 
    IACA_START
    #endif



    #if OMP
    #pragma omp for schedule(static)
    #endif

    //#pragma unroll(8)
    for(i=0; i<(n*11);i+=(SIMD*11)){
        #pragma ibm independent_loop
        #pragma simd_level(10)
        for (j=0; j<SIMD;++j){
                tmp0        = C_mAlpha[i+(10*SIMD)+j] + 35.0;
                tmp1        = exp(tmp0 * 0.1111111111111);
                C_mAlpha[i+(0*SIMD)+j] = 0.128 * tmp0 * tmp1 / (tmp1 - 1.);
                C_mAlpha[i+(1*SIMD)+j]  = -0.124 * tmp0 / (1. - tmp1);
                C_mAlpha[i+(2*SIMD)+j]   = 1. / (C_mAlpha[i+(0*SIMD)+j] + C_mAlpha[i+(1*SIMD)+j]);
                C_mAlpha[i+(3*SIMD)+j]   = C_mAlpha[i+(0*SIMD)+j] * C_mAlpha[i+(2*SIMD)+j];
                tmp2        = C_mAlpha[i+(10*SIMD)+j] + 50.;
                tmp3        = C_mAlpha[i+(10*SIMD)+j] + 75.;
                C_mAlpha[i+(4*SIMD)+j] = 0.024 * tmp2 / (1. - exp(tmp2 * 0.2));
                C_mAlpha[i+(5*SIMD)+j]  = -0.0091 * tmp3 / (1. - exp(tmp3 * 0.2));
                C_mAlpha[i+(7*SIMD)+j]   = 1. / (1. + exp(C_mAlpha[i+(10*SIMD)+j] + 65.) * .0153846158462);
                C_mAlpha[i+(6*SIMD)+j]   = 1. / (C_mAlpha[i+(4*SIMD)+j] + C_mAlpha[i+(5*SIMD)+j]);
                C_mAlpha[i+(8*SIMD)+j]     += (1. - exp(-0.1 / C_mAlpha[i+(2*SIMD)+j])) * (C_mAlpha[i+(3*SIMD)+j] - C_mAlpha[i+(8*SIMD)+j]);
                C_mAlpha[i+(9*SIMD)+j]     += (1. - exp(-0.1 / C_mAlpha[i+(6*SIMD)+j])) * (C_mAlpha[i+(7*SIMD)+j] - C_mAlpha[i+(9*SIMD)+j]);
        } 
    } 
    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("NA_STA"); 
    #endif

    #if OMP
        }
    #endif

    return 0.1;
}
