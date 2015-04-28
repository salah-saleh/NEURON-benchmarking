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
# parameter 7(C_g): 16 + %rbp
# parameter 8(C_h): 24 + %rbp
# parameter 9(PVAR_0): 32 + %rbp
# parameter 10(PVAR_1): 40 + %rbp
# parameter 11(PVAR_2): 48 + %rbp
# parameter 12(RHS_0): 56 + %rbp
# parameter 13(V_0): 64 + %rbp
# parameter 14(n): 72 + %rbp
..B1.1:                         # Preds ..B1.0

###     double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){

..___tag_value_NA_CUR_ALT_SMP.1:                                #7.85
..LN0:
  .file   1 "na_cur_alt_smp.c"
   .loc    1  7  is_stmt 1
        pushq     %rbp                                          #7.85
..___tag_value_NA_CUR_ALT_SMP.3:                                #
..LN1:
        movq      %rsp, %rbp                                    #7.85
..___tag_value_NA_CUR_ALT_SMP.4:                                #
..LN2:
        andq      $-32, %rsp                                    #7.85
..LN3:
        pushq     %r12                                          #7.85
..LN4:
        pushq     %r13                                          #7.85
..LN5:
        pushq     %r14                                          #7.85
..LN6:
        pushq     %r15                                          #7.85
..___tag_value_NA_CUR_ALT_SMP.6:                                #
..LN7:
        movq      %r9, %r14                                     #7.85
..LN8:
        movl      72(%rbp), %r15d                               #7.85
..LN9:
        movq      %rdx, %r13                                    #7.85
..LN10:
        movq      24(%rbp), %rax                                #7.85
..LN11:
        movq      %rsi, %r12                                    #7.85
..LN12:
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

        xorl      %r11d, %r11d                                  #33.10
..LN13:
        testl     %r15d, %r15d                                  #33.25
..LN14:
        jle       ..B1.5        # Prob 10%                      #33.25
..LN15:
                                # LOE rax rcx rbx rdi r8 r11 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN16:
        movslq    %r15d, %r10                                   #33.5
..LN17:
        movq      48(%rbp), %rdx                                #33.5
..LN18:
        movq      32(%rbp), %rsi                                #33.5
        .align    16,0x90
..LN19:
                                # LOE rax rdx rcx rbx rsi rdi r8 r10 r11 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.3 ..B1.2
..LN20:
   .loc    1  39  is_stmt 1

###         
###         // C_f[i] *= PVAR_0[i];
###         _mm256_store_pd(&C_f[i], _mm256_mul_pd(_mm256_load_pd(&C_f[i]), _mm256_load_pd(&PVAR_0[i])));
###         // C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         _mm256_store_pd(&C_c[i], _mm256_mul_pd(_mm256_load_pd(&C_a[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), 
###             _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_load_pd(&C_e[i]))))));

        vmovupd   (%rcx,%r11,8), %ymm3                          #39.82
..LN21:
   .loc    1  36  is_stmt 1
        vmovupd   (%r14,%r11,8), %ymm0                          #36.64
..LN22:
   .loc    1  39  is_stmt 1
        vmulpd    (%r8,%r11,8), %ymm3, %ymm2                    #39.52
..LN23:
   .loc    1  36  is_stmt 1
        vmulpd    (%rsi,%r11,8), %ymm0, %ymm1                   #36.34
..LN24:
   .loc    1  39  is_stmt 1
        vmulpd    %ymm2, %ymm3, %ymm4                           #39.13
..LN25:
   .loc    1  36  is_stmt 1
        vmovupd   %ymm1, (%r14,%r11,8)                          #36.26
..LN26:
   .loc    1  38  is_stmt 1
        vmulpd    %ymm4, %ymm3, %ymm5                           #38.73
..LN27:
        vmulpd    (%rdi,%r11,8), %ymm5, %ymm7                   #38.34
..LN28:
   .loc    1  41  is_stmt 1

###         // PVAR_2[i] += C_c[i];
###         _mm256_store_pd(&PVAR_2[i], _mm256_add_pd(_mm256_load_pd(&PVAR_2[i]), _mm256_load_pd(&C_c[i])));

        vaddpd    (%rdx,%r11,8), %ymm7, %ymm6                   #41.37
..LN29:
   .loc    1  38  is_stmt 1
        vmovupd   %ymm7, (%r13,%r11,8)                          #38.26
..LN30:
   .loc    1  44  is_stmt 1

### 
###         // C_h[i] = C_c[i];
###         _mm256_store_pd(&C_h[i], _mm256_load_pd(&C_c[i]));

        vmovupd   %ymm7, (%rax,%r11,8)                          #44.26
..LN31:
   .loc    1  41  is_stmt 1
        vmovupd   %ymm6, (%rdx,%r11,8)                          #41.26
..LN32:
   .loc    1  33  is_stmt 1
        addq      $4, %r11                                      #33.20
..LN33:
        cmpq      %r10, %r11                                    #33.25
..LN34:
        jl        ..B1.3        # Prob 82%                      #33.25
..LN35:
                                # LOE rax rdx rcx rbx rsi rdi r8 r10 r11 r12 r13 r14 r15
..B1.5:                         # Preds ..B1.3 ..B1.1
..LN36:
   .loc    1  48  is_stmt 1

###     }
### 
###     // Dummy
###     if(C_c[n >>1] == 0.)

        movl      %r15d, %r10d                                  #48.16
..LN37:
..LN38:
        sarl      $1, %r10d                                     #48.16
..LN39:
        vxorpd    %xmm1, %xmm1, %xmm1                           #48.5
..LN40:
        movslq    %r10d, %r10                                   #48.8
..LN41:
        vmovsd    (%r13,%r10,8), %xmm0                          #48.8
..LN42:
        vucomisd  %xmm1, %xmm0                                  #48.22
..LN43:
        jp        ..B1.6        # Prob 0%                       #48.22
..LN44:
        je        ..B1.11       # Prob 5%                       #48.22
..LN45:
                                # LOE rax rcx rbx rdi r8 r12 r13 r14 r15
..B1.6:                         # Preds ..B1.14 ..B1.5
..LN46:
   .loc    1  58  is_stmt 1

###         NA_CUR_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###     // // Dummy
###     // if(C_b[n-1] != 0.){
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(2)
###     for (i=0; i<n; i+=4){

        xorl      %eax, %eax                                    #58.10
..LN47:
        testl     %r15d, %r15d                                  #58.25
..LN48:
        jle       ..B1.10       # Prob 10%                      #58.25
..LN49:
                                # LOE rax rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
..LN50:
        movslq    %r15d, %r15                                   #58.5
..LN51:
        movq      64(%rbp), %rcx                                #58.5
..LN52:
        movq      56(%rbp), %rdi                                #58.5
..LN53:
        movq      40(%rbp), %r8                                 #58.5
..LN54:
        movq      16(%rbp), %r10                                #58.5
        .align    16,0x90
..LN55:
                                # LOE rax rcx rbx rdi r8 r10 r12 r13 r14 r15
..B1.8:                         # Preds ..B1.8 ..B1.7
..LN56:
   .loc    1  61  is_stmt 1

### 
###         // C_g[i] = V_0[i];
###         _mm256_store_pd(&C_g[i], _mm256_load_pd(&V_0[i]));

        vmovupd   (%rcx,%rax,8), %ymm0                          #61.50
..LN57:
   .loc    1  66  is_stmt 1

### 
###         // C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
###         _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&V_0[i]), _mm256_load_pd(&C_f[i]))));
###         // RHS_0[i] -= C_b[i]; 
###         _mm256_store_pd(&RHS_0[i], _mm256_sub_pd(_mm256_load_pd(&RHS_0[i]), _mm256_load_pd(&C_b[i])));

        vmovupd   (%rdi,%rax,8), %ymm2                          #66.66
..LN58:
   .loc    1  64  is_stmt 1
        vsubpd    (%r14,%rax,8), %ymm0, %ymm1                   #64.73
..LN59:
   .loc    1  61  is_stmt 1
        vmovupd   %ymm0, (%r10,%rax,8)                          #61.26
..LN60:
   .loc    1  64  is_stmt 1
        vmulpd    (%r13,%rax,8), %ymm1, %ymm4                   #64.34
..LN61:
   .loc    1  66  is_stmt 1
        vsubpd    %ymm4, %ymm2, %ymm3                           #66.36
..LN62:
   .loc    1  68  is_stmt 1

###         // PVAR_1[i] += C_b[i];
###         _mm256_store_pd(&PVAR_1[i], _mm256_add_pd(_mm256_load_pd(&PVAR_1[i]), _mm256_load_pd(&C_b[i])));

        vaddpd    (%r8,%rax,8), %ymm4, %ymm5                    #68.37
..LN63:
   .loc    1  64  is_stmt 1
        vmovupd   %ymm4, (%r12,%rax,8)                          #64.26
..LN64:
   .loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%rdi,%rax,8)                          #66.26
..LN65:
   .loc    1  68  is_stmt 1
        vmovupd   %ymm5, (%r8,%rax,8)                           #68.26
..LN66:
   .loc    1  58  is_stmt 1
        addq      $4, %rax                                      #58.20
..LN67:
        cmpq      %r15, %rax                                    #58.25
..LN68:
        jl        ..B1.8        # Prob 82%                      #58.25
..LN69:
                                # LOE rax rcx rbx rdi r8 r10 r12 r13 r14 r15
..B1.10:                        # Preds ..B1.8 ..B1.6
..LN70:
   .loc    1  87  is_stmt 1

### 
###     }
###     // }
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
..LN71:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm0            #87.12
..___tag_value_NA_CUR_ALT_SMP.10:                               #87.12
..LN72:
        popq      %r15                                          #87.12
..___tag_value_NA_CUR_ALT_SMP.11:                               #87.12
..LN73:
        popq      %r14                                          #87.12
..___tag_value_NA_CUR_ALT_SMP.12:                               #87.12
..LN74:
        popq      %r13                                          #87.12
..___tag_value_NA_CUR_ALT_SMP.13:                               #87.12
..LN75:
        popq      %r12                                          #87.12
..LN76:
        movq      %rbp, %rsp                                    #87.12
..LN77:
        popq      %rbp                                          #87.12
..___tag_value_NA_CUR_ALT_SMP.14:                               #
..LN78:
        ret                                                     #87.12
..___tag_value_NA_CUR_ALT_SMP.16:                               #
..LN79:
                                # LOE
..B1.11:                        # Preds ..B1.5                  # Infreq
..LN80:
   .loc    1  49  is_stmt 1
        movq      %r12, %rsi                                    #49.9
..LN81:
        pushq     %r15                                          #49.9
..LN82:
        pushq     64(%rbp)                                      #49.9
..LN83:
        pushq     56(%rbp)                                      #49.9
..LN84:
        pushq     48(%rbp)                                      #49.9
..LN85:
        pushq     40(%rbp)                                      #49.9
..LN86:
        pushq     32(%rbp)                                      #49.9
..LN87:
        pushq     %rax                                          #49.9
..LN88:
        movq      %r13, %rdx                                    #49.9
..LN89:
        movq      %r14, %r9                                     #49.9
..LN90:
        pushq     16(%rbp)                                      #49.9
..LN91:
        vzeroupper                                              #49.9
..___tag_value_NA_CUR_ALT_SMP.22:                               #49.9
..LN92:
        call      NA_CUR_SMP                                    #49.9
..___tag_value_NA_CUR_ALT_SMP.23:                               #
..LN93:
                                # LOE rbx r12 r13 r14 r15d
..B1.14:                        # Preds ..B1.11                 # Infreq
..LN94:
        addq      $64, %rsp                                     #49.9
..LN95:
        jmp       ..B1.6        # Prob 100%                     #49.9
        .align    16,0x90
..___tag_value_NA_CUR_ALT_SMP.24:                               #
..LN96:
                                # LOE rbx r12 r13 r14 r15d
..LN97:
# mark_end;
	.type	NA_CUR_ALT_SMP,@function
	.size	NA_CUR_ALT_SMP,.-NA_CUR_ALT_SMP
..LNNA_CUR_ALT_SMP.98:
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
