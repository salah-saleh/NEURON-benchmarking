// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"

double SY_CUR(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
    double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict C_i, double * restrict C_j, double * restrict C_k,
    double * restrict C_l, double * restrict C_m, double * restrict C_n,
    double * restrict PVAR_0, double * restrict RHS_0, double * restrict V_0, int n){
    int i;
    double tmpCn, rhs;

    #if OMP
    #pragma omp parallel private(tmpCn, rhs, i)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("SY_CUR");
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
	C_m[i] = V_0[i] + C_b[i] *  C_f[i];
	//C_m[0] += 1./i;
/*
        C_m[i] = V_0[i] + 0.001;
        V_0[i] = C_b[i] * 0.28 / (1. + exp(-0.062 * C_m[i]));
        C_f[i] = 32. * (C_j[i] - C_i[i]);
        C_g[i] = 32. * (C_l[i] - C_k[i]) * V_0[i];
        C_h[i] = (C_f[i] + C_g[i]);
        C_d[i] = C_f[i] * (C_m[i] - C_a[i]);
        C_e[i] = C_g[i] * (C_m[i] - C_a[i]);
        tmpCn = (C_d[i] - C_e[i]);

        C_m[i] = V_0[i] + 0.;
        V_0[i] = C_b[i] * 0.28 / (1. + exp(-0.062 * C_m[i]));
        // C_f doesn't change
        C_g[i] = 32. * (C_l[i] - C_k[i]) * V_0[i];
        C_h[i] = (C_f[i] + C_g[i]);
        C_d[i] = C_f[i] * (C_m[i] - C_a[i]);
        C_e[i] = C_g[i] * (C_m[i] - C_a[i]);
        C_c[i] = (C_d[i] - C_e[i]);
        
        tmpCn = (tmpCn - rhs) * 1000.;
        C_n[i] = tmpCn * 100. / PVAR_0[i];
        RHS_0[i] -= 100. * rhs /PVAR_0[i];
*/
    }
    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("SY_CUR"); 
    #endif

    #if OMP
        }
    #endif

    return 0.1;
}

