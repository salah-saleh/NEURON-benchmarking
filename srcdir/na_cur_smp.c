// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"

double NA_CUR_SMP(double * restrict C_a, double * restrict C_b, double * restrict C_c, double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){
    int i;
    double dina, rhs;

    #if OMP
    #pragma omp parallel private(dina, rhs, i)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("NA_CUR_SMP");
    #endif

    #if IACA 
    IACA_START
    #endif

    #if OMP
    #pragma omp for
    #endif

    #pragma vector aligned
    #pragma simd
    //#pragma unroll(8)
    for (i=0; i<n;++i){
        C_f[i] *= PVAR_0[i];
        C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
    }

   // Dummy
    if(C_c[n >>1] == 123456.123456)
        NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

    #if OMP
    #pragma omp for
    #endif

    #pragma vector aligned
    #pragma simd
    //#pragma unroll(8)
    for (i=0; i<n;++i){
        PVAR_2[i] += C_c[i];
        C_g[i] = V_0[i];
    }

    // Dummy
    if(C_g[n >>1] == 123456.123456)
        NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

    #if OMP
    #pragma omp for
    #endif
    #pragma vector aligned
    #pragma simd
    //#pragma unroll(8)
    for (i=0; i<n;++i){
        C_h[i] = C_c[i];
        C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
    }

    // Dummy
    if(C_b[n >>1] == 123456.123456)
        NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

    #if OMP
    #pragma omp for
    #endif

    #pragma vector aligned
    #pragma simd
    //#pragma unroll(8)
    for (i=0; i<n;++i){
        RHS_0[i] -= C_b[i];     
        PVAR_1[i] += C_b[i];
    }

    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("NA_CUR_SMP"); 
    #endif

    #if OMP
        }
    #endif

    

    return 0.1;
}

