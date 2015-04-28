// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"

double NA_CUR(double * restrict C_a, double * restrict C_b, double * restrict C_c, double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){
    int i;
    double dina, rhs;

    #if OMP
    #pragma omp parallel private(dina, rhs, i)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("NA_CUR");
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
        
        C_g[i] = V_0[i] + 0.001;
        C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
        C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
        C_h[i] = C_b[i];
        
        dina = C_b[i];

        C_g[i] = V_0[i];
        //C_c[i] is not modified.
        C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
        rhs = C_b[i];

        PVAR_2[i] += (dina - C_b[i]) * 1000.;
        C_h[i] = (C_h[i] - rhs) * 1000.;
        PVAR_1[i] += C_b[i];
        RHS_0[i] -= rhs;

    }
    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("NA_CUR"); 
    #endif

    #if OMP
        }
    #endif

    

    return 0.1;
}

