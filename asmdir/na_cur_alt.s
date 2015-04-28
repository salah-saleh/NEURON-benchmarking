	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -DLIKEXT=0 -vec-report3 -o asmdir/na_cur_alt.s";
	.file "na_cur_alt.c"
	.text
..TXTST0:
L__routine_start_NA_CUR_ALT_0:
# -- Begin  NA_CUR_ALT
# mark_begin;
       .align    16,0x90
	.globl NA_CUR_ALT
NA_CUR_ALT:
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

..___tag_value_NA_CUR_ALT.1:                                    #7.85
..LN0:
  .file   1 "na_cur_alt.c"
   .loc    1  7  is_stmt 1
        movq      %rsi, %r10                                    #7.85
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
###     likwid_markerStartRegion("NA_CUR_ALT");
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

        xorl      %esi, %esi                                    #33.10
..LN3:
        testq     %r11, %r11                                    #33.25
..LN4:
        jle       ..B1.5        # Prob 10%                      #33.25
..LN5:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN6:
   .loc    1  61  is_stmt 1

###         
###         // C_f[i] *= PVAR_0[i];
###         _mm256_store_pd(&C_f[i], _mm256_mul_pd(_mm256_load_pd(&C_f[i]), _mm256_load_pd(&PVAR_0[i])));
###  
###         // C_g[i] = V_0[i] + 0.001;
###         _mm256_store_pd(&C_g[i], _mm256_add_pd(_mm256_load_pd(&V_0[i]), _mm256_set1_pd(0.001)));
###         // C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         _mm256_store_pd(&C_c[i], _mm256_mul_pd(_mm256_load_pd(&C_a[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), 
###             _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_load_pd(&C_e[i]))))));
###         // C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
###         _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&C_g[i]), _mm256_load_pd(&C_f[i]))));
###         // C_h[i] = C_b[i];
###         _mm256_store_pd(&C_h[i], _mm256_load_pd(&C_b[i]));
### 
###         
###         // dina = C_b[i];
###         dina = _mm256_load_pd(&C_b[i]);
### 
###         // C_g[i] = V_0[i] + 0.0;
###         _mm256_store_pd(&C_g[i], _mm256_load_pd(&V_0[i]));
###         //C_c[i] is not modified.
###         // C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
###         _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&C_g[i]), _mm256_load_pd(&C_f[i]))));
###         // rhs = C_b[i];
###         rhs = _mm256_load_pd(&C_b[i]);
### 
###         // PVAR_2[i] += (dina - C_b[i]) * 1000.;
###         _mm256_store_pd(&PVAR_2[i], _mm256_add_pd(_mm256_load_pd(&PVAR_2[i]), _mm256_mul_pd(_mm256_set1_pd(1000.), 

        movq      %r12, -8(%rsp)                                #61.93
..LN7:
        movq      %r13, -16(%rsp)                               #61.93
..LN8:
        movq      %r14, -24(%rsp)                               #61.93
..LN9:
        movq      %rbx, -40(%rsp)                               #61.93
..LN10:
   .loc    1  7  is_stmt 1
        movq      8(%rsp), %rax                                 #7.85
..___tag_value_NA_CUR_ALT.3:                                    #
..LN11:
   .loc    1  61  is_stmt 1
        movq      48(%rsp), %rbx                                #61.93
..LN12:
        movq      40(%rsp), %r11                                #61.93
..LN13:
        movq      32(%rsp), %r12                                #61.93
..LN14:
        movq      24(%rsp), %r13                                #61.93
..LN15:
        movq      16(%rsp), %r14                                #61.93
..LN16:
   .loc    1  39  is_stmt 1
        vmovupd   .L_2il0floatpacket.14(%rip), %ymm1            #39.73
..LN17:
   .loc    1  61  is_stmt 1
        vmovupd   .L_2il0floatpacket.15(%rip), %ymm0            #61.93
..LN18:
        movq      %r15, -32(%rsp)                               #61.93
..___tag_value_NA_CUR_ALT.7:                                    #
..LN19:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 ymm0 ymm1
..B1.3:                         # Preds ..B1.3 ..B1.2
..LN20:
   .loc    1  42  is_stmt 1
        vmovupd   (%rcx,%rsi,8), %ymm4                          #42.82
..LN21:
   .loc    1  36  is_stmt 1
        vmovupd   (%r9,%rsi,8), %ymm2                           #36.64
..LN22:
   .loc    1  42  is_stmt 1
        vmulpd    (%r8,%rsi,8), %ymm4, %ymm3                    #42.52
..LN23:
   .loc    1  36  is_stmt 1
        vmulpd    (%r13,%rsi,8), %ymm2, %ymm10                  #36.34
..LN24:
   .loc    1  42  is_stmt 1
        vmulpd    %ymm3, %ymm4, %ymm5                           #42.13
..LN25:
   .loc    1  36  is_stmt 1
        vmovupd   %ymm10, (%r9,%rsi,8)                          #36.26
..LN26:
   .loc    1  41  is_stmt 1
        vmulpd    %ymm5, %ymm4, %ymm6                           #41.73
..LN27:
   .loc    1  39  is_stmt 1
        movq      56(%rsp), %r15                                #39.64
..LN28:
   .loc    1  41  is_stmt 1
        vmulpd    (%rdi,%rsi,8), %ymm6, %ymm11                  #41.34
..LN29:
   .loc    1  39  is_stmt 1
        vmovupd   (%r15,%rsi,8), %ymm9                          #39.64
..LN30:
   .loc    1  41  is_stmt 1
        vmovupd   %ymm11, (%rdx,%rsi,8)                         #41.26
..LN31:
   .loc    1  53  is_stmt 1
        vmovupd   %ymm9, (%rax,%rsi,8)                          #53.26
..LN32:
   .loc    1  39  is_stmt 1
        vaddpd    %ymm9, %ymm1, %ymm7                           #39.34
..LN33:
   .loc    1  56  is_stmt 1
        vsubpd    %ymm10, %ymm9, %ymm12                         #56.73
..LN34:
   .loc    1  44  is_stmt 1
        vsubpd    %ymm10, %ymm7, %ymm8                          #44.73
..LN35:
   .loc    1  56  is_stmt 1
        vmulpd    %ymm12, %ymm11, %ymm2                         #56.34
..LN36:
   .loc    1  44  is_stmt 1
        vmulpd    %ymm8, %ymm11, %ymm13                         #44.34
..LN37:
   .loc    1  56  is_stmt 1
        vmovupd   %ymm2, (%r10,%rsi,8)                          #56.26
..LN38:
   .loc    1  62  is_stmt 1

###             _mm256_sub_pd(dina, _mm256_load_pd(&C_b[i])))));

        vsubpd    %ymm2, %ymm13, %ymm14                         #62.13
..LN39:
   .loc    1  61  is_stmt 1
        vmulpd    %ymm14, %ymm0, %ymm13                         #61.79
..LN40:
   .loc    1  66  is_stmt 1

###         // C_h[i] = (C_h[i] - rhs) * 1000.;
###         _mm256_store_pd(&C_h[i], _mm256_mul_pd(_mm256_set1_pd(1000.), _mm256_sub_pd(_mm256_load_pd(&C_h[i]), rhs)));
###         // PVAR_1[i] += C_b[i];
###         _mm256_store_pd(&PVAR_1[i], _mm256_add_pd(_mm256_load_pd(&PVAR_1[i]), _mm256_load_pd(&C_b[i])));

        vaddpd    (%r12,%rsi,8), %ymm2, %ymm14                  #66.37
..LN41:
   .loc    1  61  is_stmt 1
        vaddpd    (%r11,%rsi,8), %ymm13, %ymm15                 #61.37
..LN42:
   .loc    1  64  is_stmt 1
        vmovupd   %ymm13, (%r14,%rsi,8)                         #64.26
..LN43:
   .loc    1  66  is_stmt 1
        vmovupd   %ymm14, (%r12,%rsi,8)                         #66.26
..LN44:
   .loc    1  61  is_stmt 1
        vmovupd   %ymm15, (%r11,%rsi,8)                         #61.26
..LN45:
   .loc    1  68  is_stmt 1

###         // RHS_0[i] -= rhs;
###         _mm256_store_pd(&RHS_0[i], _mm256_sub_pd(_mm256_load_pd(&RHS_0[i]), rhs));

        vmovupd   (%rbx,%rsi,8), %ymm15                         #68.66
..LN46:
        vsubpd    %ymm2, %ymm15, %ymm3                          #68.36
..LN47:
        vmovupd   %ymm3, (%rbx,%rsi,8)                          #68.26
..LN48:
   .loc    1  33  is_stmt 1
        addq      $4, %rsi                                      #33.20
..LN49:
        movslq    64(%rsp), %r15                                #33.25
..LN50:
        cmpq      %r15, %rsi                                    #33.25
..LN51:
        jl        ..B1.3        # Prob 82%                      #33.25
..LN52:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 ymm0 ymm1
..B1.4:                         # Preds ..B1.3
..LN53:
        movq      -8(%rsp), %r12                                #
..___tag_value_NA_CUR_ALT.8:                                    #
..LN54:
        movq      -16(%rsp), %r13                               #
..___tag_value_NA_CUR_ALT.9:                                    #
..LN55:
        movq      -24(%rsp), %r14                               #
..___tag_value_NA_CUR_ALT.10:                                   #
..LN56:
        movq      -32(%rsp), %r15                               #
..___tag_value_NA_CUR_ALT.11:                                   #
..LN57:
        movq      -40(%rsp), %rbx                               #
..___tag_value_NA_CUR_ALT.12:                                   #
..LN58:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4 ..B1.1
..LN59:
   .loc    1  84  is_stmt 1

###     }
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     #if !LIKEXT
###     likwid_markerStopRegion("NA_CUR_ALT"); 
###     #endif
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     return 0.1;

        vzeroupper                                              #84.12
..LN60:
        vmovsd    .L_2il0floatpacket.16(%rip), %xmm0            #84.12
..LN61:
        ret                                                     #84.12
        .align    16,0x90
..___tag_value_NA_CUR_ALT.13:                                   #
..LN62:
                                # LOE
..LN63:
# mark_end;
	.type	NA_CUR_ALT,@function
	.size	NA_CUR_ALT,.-NA_CUR_ALT
..LNNA_CUR_ALT.64:
.LNNA_CUR_ALT:
	.data
# -- End  NA_CUR_ALT
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.14:
	.long	0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,32
	.align 32
.L_2il0floatpacket.15:
	.long	0x00000000,0x408f4000,0x00000000,0x408f4000,0x00000000,0x408f4000,0x00000000,0x408f4000
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,32
	.align 8
.L_2il0floatpacket.16:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,8
	.data
	.section .note.GNU-stack, ""
# End
