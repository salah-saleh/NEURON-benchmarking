	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=1000 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 ";
# mark_description "-DLIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -DEXTMATH=0 -vec-report3 -o asmdir/na_sta_alt.s";
	.file "na_sta_alt.c"
	.text
..TXTST0:
L__routine_start_NA_STA_ALT_0:
# -- Begin  NA_STA_ALT
# mark_begin;
       .align    16,0x90
	.globl NA_STA_ALT
NA_STA_ALT:
# parameter 1(C_mAlpha): %rdi
# parameter 2(C_mBeta): %rsi
# parameter 3(C_mTau): %rdx
# parameter 4(C_mInf): %rcx
# parameter 5(C_hAlpha): %r8
# parameter 6(C_hBeta): %r9
# parameter 7(C_hTau): 16 + %rbp
# parameter 8(C_hInf): 24 + %rbp
# parameter 9(C_m): 32 + %rbp
# parameter 10(C_h): 40 + %rbp
# parameter 11(C_v): 48 + %rbp
# parameter 12(n): 56 + %rbp
..B1.1:                         # Preds ..B1.0

###     double * restrict C_m, double * restrict C_h, double * restrict C_v, int n){

..___tag_value_NA_STA_ALT.1:                                    #46.80
..LN0:
  .file   1 "srcdir/na_sta_alt.c"
   .loc    1  46  is_stmt 1
        pushq     %rbp                                          #46.80
..___tag_value_NA_STA_ALT.3:                                    #
..LN1:
        movq      %rsp, %rbp                                    #46.80
..___tag_value_NA_STA_ALT.4:                                    #
..LN2:
        andq      $-32, %rsp                                    #46.80
..LN3:
        pushq     %r12                                          #46.80
..LN4:
        pushq     %r13                                          #46.80
..LN5:
        pushq     %r14                                          #46.80
..LN6:
        pushq     %r15                                          #46.80
..LN7:
        pushq     %rbx                                          #46.80
..LN8:
        subq      $24, %rsp                                     #46.80
..___tag_value_NA_STA_ALT.6:                                    #
..LN9:
        movq      %r9, %r14                                     #46.80
..LN10:
        movslq    56(%rbp), %rax                                #46.80
..LN11:
        movq      %r8, %r13                                     #46.80

###     
###     int i, j;
###     __m256d tmp0, tmp1, tmp2, tmp3, tmp4;

..LN12:
   .loc    1  49  is_stmt 1
..LN13:
   .loc    1  46  is_stmt 1
        movq      %rcx, %r12                                    #46.80
..LN14:
        movq      %rdx, %rbx                                    #46.80
..LN15:
        movq      %rdi, %r15                                    #46.80
..LN16:
   .loc    1  70  is_stmt 1

### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     likwid_markerStartRegion("NA_STA_ALT");
###     #endif
### 
###     #if IACA 
###     IACA_START
###     #endif
### 
###     #if OMP
###     #pragma omp for
###     #endif
### 
###     #pragma vector aligned
###     // #pragma unroll(4)
###     for (i=0; i<n;i+=4){

        xorl      %edi, %edi                                    #70.10
..LN17:
        testq     %rax, %rax                                    #70.17
..LN18:
        jle       ..B1.5        # Prob 10%                      #70.17
..LN19:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm14
..B1.2:                         # Preds ..B1.1
..LN20:
   .loc    1  129  is_stmt 1

### 
###         // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(DIVMACRO(_mm256_set1_pd(1.0), _mm256_set1_pd(i)), _mm256_load_pd(&C_mBeta[0])) );
###         // _mm256_store_pd(&C_mBeta[0], _mm256_add_pd(_mm256_div_pd(_mm256_set1_pd(1.0), _mm256_set1_pd(i)), _mm256_load_pd(&C_mBeta[0])) );
### 
###         // _mm256_store_pd(&C_mAlpha[i], EXPi_smp(_mm256_load_pd(&C_mAlpha[i])));
###         // _mm256_store_pd(&C_mBeta[i], _mm256_exp_pd(_mm256_load_pd(&C_mBeta[i])));
###  
###         // #if EXTMATH 
###             // // tmp0        = C_v[i] + 35.0;
###             // _mm256_store_pd(&tmp0        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(35.0)));
###             // // tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
###             // _mm256_store_pd(&tmp1        , EXPi_smp(_mm256_mul_pd(tmp0 , _mm256_set1_pd(0.1111111111111))));
###             // // C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
###             // _mm256_store_pd(&C_mAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.128) , _mm256_mul_pd( tmp0 , DIVMACRO(tmp1 , _mm256_sub_pd(tmp1 , _mm256_set1_pd(1.))))));
###             // // C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
###             // _mm256_store_pd(&C_mBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.124) , DIVMACRO(tmp0 , _mm256_sub_pd(_mm256_set1_pd(1.) , tmp1))));
###             // // C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
###             // _mm256_store_pd(&C_mTau[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mBeta[i]))));
###             // // C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
###             // _mm256_store_pd(&C_mInf[i]   , _mm256_mul_pd( _mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mTau[i])));
###       
###             // // tmp2        = C_v[i] + 50.;
###             // _mm256_store_pd(&tmp2        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(50.)));
###             // // tmp3        = C_v[i] + 75.;
###             // _mm256_store_pd(&tmp3        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(75.)));
###             // // C_hAlpha[i] = 0.024 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp3 * 0.2)));
###             // _mm256_store_pd(&C_hAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.024) , DIVMACRO(tmp3 , _mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(_mm256_mul_pd(tmp3 , _mm256_set1_pd(0.2)))))));
###             // // C_hBeta[i]  = -0.0091 * DIVMACROc(tmp4 , (1. - EXPc_smp(tmp4 * 0.2)));
###             // _mm256_store_pd(&C_hBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.0091) , DIVMACRO(tmp4 , _mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(_mm256_mul_pd(tmp4 , _mm256_set1_pd(0.2)))))));
###             // // C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
###             // _mm256_store_pd(&C_hInf[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_set1_pd(1.) , _mm256_mul_pd(EXPi_smp(_mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(65.))) , _mm256_set1_pd(.0153846158462)))));
###             // // C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
###             // _mm256_store_pd(&C_hTau[i]   , DIVMACRO(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_hAlpha[i]) , _mm256_load_pd(&C_hBeta[i]))));
### 
###             // // C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
###             // _mm256_store_pd(&C_m[i]      ,_mm256_add_pd(_mm256_load_pd(&C_m[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(DIVMACRO(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_mTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_mInf[i]) , _mm256_load_pd(&C_m[i])))));
###             // // C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
###             // _mm256_store_pd(&C_h[i]      ,_mm256_add_pd(_mm256_load_pd(&C_h[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , EXPi_smp(DIVMACRO(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_hTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_hInf[i]) , _mm256_load_pd(&C_h[i])))));
### 
###         // #else
###             // tmp0        = C_v[i] + 35.0;
###             _mm256_store_pd(&tmp0        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(35.0)));
###             // tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
###             _mm256_store_pd(&tmp1        , _mm256_exp_pd(_mm256_mul_pd(tmp0 , _mm256_set1_pd(0.1111111111111))));
###             // C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
###             _mm256_store_pd(&C_mAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.128) , _mm256_mul_pd( tmp0 , _mm256_div_pd(tmp1 , _mm256_sub_pd(tmp1 , _mm256_set1_pd(1.))))));
###             // C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
###             _mm256_store_pd(&C_mBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.124) , _mm256_div_pd(tmp0 , _mm256_sub_pd(_mm256_set1_pd(1.) , tmp1))));
###             // C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
###             _mm256_store_pd(&C_mTau[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mBeta[i]))));
###             // C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
###             _mm256_store_pd(&C_mInf[i]   , _mm256_mul_pd( _mm256_load_pd(&C_mAlpha[i]) , _mm256_load_pd(&C_mTau[i])));
###       
###             // tmp2        = C_v[i] + 50.;
###             _mm256_store_pd(&tmp2        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(50.)));
###             // tmp3        = C_v[i] + 75.;
###             _mm256_store_pd(&tmp3        , _mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(75.)));
###             // C_hAlpha[i] = 0.024 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp3 * 0.2)));
###             _mm256_store_pd(&C_hAlpha[i] , _mm256_mul_pd(_mm256_set1_pd(0.024) , _mm256_div_pd(tmp3 , _mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_mul_pd(tmp3 , _mm256_set1_pd(0.2)))))));

        vmovupd   .L_2il0floatpacket.19(%rip), %ymm8            #129.173
..LN21:
   .loc    1  112  is_stmt 1
        vmovupd   .L_2il0floatpacket.12(%rip), %ymm12           #112.84
..LN22:
   .loc    1  114  is_stmt 1
        vmovupd   .L_2il0floatpacket.13(%rip), %ymm11           #114.79
..LN23:
   .loc    1  116  is_stmt 1
        vmovupd   .L_2il0floatpacket.14(%rip), %ymm9            #116.58
..LN24:
        vmovupd   .L_2il0floatpacket.15(%rip), %ymm10           #116.146
..LN25:
   .loc    1  131  is_stmt 1

###             // C_hBeta[i]  = -0.0091 * DIVMACROc(tmp4 , (1. - EXPc_smp(tmp4 * 0.2)));
###             _mm256_store_pd(&C_hBeta[i]  , _mm256_mul_pd(_mm256_set1_pd(-0.0091) , _mm256_div_pd(tmp4 , _mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_mul_pd(tmp4 , _mm256_set1_pd(0.2)))))));

        vmulpd    %ymm8, %ymm14, %ymm0                          #131.154
..LN26:
   .loc    1  118  is_stmt 1
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm13           #118.58
..LN27:
   .loc    1  127  is_stmt 1
        vmovupd   .L_2il0floatpacket.17(%rip), %ymm15           #127.84
..LN28:
   .loc    1  131  is_stmt 1
        call      __svml_exp4                                   #131.140
..LN29:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm11 ymm12 ymm13 ymm14 ymm15
..B1.8:                         # Preds ..B1.2
..LN30:
        vsubpd    %ymm0, %ymm10, %ymm1                          #131.105
..LN31:
        vdivpd    %ymm1, %ymm14, %ymm2                          #131.84
..LN32:
   .loc    1  138  is_stmt 1

###             // C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
###             _mm256_store_pd(&C_hInf[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_set1_pd(1.) , _mm256_mul_pd(_mm256_exp_pd(_mm256_add_pd(_mm256_load_pd(&C_v[i]) , _mm256_set1_pd(65.))) , _mm256_set1_pd(.0153846158462)))));
###             // C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
###             _mm256_store_pd(&C_hTau[i]   , _mm256_div_pd(_mm256_set1_pd(1.) , _mm256_add_pd(_mm256_load_pd(&C_hAlpha[i]) , _mm256_load_pd(&C_hBeta[i]))));
### 
###             // C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
###             _mm256_store_pd(&C_m[i]      ,_mm256_add_pd(_mm256_load_pd(&C_m[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_div_pd(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_mTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_mInf[i]) , _mm256_load_pd(&C_m[i])))));

        vmovupd   .L_2il0floatpacket.23(%rip), %ymm14           #138.159
..LN33:
   .loc    1  131  is_stmt 1
        vmulpd    .L_2il0floatpacket.20(%rip), %ymm2, %ymm1     #131.44
..LN34:
   .loc    1  138  is_stmt 1
        movq      %r15, 8(%rsp)                                 #138.159
..LN35:
        movq      %rsi, 16(%rsp)                                #138.159
..LN36:
        movq      %r14, (%rsp)                                  #138.159
..LN37:
        vmovapd   %ymm1, %ymm8                                  #138.159
..LN38:
        movq      40(%rbp), %rsi                                #138.159
..LN39:
        movq      32(%rbp), %r14                                #138.159
..LN40:
        movq      16(%rbp), %r15                                #138.159
..LN41:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm8 ymm9 ymm10 ymm14
..B1.3:                         # Preds ..B1.9 ..B1.8
..LN42:
   .loc    1  112  is_stmt 1
        movq      48(%rbp), %rax                                #112.74
..LN43:
        vmovupd   (%rax,%rdi,8), %ymm15                         #112.74
..LN44:
        vaddpd    .L_2il0floatpacket.12(%rip), %ymm15, %ymm11   #112.44
..LN45:
   .loc    1  114  is_stmt 1
        vmulpd    .L_2il0floatpacket.13(%rip), %ymm11, %ymm0    #114.58
..LN46:
        call      __svml_exp4                                   #114.44
..LN47:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm11 ymm14 ymm15
..B1.13:                        # Preds ..B1.3
..LN48:
   .loc    1  116  is_stmt 1
        vsubpd    %ymm10, %ymm0, %ymm12                         #116.125
..LN49:
   .loc    1  118  is_stmt 1
        vsubpd    %ymm0, %ymm10, %ymm3                          #118.104
..LN50:
   .loc    1  116  is_stmt 1
        vdivpd    %ymm12, %ymm0, %ymm13                         #116.104
..LN51:
        vmulpd    %ymm13, %ymm11, %ymm2                         #116.82
..LN52:
   .loc    1  118  is_stmt 1
        vdivpd    %ymm3, %ymm11, %ymm11                         #118.83
..LN53:
   .loc    1  116  is_stmt 1
        vmulpd    %ymm2, %ymm9, %ymm6                           #116.44
..LN54:
   .loc    1  118  is_stmt 1
        vmulpd    .L_2il0floatpacket.16(%rip), %ymm11, %ymm4    #118.44
..LN55:
   .loc    1  127  is_stmt 1
        vaddpd    .L_2il0floatpacket.17(%rip), %ymm15, %ymm11   #127.44
..LN56:
   .loc    1  120  is_stmt 1
        vaddpd    %ymm4, %ymm6, %ymm5                           #120.79
..LN57:
   .loc    1  129  is_stmt 1
        vmulpd    .L_2il0floatpacket.19(%rip), %ymm11, %ymm0    #129.152
..LN58:
   .loc    1  120  is_stmt 1
        vdivpd    %ymm5, %ymm10, %ymm12                         #120.44
..LN59:
   .loc    1  122  is_stmt 1
        vmulpd    %ymm12, %ymm6, %ymm13                         #122.44
..LN60:
   .loc    1  120  is_stmt 1
        vmovupd   %ymm12, (%rbx,%rdi,8)                         #120.30
..LN61:
   .loc    1  122  is_stmt 1
        vmovupd   %ymm13, (%r12,%rdi,8)                         #122.30
..LN62:
   .loc    1  116  is_stmt 1
        movq      8(%rsp), %rax                                 #116.30
..LN63:
   .loc    1  118  is_stmt 1
        movq      16(%rsp), %rdx                                #118.30
..LN64:
   .loc    1  116  is_stmt 1
        vmovupd   %ymm6, (%rax,%rdi,8)                          #116.30
..LN65:
   .loc    1  118  is_stmt 1
        vmovupd   %ymm4, (%rdx,%rdi,8)                          #118.30
..LN66:
   .loc    1  129  is_stmt 1
        call      __svml_exp4                                   #129.138
..LN67:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm11 ymm12 ymm13 ymm14 ymm15
..B1.12:                        # Preds ..B1.13
..LN68:
        vsubpd    %ymm0, %ymm10, %ymm2                          #129.103
..LN69:
   .loc    1  133  is_stmt 1
        vaddpd    .L_2il0floatpacket.21(%rip), %ymm15, %ymm0    #133.142
..LN70:
   .loc    1  129  is_stmt 1
        vdivpd    %ymm2, %ymm11, %ymm11                         #129.82
..LN71:
        vmulpd    .L_2il0floatpacket.18(%rip), %ymm11, %ymm11   #129.44
..LN72:
   .loc    1  131  is_stmt 1
        movq      (%rsp), %rax                                  #131.30
..LN73:
   .loc    1  129  is_stmt 1
        vmovupd   %ymm11, (%r13,%rdi,8)                         #129.30
..LN74:
   .loc    1  131  is_stmt 1
        vmovupd   %ymm8, (%rax,%rdi,8)                          #131.30
..LN75:
   .loc    1  133  is_stmt 1
        call      __svml_exp4                                   #133.128
..LN76:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm11 ymm12 ymm13 ymm14
..B1.11:                        # Preds ..B1.12
..LN77:
        vmulpd    .L_2il0floatpacket.22(%rip), %ymm0, %ymm15    #133.114
..LN78:
   .loc    1  138  is_stmt 1
        vdivpd    %ymm12, %ymm14, %ymm0                         #138.145
..LN79:
   .loc    1  133  is_stmt 1
        vaddpd    %ymm15, %ymm10, %ymm2                         #133.79
..LN80:
   .loc    1  135  is_stmt 1
        vaddpd    %ymm8, %ymm11, %ymm11                         #135.79
..LN81:
   .loc    1  133  is_stmt 1
        vdivpd    %ymm2, %ymm10, %ymm15                         #133.44
..LN82:
   .loc    1  135  is_stmt 1
        vdivpd    %ymm11, %ymm10, %ymm11                        #135.44
..LN83:
   .loc    1  133  is_stmt 1
        movq      24(%rbp), %rax                                #133.30
..LN84:
   .loc    1  135  is_stmt 1
        vmovupd   %ymm11, (%r15,%rdi,8)                         #135.30
..LN85:
   .loc    1  133  is_stmt 1
        vmovupd   %ymm15, (%rax,%rdi,8)                         #133.30
..LN86:
   .loc    1  138  is_stmt 1
        call      __svml_exp4                                   #138.131
..LN87:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm11 ymm13 ymm14 ymm15
..B1.10:                        # Preds ..B1.11
..LN88:
        vsubpd    %ymm0, %ymm10, %ymm2                          #138.96
..LN89:
        vsubpd    (%r14,%rdi,8), %ymm13, %ymm3                  #138.214
..LN90:
   .loc    1  140  is_stmt 1

###             // C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
###             _mm256_store_pd(&C_h[i]      ,_mm256_add_pd(_mm256_load_pd(&C_h[i]), _mm256_mul_pd(_mm256_sub_pd(_mm256_set1_pd(1.) , _mm256_exp_pd(_mm256_div_pd(_mm256_set1_pd(-0.1) , _mm256_load_pd(&C_hTau[i])))) , _mm256_sub_pd(_mm256_load_pd(&C_hInf[i]) , _mm256_load_pd(&C_h[i])))));            

        vdivpd    %ymm11, %ymm14, %ymm0                         #140.145
..LN91:
   .loc    1  138  is_stmt 1
        vmulpd    %ymm3, %ymm2, %ymm4                           #138.82
..LN92:
        vaddpd    (%r14,%rdi,8), %ymm4, %ymm5                   #138.43
..LN93:
        vmovupd   %ymm5, (%r14,%rdi,8)                          #138.30
..LN94:
   .loc    1  140  is_stmt 1
        call      __svml_exp4                                   #140.131
..LN95:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm0 ymm8 ymm9 ymm10 ymm14 ymm15
..B1.9:                         # Preds ..B1.10
..LN96:
        vmovupd   (%rsi,%rdi,8), %ymm4                          #140.273
..LN97:
        vsubpd    %ymm0, %ymm10, %ymm2                          #140.96
..LN98:
        vsubpd    %ymm4, %ymm15, %ymm15                         #140.214
..LN99:
        vmulpd    %ymm15, %ymm2, %ymm3                          #140.82
..LN100:
        vaddpd    %ymm4, %ymm3, %ymm5                           #140.43
..LN101:
        vmovupd   %ymm5, (%rsi,%rdi,8)                          #140.30
..LN102:
   .loc    1  70  is_stmt 1
        addq      $4, %rdi                                      #70.19
..LN103:
        movslq    56(%rbp), %rax                                #70.17
..LN104:
        cmpq      %rax, %rdi                                    #70.17
..LN105:
        jl        ..B1.3        # Prob 82%                      #70.17
..LN106:
                                # LOE rbx rsi rdi r12 r13 r14 r15 ymm8 ymm9 ymm10 ymm14
..B1.5:                         # Preds ..B1.9 ..B1.1
..LN107:
   .loc    1  178  is_stmt 1

###         // #endif
### 
###     } 
### 
###     // // Dummy
###     // if(C_mAlpha[n >>1] == 123456.123456)
###     //     NA_STA_ALT(C_mAlpha, C_mBeta, C_mTau, C_mInf, C_hAlpha, 
###     //         C_hBeta, C_hTau, C_hInf, C_m, C_h, C_v, n);
### 
###     // #pragma vector aligned
###     // // #pragma unroll(4)
###     // for (i=0; i<n;i+=4){
### 
###     // }
### 
###     // // Dummy
###     // if(C_hAlpha[n >>1] == 123456.123456)
###     //     NA_STA_ALT(C_mAlpha, C_mBeta, C_mTau, C_mInf, C_hAlpha, 
###     //         C_hBeta, C_hTau, C_hInf, C_m, C_h, C_v, n);
### 
###     // #pragma vector aligned
###     // // #pragma unroll(4)
###     // for (i=0; i<n;i+=4){
###     // }
### 
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("NA_STA_ALT"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     return 0.1;

        vzeroupper                                              #178.12
..LN108:
        vmovsd    .L_2il0floatpacket.24(%rip), %xmm0            #178.12
..LN109:
        addq      $24, %rsp                                     #178.12
..___tag_value_NA_STA_ALT.11:                                   #178.12
..LN110:
        popq      %rbx                                          #178.12
..___tag_value_NA_STA_ALT.12:                                   #178.12
..LN111:
        popq      %r15                                          #178.12
..___tag_value_NA_STA_ALT.13:                                   #178.12
..LN112:
        popq      %r14                                          #178.12
..___tag_value_NA_STA_ALT.14:                                   #178.12
..LN113:
        popq      %r13                                          #178.12
..___tag_value_NA_STA_ALT.15:                                   #178.12
..LN114:
        popq      %r12                                          #178.12
..LN115:
        movq      %rbp, %rsp                                    #178.12
..LN116:
        popq      %rbp                                          #178.12
..___tag_value_NA_STA_ALT.16:                                   #
..LN117:
        ret                                                     #178.12
        .align    16,0x90
..___tag_value_NA_STA_ALT.18:                                   #
..LN118:
                                # LOE
..LN119:
# mark_end;
	.type	NA_STA_ALT,@function
	.size	NA_STA_ALT,.-NA_STA_ALT
..LNNA_STA_ALT.120:
.LNNA_STA_ALT:
	.data
# -- End  NA_STA_ALT
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.12:
	.long	0x00000000,0x40418000,0x00000000,0x40418000,0x00000000,0x40418000,0x00000000,0x40418000
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,32
	.align 32
.L_2il0floatpacket.13:
	.long	0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,32
	.align 32
.L_2il0floatpacket.14:
	.long	0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,32
	.align 32
.L_2il0floatpacket.15:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,32
	.align 32
.L_2il0floatpacket.16:
	.long	0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,32
	.align 32
.L_2il0floatpacket.17:
	.long	0x00000000,0x4052c000,0x00000000,0x4052c000,0x00000000,0x4052c000,0x00000000,0x4052c000
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,32
	.align 32
.L_2il0floatpacket.18:
	.long	0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374
	.type	.L_2il0floatpacket.18,@object
	.size	.L_2il0floatpacket.18,32
	.align 32
.L_2il0floatpacket.19:
	.long	0x9999999a,0x3fc99999,0x9999999a,0x3fc99999,0x9999999a,0x3fc99999,0x9999999a,0x3fc99999
	.type	.L_2il0floatpacket.19,@object
	.size	.L_2il0floatpacket.19,32
	.align 32
.L_2il0floatpacket.20:
	.long	0x532617c2,0xbf82a305,0x532617c2,0xbf82a305,0x532617c2,0xbf82a305,0x532617c2,0xbf82a305
	.type	.L_2il0floatpacket.20,@object
	.size	.L_2il0floatpacket.20,32
	.align 32
.L_2il0floatpacket.21:
	.long	0x00000000,0x40504000,0x00000000,0x40504000,0x00000000,0x40504000,0x00000000,0x40504000
	.type	.L_2il0floatpacket.21,@object
	.size	.L_2il0floatpacket.21,32
	.align 32
.L_2il0floatpacket.22:
	.long	0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8
	.type	.L_2il0floatpacket.22,@object
	.size	.L_2il0floatpacket.22,32
	.align 32
.L_2il0floatpacket.23:
	.long	0x9999999a,0xbfb99999,0x9999999a,0xbfb99999,0x9999999a,0xbfb99999,0x9999999a,0xbfb99999
	.type	.L_2il0floatpacket.23,@object
	.size	.L_2il0floatpacket.23,32
	.align 8
.L_2il0floatpacket.24:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.24,@object
	.size	.L_2il0floatpacket.24,8
	.data
	.section .note.GNU-stack, ""
# End
