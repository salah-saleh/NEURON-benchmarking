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
  .file   1 "srcdir/na_cur_alt_smp.c"
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
..LN7:
        pushq     %rbx                                          #7.85
..LN8:
        subq      $24, %rsp                                     #7.85
..___tag_value_NA_CUR_ALT_SMP.6:                                #
..LN9:
        movq      %r9, %r14                                     #7.85
..LN10:
        movl      72(%rbp), %eax                                #7.85
..LN11:
        movq      %r8, %r13                                     #7.85
..LN12:
        movq      %rcx, (%rsp)                                  #7.85
..LN13:
        movq      %rdx, %r12                                    #7.85
..LN14:
        movq      %rdi, 8(%rsp)                                 #7.85
..LN15:
        movq      %rsi, %r15                                    #7.85
..LN16:
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
###     //#pragma unroll(8)
###     for (i=0; i<n;i+=4){

        xorl      %ebx, %ebx                                    #33.10
..LN17:
        testl     %eax, %eax                                    #33.24
..LN18:
        jle       ..B1.5        # Prob 10%                      #33.24
..LN19:
                                # LOE rax rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN20:
        movslq    %eax, %rcx                                    #33.5
..LN21:
        movq      32(%rbp), %rdi                                #33.5
..LN22:
        movq      8(%rsp), %r10                                 #33.5
..LN23:
        movq      (%rsp), %r11                                  #33.5
..LN24:
                                # LOE rax rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.3 ..B1.2
..LN25:
   .loc    1  38  is_stmt 1

###         // C_f[i] *= PVAR_0[i];
###         _mm256_store_pd(&C_f[i], _mm256_mul_pd(_mm256_load_pd(&C_f[i]), _mm256_load_pd(&PVAR_0[i])));
###         // C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         _mm256_store_pd(&C_c[i], _mm256_mul_pd(_mm256_load_pd(&C_a[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), 
###             _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_mul_pd(_mm256_load_pd(&C_d[i]), _mm256_load_pd(&C_e[i]))))));

        vmovupd   (%r11,%rbx,8), %ymm3                          #38.82
..LN26:
   .loc    1  35  is_stmt 1
        vmovupd   (%r14,%rbx,8), %ymm0                          #35.64
..LN27:
   .loc    1  38  is_stmt 1
        vmulpd    (%r13,%rbx,8), %ymm3, %ymm2                   #38.52
..LN28:
   .loc    1  35  is_stmt 1
        vmulpd    (%rdi,%rbx,8), %ymm0, %ymm1                   #35.34
..LN29:
   .loc    1  38  is_stmt 1
        vmulpd    %ymm2, %ymm3, %ymm4                           #38.13
..LN30:
   .loc    1  35  is_stmt 1
        vmovupd   %ymm1, (%r14,%rbx,8)                          #35.26
..LN31:
   .loc    1  37  is_stmt 1
        vmulpd    %ymm4, %ymm3, %ymm5                           #37.73
..LN32:
        vmulpd    (%r10,%rbx,8), %ymm5, %ymm6                   #37.34
..LN33:
        vmovupd   %ymm6, (%r12,%rbx,8)                          #37.26
..LN34:
   .loc    1  33  is_stmt 1
        addq      $4, %rbx                                      #33.19
..LN35:
        cmpq      %rcx, %rbx                                    #33.24
..LN36:
        jl        ..B1.3        # Prob 82%                      #33.24
..LN37:
                                # LOE rax rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.5:                         # Preds ..B1.3 ..B1.1
..LN38:
   .loc    1  42  is_stmt 1

###     }
### 
###    // Dummy
###     if(C_c[n >>1] == 123456.123456)

        movl      %eax, %ebx                                    #42.16
..LN39:
        sarl      $1, %ebx                                      #42.16
..LN40:
        movslq    %ebx, %rbx                                    #42.8
..LN41:
        vmovsd    (%r12,%rbx,8), %xmm0                          #42.8
..LN42:
        vucomisd  .L_2il0floatpacket.14(%rip), %xmm0            #42.22
..LN43:
        jne       ..B1.7        # Prob 42%                      #42.22
..LN44:
        jp        ..B1.7        # Prob 0%                       #42.22
..LN45:
                                # LOE rax rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
..LN46:
   .loc    1  43  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

        movl      %eax, %eax                                    #43.9
..LN47:
        movq      %r15, %rsi                                    #43.9
..LN48:
        pushq     %rax                                          #43.9
..LN49:
        pushq     64(%rbp)                                      #43.9
..LN50:
        pushq     56(%rbp)                                      #43.9
..LN51:
        pushq     48(%rbp)                                      #43.9
..LN52:
        pushq     40(%rbp)                                      #43.9
..LN53:
        pushq     32(%rbp)                                      #43.9
..LN54:
        pushq     24(%rbp)                                      #43.9
..LN55:
        pushq     16(%rbp)                                      #43.9
..LN56:
        movq      %r12, %rdx                                    #43.9
..LN57:
        movq      %r13, %r8                                     #43.9
..LN58:
        movq      %r14, %r9                                     #43.9
..LN59:
        movq      72(%rsp), %rdi                                #43.9
..LN60:
        movq      64(%rsp), %rcx                                #43.9
..LN61:
        vzeroupper                                              #43.9
..___tag_value_NA_CUR_ALT_SMP.11:                               #43.9
..LN62:
        call      NA_CUR_ALT_SMP                                #43.9
..___tag_value_NA_CUR_ALT_SMP.12:                               #
..LN63:
                                # LOE rbx r12 r13 r14 r15
..B1.26:                        # Preds ..B1.6
..LN64:
        movl      72(%rbp), %eax                                #
..LN65:
        addq      $64, %rsp                                     #43.9
..LN66:
                                # LOE rax rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.26 ..B1.5
..LN67:
   .loc    1  49  is_stmt 1

### 
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;i+=4){

        xorl      %edi, %edi                                    #49.10
..LN68:
        testl     %eax, %eax                                    #49.24
..LN69:
        jle       ..B1.11       # Prob 10%                      #49.24
..LN70:
                                # LOE rax rbx rdi r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
..LN71:
        movslq    %eax, %rcx                                    #49.5
..LN72:
        movq      64(%rbp), %r10                                #49.5
..LN73:
        movq      48(%rbp), %r11                                #49.5
..LN74:
        movq      16(%rbp), %rdx                                #49.5
..LN75:
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.9:                         # Preds ..B1.9 ..B1.8
..LN76:
   .loc    1  51  is_stmt 1

###         // PVAR_2[i] += C_c[i];
###         _mm256_store_pd(&PVAR_2[i], _mm256_add_pd(_mm256_load_pd(&PVAR_2[i]), _mm256_load_pd(&C_c[i])));

        vmovupd   (%r11,%rdi,8), %ymm0                          #51.67
..LN77:
   .loc    1  53  is_stmt 1

###         // C_g[i] = V_0[i];
###         _mm256_store_pd(&C_g[i], _mm256_load_pd(&V_0[i]));

        vmovupd   (%r10,%rdi,8), %ymm2                          #53.50
..LN78:
   .loc    1  51  is_stmt 1
        vaddpd    (%r12,%rdi,8), %ymm0, %ymm1                   #51.37
..LN79:
   .loc    1  53  is_stmt 1
        vmovupd   %ymm2, (%rdx,%rdi,8)                          #53.26
..LN80:
   .loc    1  51  is_stmt 1
        vmovupd   %ymm1, (%r11,%rdi,8)                          #51.26
..LN81:
   .loc    1  49  is_stmt 1
        addq      $4, %rdi                                      #49.19
..LN82:
        cmpq      %rcx, %rdi                                    #49.24
..LN83:
        jl        ..B1.9        # Prob 82%                      #49.24
..LN84:
                                # LOE rax rdx rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.11:                        # Preds ..B1.9 ..B1.7
..LN85:
   .loc    1  57  is_stmt 1

###     }
### 
###     // Dummy
###     if(C_g[n >>1] == 123456.123456)

        movq      16(%rbp), %rcx                                #57.8
..LN86:
        vmovsd    (%rcx,%rbx,8), %xmm0                          #57.8
..LN87:
        vucomisd  .L_2il0floatpacket.14(%rip), %xmm0            #57.22
..LN88:
        jne       ..B1.13       # Prob 42%                      #57.22
..LN89:
        jp        ..B1.13       # Prob 0%                       #57.22
..LN90:
                                # LOE rax rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
..LN91:
   .loc    1  58  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

        movl      %eax, %eax                                    #58.9
..LN92:
        movq      %r15, %rsi                                    #58.9
..LN93:
        pushq     %rax                                          #58.9
..LN94:
        pushq     64(%rbp)                                      #58.9
..LN95:
        pushq     56(%rbp)                                      #58.9
..LN96:
        pushq     48(%rbp)                                      #58.9
..LN97:
        pushq     40(%rbp)                                      #58.9
..LN98:
        pushq     32(%rbp)                                      #58.9
..LN99:
        pushq     24(%rbp)                                      #58.9
..LN100:
        pushq     16(%rbp)                                      #58.9
..LN101:
        movq      %r12, %rdx                                    #58.9
..LN102:
        movq      %r13, %r8                                     #58.9
..LN103:
        movq      %r14, %r9                                     #58.9
..LN104:
        movq      72(%rsp), %rdi                                #58.9
..LN105:
        movq      64(%rsp), %rcx                                #58.9
..LN106:
        vzeroupper                                              #58.9
..___tag_value_NA_CUR_ALT_SMP.13:                               #58.9
..LN107:
        call      NA_CUR_ALT_SMP                                #58.9
..___tag_value_NA_CUR_ALT_SMP.14:                               #
..LN108:
                                # LOE rbx r12 r13 r14 r15
..B1.27:                        # Preds ..B1.12
..LN109:
        movl      72(%rbp), %eax                                #
..LN110:
        addq      $64, %rsp                                     #58.9
..LN111:
                                # LOE rax rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.27 ..B1.11
..LN112:
   .loc    1  63  is_stmt 1

### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;i+=4){

        xorl      %edi, %edi                                    #63.10
..LN113:
        testl     %eax, %eax                                    #63.24
..LN114:
        jle       ..B1.17       # Prob 10%                      #63.24
..LN115:
                                # LOE rax rbx rdi r12 r13 r14 r15
..B1.14:                        # Preds ..B1.13
..LN116:
        movslq    %eax, %rcx                                    #63.5
..LN117:
        movq      64(%rbp), %r10                                #63.5
..LN118:
        movq      24(%rbp), %r11                                #63.5
..LN119:
                                # LOE rax rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.15:                        # Preds ..B1.15 ..B1.14
..LN120:
   .loc    1  67  is_stmt 1

###         // C_h[i] = C_c[i];
###         _mm256_store_pd(&C_h[i], _mm256_load_pd(&C_c[i]));
###         // C_b[i] = C_c[i] * (V_0[i] - C_f[i]);
###         _mm256_store_pd(&C_b[i], _mm256_mul_pd(_mm256_load_pd(&C_c[i]), _mm256_sub_pd(_mm256_load_pd(&V_0[i]), _mm256_load_pd(&C_f[i]))));

        vmovupd   (%r10,%rdi,8), %ymm0                          #67.103
..LN121:
   .loc    1  65  is_stmt 1
        vmovupd   (%r12,%rdi,8), %ymm1                          #65.50
..LN122:
   .loc    1  67  is_stmt 1
        vsubpd    (%r14,%rdi,8), %ymm0, %ymm2                   #67.73
..LN123:
   .loc    1  65  is_stmt 1
        vmovupd   %ymm1, (%r11,%rdi,8)                          #65.26
..LN124:
   .loc    1  67  is_stmt 1
        vmulpd    %ymm2, %ymm1, %ymm3                           #67.34
..LN125:
        vmovupd   %ymm3, (%r15,%rdi,8)                          #67.26
..LN126:
   .loc    1  63  is_stmt 1
        addq      $4, %rdi                                      #63.19
..LN127:
        cmpq      %rcx, %rdi                                    #63.24
..LN128:
        jl        ..B1.15       # Prob 82%                      #63.24
..LN129:
                                # LOE rax rcx rbx rdi r10 r11 r12 r13 r14 r15
..B1.17:                        # Preds ..B1.15 ..B1.13
..LN130:
   .loc    1  71  is_stmt 1

###     }
### 
###     // Dummy
###     if(C_b[n >>1] == 123456.123456)

        vmovsd    (%r15,%rbx,8), %xmm0                          #71.8
..LN131:
        vucomisd  .L_2il0floatpacket.14(%rip), %xmm0            #71.22
..LN132:
        jne       ..B1.19       # Prob 42%                      #71.22
..LN133:
        jp        ..B1.19       # Prob 0%                       #71.22
..LN134:
                                # LOE rax r12 r13 r14 r15
..B1.18:                        # Preds ..B1.17
..LN135:
   .loc    1  72  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);

        movq      %r15, %rsi                                    #72.9
..LN136:
        pushq     %rax                                          #72.9
..LN137:
        pushq     64(%rbp)                                      #72.9
..LN138:
        pushq     56(%rbp)                                      #72.9
..LN139:
        pushq     48(%rbp)                                      #72.9
..LN140:
        pushq     40(%rbp)                                      #72.9
..LN141:
        pushq     32(%rbp)                                      #72.9
..LN142:
        pushq     24(%rbp)                                      #72.9
..LN143:
        pushq     16(%rbp)                                      #72.9
..LN144:
        movq      %r12, %rdx                                    #72.9
..LN145:
        movq      %r13, %r8                                     #72.9
..LN146:
        movq      %r14, %r9                                     #72.9
..LN147:
        movq      72(%rsp), %rdi                                #72.9
..LN148:
        movq      64(%rsp), %rcx                                #72.9
..LN149:
        vzeroupper                                              #72.9
..___tag_value_NA_CUR_ALT_SMP.15:                               #72.9
..LN150:
        call      NA_CUR_ALT_SMP                                #72.9
..___tag_value_NA_CUR_ALT_SMP.16:                               #
..LN151:
                                # LOE r15
..B1.28:                        # Preds ..B1.18
..LN152:
        movl      72(%rbp), %eax                                #
..LN153:
        addq      $64, %rsp                                     #72.9
..LN154:
                                # LOE r15 eax
..B1.19:                        # Preds ..B1.28 ..B1.17
..LN155:
   .loc    1  78  is_stmt 1

### 
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;i+=4){

        xorl      %edx, %edx                                    #78.10
..LN156:
        testl     %eax, %eax                                    #78.24
..LN157:
        jle       ..B1.23       # Prob 10%                      #78.24
..LN158:
                                # LOE rax rdx r15
..B1.20:                        # Preds ..B1.19
..LN159:
        movslq    %eax, %rax                                    #78.5
..LN160:
        movq      56(%rbp), %rcx                                #78.5
..LN161:
        movq      40(%rbp), %rbx                                #78.5
..LN162:
                                # LOE rax rdx rcx rbx r15
..B1.21:                        # Preds ..B1.21 ..B1.20
..LN163:
   .loc    1  80  is_stmt 1

###         // RHS_0[i] -= C_b[i]; 
###         _mm256_store_pd(&RHS_0[i], _mm256_sub_pd(_mm256_load_pd(&RHS_0[i]), _mm256_load_pd(&C_b[i])));

        vmovupd   (%r15,%rdx,8), %ymm2                          #80.93
..LN164:
        vmovupd   (%rcx,%rdx,8), %ymm0                          #80.66
..LN165:
   .loc    1  82  is_stmt 1

###         // PVAR_1[i] += C_b[i];
###         _mm256_store_pd(&PVAR_1[i], _mm256_add_pd(_mm256_load_pd(&PVAR_1[i]), _mm256_load_pd(&C_b[i])));

        vaddpd    (%rbx,%rdx,8), %ymm2, %ymm3                   #82.37
..LN166:
   .loc    1  80  is_stmt 1
        vsubpd    %ymm2, %ymm0, %ymm1                           #80.36
..LN167:
   .loc    1  82  is_stmt 1
        vmovupd   %ymm3, (%rbx,%rdx,8)                          #82.26
..LN168:
   .loc    1  80  is_stmt 1
        vmovupd   %ymm1, (%rcx,%rdx,8)                          #80.26
..LN169:
   .loc    1  78  is_stmt 1
        addq      $4, %rdx                                      #78.19
..LN170:
        cmpq      %rax, %rdx                                    #78.24
..LN171:
        jl        ..B1.21       # Prob 82%                      #78.24
..LN172:
                                # LOE rax rdx rcx rbx r15
..B1.23:                        # Preds ..B1.21 ..B1.19
..LN173:
   .loc    1  99  is_stmt 1

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

        vzeroupper                                              #99.12
..LN174:
        vmovsd    .L_2il0floatpacket.15(%rip), %xmm0            #99.12
..LN175:
        addq      $24, %rsp                                     #99.12
..___tag_value_NA_CUR_ALT_SMP.17:                               #99.12
..LN176:
        popq      %rbx                                          #99.12
..___tag_value_NA_CUR_ALT_SMP.18:                               #99.12
..LN177:
        popq      %r15                                          #99.12
..___tag_value_NA_CUR_ALT_SMP.19:                               #99.12
..LN178:
        popq      %r14                                          #99.12
..___tag_value_NA_CUR_ALT_SMP.20:                               #99.12
..LN179:
        popq      %r13                                          #99.12
..___tag_value_NA_CUR_ALT_SMP.21:                               #99.12
..LN180:
        popq      %r12                                          #99.12
..LN181:
        movq      %rbp, %rsp                                    #99.12
..LN182:
        popq      %rbp                                          #99.12
..___tag_value_NA_CUR_ALT_SMP.22:                               #
..LN183:
        ret                                                     #99.12
        .align    16,0x90
..___tag_value_NA_CUR_ALT_SMP.24:                               #
..LN184:
                                # LOE
..LN185:
# mark_end;
	.type	NA_CUR_ALT_SMP,@function
	.size	NA_CUR_ALT_SMP,.-NA_CUR_ALT_SMP
..LNNA_CUR_ALT_SMP.186:
.LNNA_CUR_ALT_SMP:
	.data
# -- End  NA_CUR_ALT_SMP
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.14:
	.long	0xf9acffa8,0x40fe2401
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,8
	.align 8
.L_2il0floatpacket.15:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,8
	.data
	.section .note.GNU-stack, ""
# End
