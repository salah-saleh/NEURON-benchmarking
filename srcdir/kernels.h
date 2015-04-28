// Salaheldin Saleh. me@s-saleh.com

#ifndef KERNELS
#define KERNELS

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <string.h>
#include <math.h>
#if INTEL
#include "immintrin.h"
#endif

// If defined, include the right header

#if OMP
#include <omp.h>
#endif

#if LIKWID
#include <likwid.h>
#endif

#if IACA
#include "iacaMarks.h"
#endif

// Registering a new kernel
enum KER {  
	KER_NA_STA         = 1,
	KER_NA_STA_ALT 	   = 11,
	KER_NA_CUR 	   	   = 2,
	KER_NA_CUR_ALT 	   = 22,
	KER_NA_CUR_SMP 	   = 222,
	KER_NA_CUR_ALT_SMP = 2222,
	KER_NA_CUR_FNL     = 22222,
	KER_SY_CUR 	   	   = 3,
	KER_SY_CUR_ALT 	   = 33
};

// Registering memory size (used in deciding repeatation - optional)
enum MemLim {  
	L1		= 10000,
	L23		= 1000000
};

// Check if we want to provide array size and repeation from command line
#if EXT == 1
// Everything will be set on run time
#else
	// Set the size of an array 
	#ifndef NSIZE
		#error ArraySize Required (set NSIZE)
	#endif

	// Set repeat the experiment
	#ifndef NITER
	#error Repeat Number Required (set NITR) - type '0' for default
	#endif

	// If you have many kernels in your application, you can choose 
	// the kernel to benchmark
	#ifndef KERNEL
		#error Kernel Number Required (set KERNEL)
	#endif
#endif


// List of kernels

double NA_STA(double * restrict C_mAlpha, double * restrict C_mBeta,
 	double * restrict C_mTau, double * restrict C_mInf, double * restrict C_hAlpha, 
    double * restrict C_hBeta, double * restrict C_hTau, double * restrict C_hInf, 
    double * restrict C_m, double * restrict C_h, double * restrict C_v, int n);

double NA_STA_ALT(double * restrict C_mAlpha, double * restrict C_mBeta,
 	double * restrict C_mTau, double * restrict C_mInf, double * restrict C_hAlpha, 
    double * restrict C_hBeta, double * restrict C_hTau, double * restrict C_hInf, 
    double * restrict C_m, double * restrict C_h, double * restrict C_v, int n);

double NA_CUR(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n);

double NA_CUR_ALT(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n);

double NA_CUR_SMP(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n);

double NA_CUR_ALT_SMP(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n);

double NA_CUR_FNL(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict PVAR_0, double * restrict PVAR_1,
    double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n);

double SY_CUR(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict C_i, double * restrict C_j, double * restrict C_k,
    double * restrict C_l, double * restrict C_m, double * restrict C_n,
    double * restrict PVAR_0, double * restrict RHS_0, double * restrict V_0, int n);

double SY_CUR_ALT(double * restrict C_a, double * restrict C_b, double * restrict C_c, 
	double * restrict C_d, double * restrict C_e, 
    double * restrict C_f, double * restrict C_g, double * restrict C_h, 
    double * restrict C_i, double * restrict C_j, double * restrict C_k,
    double * restrict C_l, double * restrict C_m, double * restrict C_n,
    double * restrict PVAR_0, double * restrict RHS_0, double * restrict V_0, int n);

#endif