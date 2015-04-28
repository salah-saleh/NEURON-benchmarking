	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -vec-report3 -o asmdir/na_cur_alt_smp.s";
	.file "na_cur_alt_smp.c"
	.text
..TXTST0:
L__routine_start_NA_CUR_ALT_SMP_0:
# -- Begin  NA_CUR_ALT_SMP
# mark_begin;
       .align    16,0x90
	.globl NA_CUR_ALT_SMP
NA_CUR_ALT_SMP:
# parameter 1(C_a): %rdi
# parameter 2(C_b): %rsi
# parameter 3(C_c): %rdx
# parameter 4(C_d): %rcx
# parameter 5(C_e): %r8
# parameter 6(C_f): %r9
# parameter 7(C_g): 8 + %rsp
# parameter 8(C_h): 16 + %rsp
# parameter 9(PVAR_0): 24 + %rsp
# parameter 10(PVAR_1): 32 + %rsp
# parameter 11(PVAR_2): 40 + %rsp
# parameter 12(RHS_0): 48 + %rsp
# parameter 13(V_0): 56 + %rsp
# parameter 14(n): 64 + %rsp
..B1.1:                         # Preds ..B1.0

###     double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){

..___tag_value_NA_CUR_ALT_SMP.1:                                #7.85
..LN0:
  .file   1 "na_cur_alt_smp.c"
   .loc    1  7  is_stmt 1
        movq      %rdi, %r10                                    #7.85
..LN1:
        movslq    64(%rsp), %r11                                #7.85
..LN2:
   .loc    1  33  is_stmt 1

###     int i;
###     __m256d dina, rhs;
### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     #if !LIKEXT
###     likwid_markerStartRegion("NA_CUR_ALT_SMP");
###     #endif
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
###     #pragma simd
###     //#pragma unroll(2)
###     for (i=0; i<n; i+=4){

        xorl      %edi, %edi                                    #33.10
..LN3:
        testq     %r11, %r11                                    #33.25
..LN4:
        jle       ..B1.5        # Prob 10%                      #33.25
..LN5:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN6:
   .loc    1  7  is_stmt 1
        movq      %r15, -24(%rsp)                               #7.85
..LN7:
        movq      %rbx, -16(%rsp)                               #7.85
..LN8:
        movq      16(%rsp), %rax                                #7.85
..___tag_value_NA_CUR_ALT_SMP.3:                                #
..LN9:
        movq      40(%rsp), %rbx                                #7.85
..LN10:
        movq      24(%rsp), %r15                                #7.85
        .align    16,0x90
..LN11:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.3 ..B1.2
..LN12:
   .loc    1  39  is_stmt 1

###         
###         // C_f[i] *= PVAR_0[i];
###         _mm256_store_pd(&C_f[i], _mm256_mul_pd(_mm256_load_pd(&C_f[i]), _mm256_load_pd(&PVAR_0[i])));
###         // C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         _mm256_store_pd(&C_c[i], _mm256_mul_pd(_mm256_load_pd(&C_a[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), 
###             _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_load_pd(&C_e[i]))))));

        vmovupd   (%rcx,%rdi,8), %ymm3                          #39.82
..LN13:
   .loc    1  36  is_stmt 1
        vmovupd   (%r9,%rdi,8), %ymm0                           #36.64
..LN14:
   .loc    1  39  is_stmt 1
        vmulpd    (%r8,%rdi,8), %ymm3, %ymm2                    #39.52
..LN15:
   .loc    1  36  is_stmt 1
        vmulpd    (%r15,%rdi,8), %ymm0, %ymm1                   #36.34
..LN16:
   .loc    1  39  is_stmt 1
        vmulpd    %ymm2, %ymm3, %ymm4                           #39.13
..LN17:
   .loc    1  36  is_stmt 1
        vmovupd   %ymm1, (%r9,%rdi,8)                           #36.26
..LN18:
   .loc    1  38  is_stmt 1
        vmulpd    %ymm4, %ymm3, %ymm5                           #38.73
..LN19:
        vmulpd    (%r10,%rdi,8), %ymm5, %ymm7                   #38.34
..LN20:
   .loc    1  41  is_stmt 1

###         // PVAR_2[i] += C_c[i];
###         _mm256_store_pd(&PVAR_2[i], _mm256_add_pd(_mm256_load_pd(&PVAR_2[i]), _mm256_load_pd(&C_c[i])));

        vaddpd    (%rbx,%rdi,8), %ymm7, %ymm6                   #41.37
..LN21:
   .loc    1  38  is_stmt 1
        vmovupd   %ymm7, (%rdx,%rdi,8)                          #38.26
..LN22:
   .loc    1  44  is_stmt 1

### 
###         // C_h[i] = C_c[i];
###         _mm256_store_pd(&C_h[i], _mm256_load_pd(&C_c[i]));

        vmovupd   %ymm7, (%rax,%rdi,8)                          #44.26
..LN23:
   .loc    1  41  is_stmt 1
        vmovupd   %ymm6, (%rbx,%rdi,8)                          #41.26
..LN24:
   .loc    1  33  is_stmt 1
        addq      $4, %rdi                                      #33.20
..LN25:
        cmpq      %r11, %rdi                                    #33.25
..LN26:
        jl        ..B1.3        # Prob 82%                      #33.25
..LN27:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
..LN28:
        movq      -24(%rsp), %r15                               #
..___tag_value_NA_CUR_ALT_SMP.5:                                #
..LN29:
        movq      -16(%rsp), %rbx                               #
..___tag_value_NA_CUR_ALT_SMP.6:                                #
..LN30:
                                # LOE rdx rbx rbp rsi r9 r11 r12 r13 r14 r15
..B1.5:                         # Preds ..B1.1 ..B1.4

###     }
### 
###     // // Dummy
###     // if(C_c[n >>1] == 0.)
###     //     NA_CUR_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###     // Dummy
###     if(C_b[n-1] != 0.){

..LN31:
   .loc    1  53  is_stmt 1
..LN32:
        vmovsd    -8(%rsi,%r11,8), %xmm0                        #53.8
..LN33:
        vxorpd    %xmm1, %xmm1, %xmm1                           #53.5
..LN34:
        vucomisd  %xmm1, %xmm0                                  #53.20
..LN35:
        jp        ..B1.6        # Prob 0%                       #53.20
..LN36:
        je        ..B1.10       # Prob 16%                      #53.20
..LN37:
                                # LOE rdx rbx rbp rsi r9 r11 r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
..LN38:
   .loc    1  58  is_stmt 1

### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(2)
###     for (i=0; i<n; i+=4){

        xorl      %r10d, %r10d                                  #58.10
..LN39:
        testq     %r11, %r11                                    #58.25
..LN40:
        jle       ..B1.10       # Prob 10%                      #58.25
..LN41:
                                # LOE rdx rbx rbp rsi r9 r10 r11 r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
..LN42:
   .loc    1  7  is_stmt 1
        movq      8(%rsp), %r8                                  #7.85
..LN43:
        movq      32(%rsp), %rdi                                #7.85
..LN44:
        movq      48(%rsp), %rcx                                #7.85
..LN45:
        movq      56(%rsp), %rax                                #7.85
        .align    16,0x90
..LN46:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.8:                         # Preds ..B1.8 ..B1.7
..LN47:
   .loc    1  61  is_stmt 1

### 
###         // C_g[i] = V_0[i];
###         _mm256_store_pd(&C_g[i], _mm256_load_pd(&V_0[i]));

        vmovupd   (%rax,%r10,8), %ymm0                          #61.50
..LN48:
   .loc    1  66  is_stmt 1

### 
###         // C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
###         _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&V_0[i]), _mm256_load_pd(&C_f[i]))));
###         // RHS_0[i] -= C_b[i]; 
###         _mm256_store_pd(&RHS_0[i], _mm256_sub_pd(_mm256_load_pd(&RHS_0[i]), _mm256_load_pd(&C_b[i])));

        vmovupd   (%rcx,%r10,8), %ymm2                          #66.66
..LN49:
   .loc    1  64  is_stmt 1
        vsubpd    (%r9,%r10,8), %ymm0, %ymm1                    #64.73
..LN50:
   .loc    1  61  is_stmt 1
        vmovupd   %ymm0, (%r8,%r10,8)                           #61.26
..LN51:
   .loc    1  64  is_stmt 1
        vmulpd    (%rdx,%r10,8), %ymm1, %ymm4                   #64.34
..LN52:
   .loc    1  66  is_stmt 1
        vsubpd    %ymm4, %ymm2, %ymm3                           #66.36
..LN53:
   .loc    1  68  is_stmt 1

###         // PVAR_1[i] += C_b[i];
###         _mm256_store_pd(&PVAR_1[i], _mm256_add_pd(_mm256_load_pd(&PVAR_1[i]), _mm256_load_pd(&C_b[i])));

        vaddpd    (%rdi,%r10,8), %ymm4, %ymm5                   #68.37
..LN54:
   .loc    1  64  is_stmt 1
        vmovupd   %ymm4, (%rsi,%r10,8)                          #64.26
..LN55:
   .loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%rcx,%r10,8)                          #66.26
..LN56:
   .loc    1  68  is_stmt 1
        vmovupd   %ymm5, (%rdi,%r10,8)                          #68.26
..LN57:
   .loc    1  58  is_stmt 1
        addq      $4, %r10                                      #58.20
..LN58:
        cmpq      %r11, %r10                                    #58.25
..LN59:
        jl        ..B1.8        # Prob 82%                      #58.25
..LN60:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.10:                        # Preds ..B1.8 ..B1.6 ..B1.5
..LN61:
   .loc    1  87  is_stmt 1

### 
###     }
###     }
### 
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     #if !LIKEXT
###     likwid_markerStopRegion("NA_CUR_ALT_SMP"); 
###     #endif
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     return 0.1;

        vzeroupper                                              #87.12
..LN62:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm0            #87.12
..LN63:
        ret                                                     #87.12
        .align    16,0x90
..___tag_value_NA_CUR_ALT_SMP.7:                                #
..LN64:
                                # LOE
..LN65:
# mark_end;
	.type	NA_CUR_ALT_SMP,@function
	.size	NA_CUR_ALT_SMP,.-NA_CUR_ALT_SMP
..LNNA_CUR_ALT_SMP.66:
.LNNA_CUR_ALT_SMP:
	.data
# -- End  NA_CUR_ALT_SMP
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.14:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,8
	.data
	.section .note.GNU-stack, ""
# End
