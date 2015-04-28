// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"

double NA_CUR_FNL(double * restrict C_a, double * restrict C_b, double * restrict C_c, double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){
    int i, z;
    double dina, rhs;

    #if OMP
    #pragma omp parallel private(dina, rhs, i, z)
    {
    #endif

    #if LIKWID
    likwid_markerStartRegion("NA_CUR_FNL");
    #endif

    #if IACA 
    IACA_START
    #endif

    #if OMP
    #pragma omp for
    #endif

    for (z = 0; ((z < n)); z+=176)//&&(C_b[n-1] != 100000.12345)
    {

        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); ++i){
            C_f[i] *= PVAR_0[i];
            C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
        }

       // Dummy
        if(C_c[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);


        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); ++i){
            PVAR_2[i] += C_c[i];
            C_g[i] = V_0[i];
        }

        // Dummy
        if(C_g[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); ++i){
            C_h[i] = C_c[i];
            C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
        }

        // Dummy
        if(C_b[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);


        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); ++i){
            RHS_0[i] -= C_b[i];     
            PVAR_1[i] += C_b[i];
        }

    }

    #if IACA 
    IACA_END
    #endif

    #if LIKWID
    likwid_markerStopRegion("NA_CUR_FNL"); 
    #endif

    #if OMP
        }
    #endif

    

    return 0.1;
}

#if 0
        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); i+=4){
        // C_f[i] *= PVAR_0[i];
        _mm256_store_pd(&C_f[i], _mm256_mul_pd(_mm256_load_pd(&C_f[i]), _mm256_load_pd(&PVAR_0[i])));
        // C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
        _mm256_store_pd(&C_c[i], _mm256_mul_pd(_mm256_load_pd(&C_a[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), 
            _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_load_pd(&C_e[i]))))));
        }

       // Dummy
        if(C_c[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);


        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n);i+=4){
        // PVAR_2[i] += C_c[i];
        _mm256_store_pd(&PVAR_2[i], _mm256_add_pd(_mm256_load_pd(&PVAR_2[i]), _mm256_load_pd(&C_c[i])));
        // C_g[i] = V_0[i];
        _mm256_store_pd(&C_g[i], _mm256_load_pd(&V_0[i]));
        }

        // Dummy
        if(C_g[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); i+=4){
        // C_h[i] = C_c[i];
        _mm256_store_pd(&C_h[i], _mm256_load_pd(&C_c[i]));
        // C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
        _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&V_0[i]), _mm256_load_pd(&C_f[i]))));

        }

        // Dummy
        if(C_b[n >>1] == 123456.123456)
            NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);


        #pragma vector aligned
        #pragma simd
        //#pragma unroll(8)
        for (i=z; i<((z+176)<n ? (z+176):n); i+=4){
        // RHS_0[i] -= C_b[i]; 
        _mm256_store_pd(&RHS_0[i], _mm256_sub_pd(_mm256_load_pd(&RHS_0[i]), _mm256_load_pd(&C_b[i])));
        // PVAR_1[i] += C_b[i];
        _mm256_store_pd(&PVAR_1[i], _mm256_add_pd(_mm256_load_pd(&PVAR_1[i]), _mm256_load_pd(&C_b[i])));
        }
#endif
