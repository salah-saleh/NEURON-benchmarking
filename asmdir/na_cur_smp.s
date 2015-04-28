	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -vec-report3 -o asmdir/na_cur_smp.s";
	.file "na_cur_smp.c"
	.text
..TXTST0:
L__routine_start_NA_CUR_SMP_0:
# -- Begin  NA_CUR_SMP
# mark_begin;
       .align    16,0x90
	.globl NA_CUR_SMP
NA_CUR_SMP:
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

..___tag_value_NA_CUR_SMP.1:                                    #7.85
..LN0:
  .file   1 "srcdir/na_cur_smp.c"
   .loc    1  7  is_stmt 1
        pushq     %rbp                                          #7.85
..___tag_value_NA_CUR_SMP.3:                                    #
..LN1:
        movq      %rsp, %rbp                                    #7.85
..___tag_value_NA_CUR_SMP.4:                                    #
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
..___tag_value_NA_CUR_SMP.6:                                    #
..LN9:
        movq      %rcx, %r13                                    #7.85
..LN10:
        movl      72(%rbp), %eax                                #7.85
..LN11:
        movq      %rdx, %r14                                    #7.85
..LN12:
        movq      %rsi, %r12                                    #7.85
..LN13:
        movq      %rdi, %rbx                                    #7.85
..LN14:
   .loc    1  31  is_stmt 1

###     int i;
###     double dina, rhs;
### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     likwid_markerStartRegion("NA_CUR_SMP");
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
###     for (i=0; i<n;++i){

        testl     %eax, %eax                                    #31.23
..LN15:
        jle       ..B1.10       # Prob 50%                      #31.23
..LN16:
                                # LOE rax rbx r8 r9 r12 r13 r14
..B1.2:                         # Preds ..B1.1
..LN17:
        movslq    %eax, %r15                                    #31.5
..LN18:
        cmpq      $16, %r15                                     #31.5
..LN19:
        jl        ..B1.47       # Prob 10%                      #31.5
..LN20:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
..LN21:
        movl      %eax, %r10d                                   #31.5
..LN22:
        xorl      %r11d, %r11d                                  #31.5
..LN23:
        andl      $-16, %r10d                                   #31.5
..LN24:
        movslq    %r10d, %r10                                   #31.5
..LN25:
        movq      32(%rbp), %rdx                                #31.5
..LN26:
                                # LOE rax rdx rbx r8 r9 r10 r11 r12 r13 r14 r15
..B1.4:                         # Preds ..B1.4 ..B1.3
..LN27:
   .loc    1  33  is_stmt 1

###         C_f[i] *= PVAR_0[i];
###         C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];

        vmovupd   (%r13,%r11,8), %ymm4                          #33.27
..LN28:
        vmovupd   32(%r13,%r11,8), %ymm11                       #33.27
..LN29:
   .loc    1  32  is_stmt 1
        vmovupd   (%r9,%r11,8), %ymm0                           #32.9
..LN30:
        vmovupd   32(%r9,%r11,8), %ymm7                         #32.9
..LN31:
        vmovupd   64(%r9,%r11,8), %ymm14                        #32.9
..LN32:
   .loc    1  33  is_stmt 1
        vmulpd    (%rbx,%r11,8), %ymm4, %ymm2                   #33.27
..LN33:
        vmulpd    32(%rbx,%r11,8), %ymm11, %ymm9                #33.27
..LN34:
   .loc    1  32  is_stmt 1
        vmulpd    (%rdx,%r11,8), %ymm0, %ymm1                   #32.9
..LN35:
        vmulpd    32(%rdx,%r11,8), %ymm7, %ymm8                 #32.9
..LN36:
        vmulpd    64(%rdx,%r11,8), %ymm14, %ymm15               #32.9
..LN37:
   .loc    1  33  is_stmt 1
        vmulpd    %ymm4, %ymm2, %ymm3                           #33.36
..LN38:
        vmulpd    %ymm11, %ymm9, %ymm10                         #33.36
..LN39:
        vmovupd   64(%r13,%r11,8), %ymm2                        #33.27
..LN40:
        vmovupd   96(%r13,%r11,8), %ymm9                        #33.27
..LN41:
   .loc    1  32  is_stmt 1
        vmovupd   %ymm1, (%r9,%r11,8)                           #32.9
..LN42:
   .loc    1  33  is_stmt 1
        vmulpd    %ymm4, %ymm3, %ymm5                           #33.45
..LN43:
   .loc    1  32  is_stmt 1
        vmovupd   %ymm8, 32(%r9,%r11,8)                         #32.9
..LN44:
   .loc    1  33  is_stmt 1
        vmulpd    64(%rbx,%r11,8), %ymm2, %ymm0                 #33.27
..LN45:
        vmulpd    96(%rbx,%r11,8), %ymm9, %ymm7                 #33.27
..LN46:
        vmulpd    %ymm11, %ymm10, %ymm12                        #33.45
..LN47:
   .loc    1  32  is_stmt 1
        vmovupd   %ymm15, 64(%r9,%r11,8)                        #32.9
..LN48:
   .loc    1  33  is_stmt 1
        vmulpd    (%r8,%r11,8), %ymm5, %ymm6                    #33.54
..LN49:
        vmulpd    %ymm2, %ymm0, %ymm1                           #33.36
..LN50:
        vmulpd    %ymm9, %ymm7, %ymm8                           #33.36
..LN51:
   .loc    1  32  is_stmt 1
        vmovupd   96(%r9,%r11,8), %ymm5                         #32.9
..LN52:
   .loc    1  33  is_stmt 1
        vmulpd    32(%r8,%r11,8), %ymm12, %ymm13                #33.54
..LN53:
        vmovupd   %ymm6, (%r14,%r11,8)                          #33.9
..LN54:
        vmulpd    %ymm2, %ymm1, %ymm3                           #33.45
..LN55:
        vmulpd    %ymm9, %ymm8, %ymm10                          #33.45
..LN56:
   .loc    1  32  is_stmt 1
        vmulpd    96(%rdx,%r11,8), %ymm5, %ymm6                 #32.9
..LN57:
   .loc    1  33  is_stmt 1
        vmovupd   %ymm13, 32(%r14,%r11,8)                       #33.9
..LN58:
        vmulpd    64(%r8,%r11,8), %ymm3, %ymm4                  #33.54
..LN59:
        vmulpd    96(%r8,%r11,8), %ymm10, %ymm11                #33.54
..LN60:
   .loc    1  32  is_stmt 1
        vmovupd   %ymm6, 96(%r9,%r11,8)                         #32.9
..LN61:
   .loc    1  33  is_stmt 1
        vmovupd   %ymm4, 64(%r14,%r11,8)                        #33.9
..LN62:
        vmovupd   %ymm11, 96(%r14,%r11,8)                       #33.9
..LN63:
   .loc    1  31  is_stmt 1
        addq      $16, %r11                                     #31.5
..LN64:
        cmpq      %r10, %r11                                    #31.5
..LN65:
        jb        ..B1.4        # Prob 82%                      #31.5
..LN66:
                                # LOE rax rdx rbx r8 r9 r10 r11 r12 r13 r14 r15
..B1.6:                         # Preds ..B1.4 ..B1.47
..LN67:
        cmpq      %r15, %r10                                    #31.5
..LN68:
        jae       ..B1.10       # Prob 10%                      #31.5
..LN69:
                                # LOE rax rbx r8 r9 r10 r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
..LN70:
        movq      32(%rbp), %r11                                #
..LN71:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15
..B1.8:                         # Preds ..B1.8 ..B1.7
..LN72:
   .loc    1  33  is_stmt 1
        vmovsd    (%r13,%r10,8), %xmm4                          #33.27
..LN73:
        vmulsd    (%rbx,%r10,8), %xmm4, %xmm2                   #33.27
..LN74:
        vmulsd    %xmm4, %xmm2, %xmm3                           #33.36
..LN75:
        vmulsd    %xmm4, %xmm3, %xmm5                           #33.45
..LN76:
   .loc    1  32  is_stmt 1
        vmovsd    (%r9,%r10,8), %xmm0                           #32.9
..LN77:
        vmulsd    (%r11,%r10,8), %xmm0, %xmm1                   #32.9
..LN78:
   .loc    1  33  is_stmt 1
        vmulsd    (%r8,%r10,8), %xmm5, %xmm6                    #33.54
..LN79:
   .loc    1  32  is_stmt 1
        vmovsd    %xmm1, (%r9,%r10,8)                           #32.9
..LN80:
   .loc    1  33  is_stmt 1
        vmovsd    %xmm6, (%r14,%r10,8)                          #33.9
..LN81:
   .loc    1  31  is_stmt 1
        incq      %r10                                          #31.5
..LN82:
        cmpq      %r15, %r10                                    #31.5
..LN83:
        jb        ..B1.8        # Prob 82%                      #31.5
..LN84:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15
..B1.10:                        # Preds ..B1.8 ..B1.1 ..B1.6
..LN85:
   .loc    1  37  is_stmt 1

###     }
### 
###    // Dummy
###     if(C_c[n >>1] == 123456.123456)

        movl      %eax, %r15d                                   #37.16
..LN86:
        sarl      $1, %r15d                                     #37.16
..LN87:
        movslq    %r15d, %r15                                   #37.8
..LN88:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #37.22
..LN89:
        vmovsd    (%r14,%r15,8), %xmm0                          #37.8
..LN90:
        vucomisd  %xmm1, %xmm0                                  #37.22
..LN91:
        jp        ..B1.11       # Prob 0%                       #37.22
..LN92:
        je        ..B1.46       # Prob 5%                       #37.22
..LN93:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.11:                        # Preds ..B1.52 ..B1.10
..LN94:
   .loc    1  44  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;++i){

        testl     %eax, %eax                                    #44.23
..LN95:
        jle       ..B1.20       # Prob 50%                      #44.23
..LN96:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.12:                        # Preds ..B1.11
..LN97:
        movslq    %eax, %r11                                    #44.5
..LN98:
        cmpq      $16, %r11                                     #44.5
..LN99:
        jl        ..B1.45       # Prob 10%                      #44.5
..LN100:
                                # LOE rax rbx r8 r9 r11 r12 r13 r14 r15 xmm1
..B1.13:                        # Preds ..B1.12
..LN101:
        movl      %eax, %r10d                                   #44.5
..LN102:
        xorl      %edx, %edx                                    #44.5
..LN103:
        andl      $-16, %r10d                                   #44.5
..LN104:
        movslq    %r10d, %r10                                   #44.5
..LN105:
        movq      64(%rbp), %rcx                                #44.5
..LN106:
        movq      48(%rbp), %rsi                                #44.5
..LN107:
        movq      16(%rbp), %rdi                                #44.5
        .align    16,0x90
..LN108:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.14:                        # Preds ..B1.14 ..B1.13
..LN109:
   .loc    1  45  is_stmt 1

###         PVAR_2[i] += C_c[i];

        vmovupd   (%rsi,%rdx,8), %ymm0                          #45.9
..LN110:
        vmovupd   32(%rsi,%rdx,8), %ymm4                        #45.9
..LN111:
        vmovupd   64(%rsi,%rdx,8), %ymm7                        #45.9
..LN112:
        vmovupd   96(%rsi,%rdx,8), %ymm10                       #45.9
..LN113:
   .loc    1  46  is_stmt 1

###         C_g[i] = V_0[i];

        vmovupd   (%rcx,%rdx,8), %ymm3                          #46.18
..LN114:
        vmovupd   32(%rcx,%rdx,8), %ymm6                        #46.18
..LN115:
        vmovupd   64(%rcx,%rdx,8), %ymm9                        #46.18
..LN116:
        vmovupd   96(%rcx,%rdx,8), %ymm12                       #46.18
..LN117:
        vmovupd   %ymm3, (%rdi,%rdx,8)                          #46.9
..LN118:
        vmovupd   %ymm6, 32(%rdi,%rdx,8)                        #46.9
..LN119:
        vmovupd   %ymm9, 64(%rdi,%rdx,8)                        #46.9
..LN120:
        vmovupd   %ymm12, 96(%rdi,%rdx,8)                       #46.9
..LN121:
   .loc    1  45  is_stmt 1
        vaddpd    (%r14,%rdx,8), %ymm0, %ymm2                   #45.9
..LN122:
        vaddpd    32(%r14,%rdx,8), %ymm4, %ymm5                 #45.9
..LN123:
        vaddpd    64(%r14,%rdx,8), %ymm7, %ymm8                 #45.9
..LN124:
        vaddpd    96(%r14,%rdx,8), %ymm10, %ymm11               #45.9
..LN125:
        vmovupd   %ymm2, (%rsi,%rdx,8)                          #45.9
..LN126:
        vmovupd   %ymm5, 32(%rsi,%rdx,8)                        #45.9
..LN127:
        vmovupd   %ymm8, 64(%rsi,%rdx,8)                        #45.9
..LN128:
        vmovupd   %ymm11, 96(%rsi,%rdx,8)                       #45.9
..LN129:
   .loc    1  44  is_stmt 1
        addq      $16, %rdx                                     #44.5
..LN130:
        cmpq      %r10, %rdx                                    #44.5
..LN131:
        jb        ..B1.14       # Prob 82%                      #44.5
..LN132:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.16:                        # Preds ..B1.14 ..B1.45
..LN133:
        cmpq      %r11, %r10                                    #44.5
..LN134:
        jae       ..B1.20       # Prob 10%                      #44.5
..LN135:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.17:                        # Preds ..B1.16
..LN136:
        movq      64(%rbp), %rcx                                #
..LN137:
        movq      48(%rbp), %rsi                                #
..LN138:
        movq      16(%rbp), %rdi                                #
..LN139:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.18:                        # Preds ..B1.18 ..B1.17
..LN140:
   .loc    1  45  is_stmt 1
        vmovsd    (%rsi,%r10,8), %xmm0                          #45.9
..LN141:
   .loc    1  46  is_stmt 1
        movq      (%rcx,%r10,8), %rdx                           #46.18
..LN142:
        movq      %rdx, (%rdi,%r10,8)                           #46.9
..LN143:
   .loc    1  45  is_stmt 1
        vaddsd    (%r14,%r10,8), %xmm0, %xmm2                   #45.9
..LN144:
        vmovsd    %xmm2, (%rsi,%r10,8)                          #45.9
..LN145:
   .loc    1  44  is_stmt 1
        incq      %r10                                          #44.5
..LN146:
        cmpq      %r11, %r10                                    #44.5
..LN147:
        jb        ..B1.18       # Prob 82%                      #44.5
..LN148:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.20:                        # Preds ..B1.18 ..B1.11 ..B1.16
..LN149:
   .loc    1  50  is_stmt 1

###     }
### 
###     // Dummy
###     if(C_g[n >>1] == 123456.123456)

        movq      16(%rbp), %r10                                #50.8
..LN150:
        vmovsd    (%r10,%r15,8), %xmm0                          #50.8
..LN151:
        vucomisd  %xmm1, %xmm0                                  #50.22
..LN152:
        jp        ..B1.21       # Prob 0%                       #50.22
..LN153:
        je        ..B1.44       # Prob 5%                       #50.22
..LN154:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.21:                        # Preds ..B1.51 ..B1.20
..LN155:
   .loc    1  56  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;++i){

        testl     %eax, %eax                                    #56.23
..LN156:
        jle       ..B1.30       # Prob 50%                      #56.23
..LN157:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.22:                        # Preds ..B1.21
..LN158:
        movslq    %eax, %r11                                    #56.5
..LN159:
        cmpq      $16, %r11                                     #56.5
..LN160:
        jl        ..B1.43       # Prob 10%                      #56.5
..LN161:
                                # LOE rax rbx r8 r9 r11 r12 r13 r14 r15 xmm1
..B1.23:                        # Preds ..B1.22
..LN162:
        movl      %eax, %r10d                                   #56.5
..LN163:
        xorl      %edx, %edx                                    #56.5
..LN164:
        andl      $-16, %r10d                                   #56.5
..LN165:
        movslq    %r10d, %r10                                   #56.5
..LN166:
        movq      64(%rbp), %rcx                                #56.5
..LN167:
        movq      24(%rbp), %rsi                                #56.5
..LN168:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.24:                        # Preds ..B1.24 ..B1.23
..LN169:
   .loc    1  58  is_stmt 1

###         C_h[i] = C_c[i];
###         C_b[i] = C_c[i] * (V_0[i] - C_f[i]);

        vmovupd   (%rcx,%rdx,8), %ymm0                          #58.28
..LN170:
        vmovupd   32(%rcx,%rdx,8), %ymm5                        #58.28
..LN171:
        vmovupd   64(%rcx,%rdx,8), %ymm9                        #58.28
..LN172:
        vmovupd   96(%rcx,%rdx,8), %ymm13                       #58.28
..LN173:
   .loc    1  57  is_stmt 1
        vmovupd   (%r14,%rdx,8), %ymm2                          #57.18
..LN174:
        vmovupd   32(%r14,%rdx,8), %ymm6                        #57.18
..LN175:
        vmovupd   64(%r14,%rdx,8), %ymm10                       #57.18
..LN176:
        vmovupd   96(%r14,%rdx,8), %ymm14                       #57.18
..LN177:
        vmovupd   %ymm2, (%rsi,%rdx,8)                          #57.9
..LN178:
        vmovupd   %ymm6, 32(%rsi,%rdx,8)                        #57.9
..LN179:
        vmovupd   %ymm10, 64(%rsi,%rdx,8)                       #57.9
..LN180:
        vmovupd   %ymm14, 96(%rsi,%rdx,8)                       #57.9
..LN181:
   .loc    1  58  is_stmt 1
        vsubpd    (%r9,%rdx,8), %ymm0, %ymm3                    #58.37
..LN182:
        vsubpd    32(%r9,%rdx,8), %ymm5, %ymm7                  #58.37
..LN183:
        vsubpd    64(%r9,%rdx,8), %ymm9, %ymm11                 #58.37
..LN184:
        vsubpd    96(%r9,%rdx,8), %ymm13, %ymm15                #58.37
..LN185:
        vmulpd    %ymm3, %ymm2, %ymm4                           #58.37
..LN186:
        vmulpd    %ymm7, %ymm6, %ymm8                           #58.37
..LN187:
        vmulpd    %ymm11, %ymm10, %ymm12                        #58.37
..LN188:
        vmulpd    %ymm15, %ymm14, %ymm0                         #58.37
..LN189:
        vmovupd   %ymm4, (%r12,%rdx,8)                          #58.9
..LN190:
        vmovupd   %ymm8, 32(%r12,%rdx,8)                        #58.9
..LN191:
        vmovupd   %ymm12, 64(%r12,%rdx,8)                       #58.9
..LN192:
        vmovupd   %ymm0, 96(%r12,%rdx,8)                        #58.9
..LN193:
   .loc    1  56  is_stmt 1
        addq      $16, %rdx                                     #56.5
..LN194:
        cmpq      %r10, %rdx                                    #56.5
..LN195:
        jb        ..B1.24       # Prob 82%                      #56.5
..LN196:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.26:                        # Preds ..B1.24 ..B1.43
..LN197:
        cmpq      %r11, %r10                                    #56.5
..LN198:
        jae       ..B1.30       # Prob 10%                      #56.5
..LN199:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.27:                        # Preds ..B1.26
..LN200:
        movq      64(%rbp), %rcx                                #
..LN201:
        movq      24(%rbp), %rsi                                #
..LN202:
                                # LOE rax rcx rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.28:                        # Preds ..B1.28 ..B1.27
..LN203:
   .loc    1  58  is_stmt 1
        vmovsd    (%rcx,%r10,8), %xmm0                          #58.28
..LN204:
   .loc    1  57  is_stmt 1
        movq      (%r14,%r10,8), %rdx                           #57.18
..LN205:
        movq      %rdx, (%rsi,%r10,8)                           #57.9
..LN206:
   .loc    1  58  is_stmt 1
        vsubsd    (%r9,%r10,8), %xmm0, %xmm2                    #58.37
..LN207:
        vmulsd    (%r14,%r10,8), %xmm2, %xmm3                   #58.37
..LN208:
        vmovsd    %xmm3, (%r12,%r10,8)                          #58.9
..LN209:
   .loc    1  56  is_stmt 1
        incq      %r10                                          #56.5
..LN210:
        cmpq      %r11, %r10                                    #56.5
..LN211:
        jb        ..B1.28       # Prob 82%                      #56.5
..LN212:
                                # LOE rax rcx rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.30:                        # Preds ..B1.28 ..B1.21 ..B1.26
..LN213:
   .loc    1  62  is_stmt 1

###     }
### 
###     // Dummy
###     if(C_b[n >>1] == 123456.123456)

        vmovsd    (%r12,%r15,8), %xmm0                          #62.8
..LN214:
        vucomisd  %xmm1, %xmm0                                  #62.22
..LN215:
        jp        ..B1.31       # Prob 0%                       #62.22
..LN216:
        je        ..B1.42       # Prob 5%                       #62.22
..LN217:
                                # LOE rax rbx r8 r9 r12 r13 r14
..B1.31:                        # Preds ..B1.50 ..B1.30
..LN218:
   .loc    1  69  is_stmt 1

###         NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###     #pragma vector aligned
###     #pragma simd
###     //#pragma unroll(8)
###     for (i=0; i<n;++i){

        testl     %eax, %eax                                    #69.23
..LN219:
        jle       ..B1.40       # Prob 50%                      #69.23
..LN220:
                                # LOE rax r12
..B1.32:                        # Preds ..B1.31
..LN221:
        movslq    %eax, %rcx                                    #69.5
..LN222:
        cmpq      $16, %rcx                                     #69.5
..LN223:
        jl        ..B1.41       # Prob 10%                      #69.5
..LN224:
                                # LOE rax rcx r12
..B1.33:                        # Preds ..B1.32
..LN225:
        movq      56(%rbp), %rbx                                #69.5
..LN226:
        xorl      %edx, %edx                                    #69.5
..LN227:
        andl      $-16, %eax                                    #69.5
..LN228:
        movq      40(%rbp), %rdi                                #69.5
..LN229:
        movslq    %eax, %rax                                    #69.5
..LN230:
                                # LOE rax rdx rcx rbx rdi r12
..B1.34:                        # Preds ..B1.34 ..B1.33
..LN231:
   .loc    1  70  is_stmt 1

###         RHS_0[i] -= C_b[i];     

        vmovupd   (%rbx,%rdx,8), %ymm0                          #70.9
..LN232:
        vmovupd   32(%rbx,%rdx,8), %ymm4                        #70.9
..LN233:
        vmovupd   64(%rbx,%rdx,8), %ymm8                        #70.9
..LN234:
        vmovupd   96(%rbx,%rdx,8), %ymm12                       #70.9
..LN235:
        vmovupd   (%r12,%rdx,8), %ymm2                          #70.21
..LN236:
        vmovupd   32(%r12,%rdx,8), %ymm6                        #70.21
..LN237:
        vmovupd   64(%r12,%rdx,8), %ymm10                       #70.21
..LN238:
        vmovupd   96(%r12,%rdx,8), %ymm14                       #70.21
..LN239:
        vsubpd    %ymm2, %ymm0, %ymm1                           #70.9
..LN240:
   .loc    1  71  is_stmt 1

###         PVAR_1[i] += C_b[i];

        vaddpd    (%rdi,%rdx,8), %ymm2, %ymm3                   #71.9
..LN241:
        vaddpd    32(%rdi,%rdx,8), %ymm6, %ymm7                 #71.9
..LN242:
        vaddpd    64(%rdi,%rdx,8), %ymm10, %ymm11               #71.9
..LN243:
        vaddpd    96(%rdi,%rdx,8), %ymm14, %ymm15               #71.9
..LN244:
   .loc    1  70  is_stmt 1
        vsubpd    %ymm6, %ymm4, %ymm5                           #70.9
..LN245:
        vsubpd    %ymm10, %ymm8, %ymm9                          #70.9
..LN246:
        vsubpd    %ymm14, %ymm12, %ymm13                        #70.9
..LN247:
        vmovupd   %ymm1, (%rbx,%rdx,8)                          #70.9
..LN248:
   .loc    1  71  is_stmt 1
        vmovupd   %ymm3, (%rdi,%rdx,8)                          #71.9
..LN249:
   .loc    1  70  is_stmt 1
        vmovupd   %ymm5, 32(%rbx,%rdx,8)                        #70.9
..LN250:
   .loc    1  71  is_stmt 1
        vmovupd   %ymm7, 32(%rdi,%rdx,8)                        #71.9
..LN251:
   .loc    1  70  is_stmt 1
        vmovupd   %ymm9, 64(%rbx,%rdx,8)                        #70.9
..LN252:
   .loc    1  71  is_stmt 1
        vmovupd   %ymm11, 64(%rdi,%rdx,8)                       #71.9
..LN253:
   .loc    1  70  is_stmt 1
        vmovupd   %ymm13, 96(%rbx,%rdx,8)                       #70.9
..LN254:
   .loc    1  71  is_stmt 1
        vmovupd   %ymm15, 96(%rdi,%rdx,8)                       #71.9
..LN255:
   .loc    1  69  is_stmt 1
        addq      $16, %rdx                                     #69.5
..LN256:
        cmpq      %rax, %rdx                                    #69.5
..LN257:
        jb        ..B1.34       # Prob 82%                      #69.5
..LN258:
                                # LOE rax rdx rcx rbx rdi r12
..B1.36:                        # Preds ..B1.34 ..B1.41
..LN259:
        cmpq      %rcx, %rax                                    #69.5
..LN260:
        jae       ..B1.40       # Prob 10%                      #69.5
..LN261:
                                # LOE rax rcx r12
..B1.37:                        # Preds ..B1.36
..LN262:
        movq      56(%rbp), %rdx                                #
..LN263:
        movq      40(%rbp), %rbx                                #
..LN264:
                                # LOE rax rdx rcx rbx r12
..B1.38:                        # Preds ..B1.38 ..B1.37
..LN265:
   .loc    1  70  is_stmt 1
        vmovsd    (%r12,%rax,8), %xmm2                          #70.21
..LN266:
        vmovsd    (%rdx,%rax,8), %xmm0                          #70.9
..LN267:
        vsubsd    %xmm2, %xmm0, %xmm1                           #70.9
..LN268:
   .loc    1  71  is_stmt 1
        vaddsd    (%rbx,%rax,8), %xmm2, %xmm3                   #71.9
..LN269:
   .loc    1  70  is_stmt 1
        vmovsd    %xmm1, (%rdx,%rax,8)                          #70.9
..LN270:
   .loc    1  71  is_stmt 1
        vmovsd    %xmm3, (%rbx,%rax,8)                          #71.9
..LN271:
   .loc    1  69  is_stmt 1
        incq      %rax                                          #69.5
..LN272:
        cmpq      %rcx, %rax                                    #69.5
..LN273:
        jb        ..B1.38       # Prob 82%                      #69.5
..LN274:
                                # LOE rax rdx rcx rbx r12
..B1.40:                        # Preds ..B1.38 ..B1.36 ..B1.31
..LN275:
   .loc    1  88  is_stmt 1

###     }
### 
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("NA_CUR_SMP"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     
### 
###     return 0.1;

        vzeroupper                                              #88.12
..LN276:
        vmovsd    .L_2il0floatpacket.15(%rip), %xmm0            #88.12
..LN277:
        addq      $24, %rsp                                     #88.12
..___tag_value_NA_CUR_SMP.11:                                   #88.12
..LN278:
        popq      %rbx                                          #88.12
..___tag_value_NA_CUR_SMP.12:                                   #88.12
..LN279:
        popq      %r15                                          #88.12
..___tag_value_NA_CUR_SMP.13:                                   #88.12
..LN280:
        popq      %r14                                          #88.12
..___tag_value_NA_CUR_SMP.14:                                   #88.12
..LN281:
        popq      %r13                                          #88.12
..___tag_value_NA_CUR_SMP.15:                                   #88.12
..LN282:
        popq      %r12                                          #88.12
..LN283:
        movq      %rbp, %rsp                                    #88.12
..LN284:
        popq      %rbp                                          #88.12
..___tag_value_NA_CUR_SMP.16:                                   #
..LN285:
        ret                                                     #88.12
..___tag_value_NA_CUR_SMP.18:                                   #
..LN286:
                                # LOE
..B1.41:                        # Preds ..B1.32                 # Infreq
..LN287:
   .loc    1  69  is_stmt 1
        xorl      %eax, %eax                                    #69.5
..LN288:
        jmp       ..B1.36       # Prob 100%                     #69.5
..LN289:
                                # LOE rax rcx r12
..B1.42:                        # Preds ..B1.30                 # Infreq
..LN290:
   .loc    1  63  is_stmt 1
        movq      %rbx, %rdi                                    #63.9
..LN291:
        pushq     %rax                                          #63.9
..LN292:
        pushq     64(%rbp)                                      #63.9
..LN293:
        pushq     56(%rbp)                                      #63.9
..LN294:
        pushq     48(%rbp)                                      #63.9
..LN295:
        pushq     40(%rbp)                                      #63.9
..LN296:
        pushq     32(%rbp)                                      #63.9
..LN297:
        pushq     24(%rbp)                                      #63.9
..LN298:
        movq      %r12, %rsi                                    #63.9
..LN299:
        movq      %r14, %rdx                                    #63.9
..LN300:
        movq      %r13, %rcx                                    #63.9
..LN301:
        pushq     16(%rbp)                                      #63.9
..LN302:
        vzeroupper                                              #63.9
..___tag_value_NA_CUR_SMP.25:                                   #63.9
..LN303:
        call      NA_CUR_ALT_SMP                                #63.9
..___tag_value_NA_CUR_SMP.26:                                   #
..LN304:
                                # LOE r12
..B1.50:                        # Preds ..B1.42                 # Infreq
..LN305:
        movl      72(%rbp), %eax                                #
..LN306:
        addq      $64, %rsp                                     #63.9
..LN307:
        jmp       ..B1.31       # Prob 100%                     #63.9
..LN308:
                                # LOE r12 eax
..B1.43:                        # Preds ..B1.22                 # Infreq
..LN309:
   .loc    1  56  is_stmt 1
        xorl      %r10d, %r10d                                  #56.5
..LN310:
        jmp       ..B1.26       # Prob 100%                     #56.5
..LN311:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.44:                        # Preds ..B1.20                 # Infreq
..LN312:
   .loc    1  51  is_stmt 1
        movq      %rbx, %rdi                                    #51.9
..LN313:
        pushq     %rax                                          #51.9
..LN314:
        pushq     64(%rbp)                                      #51.9
..LN315:
        pushq     56(%rbp)                                      #51.9
..LN316:
        pushq     48(%rbp)                                      #51.9
..LN317:
        pushq     40(%rbp)                                      #51.9
..LN318:
        pushq     32(%rbp)                                      #51.9
..LN319:
        pushq     24(%rbp)                                      #51.9
..LN320:
        pushq     16(%rbp)                                      #51.9
..LN321:
        movq      %r12, %rsi                                    #51.9
..LN322:
        movq      %r14, %rdx                                    #51.9
..LN323:
        movq      %r13, %rcx                                    #51.9
..LN324:
        movq      %r8, 64(%rsp)                                 #51.9
..LN325:
        movq      %r9, 72(%rsp)                                 #51.9
..LN326:
        vzeroupper                                              #51.9
..___tag_value_NA_CUR_SMP.27:                                   #51.9
..LN327:
        call      NA_CUR_ALT_SMP                                #51.9
..___tag_value_NA_CUR_SMP.28:                                   #
..LN328:
                                # LOE rbx r12 r13 r14 r15
..B1.51:                        # Preds ..B1.44                 # Infreq
..LN329:
        movq      72(%rsp), %r9                                 #
..LN330:
        movq      64(%rsp), %r8                                 #
..LN331:
        addq      $64, %rsp                                     #51.9
..LN332:
        movl      72(%rbp), %eax                                #
..LN333:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #
..LN334:
        jmp       ..B1.21       # Prob 100%                     #
..LN335:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.45:                        # Preds ..B1.12                 # Infreq
..LN336:
   .loc    1  44  is_stmt 1
        xorl      %r10d, %r10d                                  #44.5
..LN337:
        jmp       ..B1.16       # Prob 100%                     #44.5
..LN338:
                                # LOE rax rbx r8 r9 r10 r11 r12 r13 r14 r15 xmm1
..B1.46:                        # Preds ..B1.10                 # Infreq
..LN339:
   .loc    1  38  is_stmt 1
        movq      %rbx, %rdi                                    #38.9
..LN340:
        pushq     %rax                                          #38.9
..LN341:
        pushq     64(%rbp)                                      #38.9
..LN342:
        pushq     56(%rbp)                                      #38.9
..LN343:
        pushq     48(%rbp)                                      #38.9
..LN344:
        pushq     40(%rbp)                                      #38.9
..LN345:
        pushq     32(%rbp)                                      #38.9
..LN346:
        pushq     24(%rbp)                                      #38.9
..LN347:
        pushq     16(%rbp)                                      #38.9
..LN348:
        movq      %r12, %rsi                                    #38.9
..LN349:
        movq      %r14, %rdx                                    #38.9
..LN350:
        movq      %r13, %rcx                                    #38.9
..LN351:
        movq      %r8, 64(%rsp)                                 #38.9
..LN352:
        movq      %r9, 72(%rsp)                                 #38.9
..LN353:
        vzeroupper                                              #38.9
..___tag_value_NA_CUR_SMP.29:                                   #38.9
..LN354:
        call      NA_CUR_ALT_SMP                                #38.9
..___tag_value_NA_CUR_SMP.30:                                   #
..LN355:
                                # LOE rbx r12 r13 r14 r15
..B1.52:                        # Preds ..B1.46                 # Infreq
..LN356:
        movq      72(%rsp), %r9                                 #
..LN357:
        movq      64(%rsp), %r8                                 #
..LN358:
        addq      $64, %rsp                                     #38.9
..LN359:
        movl      72(%rbp), %eax                                #
..LN360:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #
..LN361:
        jmp       ..B1.11       # Prob 100%                     #
..LN362:
                                # LOE rax rbx r8 r9 r12 r13 r14 r15 xmm1
..B1.47:                        # Preds ..B1.2                  # Infreq
..LN363:
   .loc    1  31  is_stmt 1
        xorl      %r10d, %r10d                                  #31.5
..LN364:
        jmp       ..B1.6        # Prob 100%                     #31.5
        .align    16,0x90
..___tag_value_NA_CUR_SMP.31:                                   #
..LN365:
                                # LOE rax rbx r8 r9 r10 r12 r13 r14 r15
..LN366:
# mark_end;
	.type	NA_CUR_SMP,@function
	.size	NA_CUR_SMP,.-NA_CUR_SMP
..LNNA_CUR_SMP.367:
.LNNA_CUR_SMP:
	.data
# -- End  NA_CUR_SMP
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
