	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -vec-report3 -o asmdir/na_cur_fnl.s";
	.file "na_cur_fnl.c"
	.text
..TXTST0:
L__routine_start_NA_CUR_FNL_0:
# -- Begin  NA_CUR_FNL
# mark_begin;
       .align    16,0x90
	.globl NA_CUR_FNL
NA_CUR_FNL:
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

..___tag_value_NA_CUR_FNL.1:                                    #7.85
..LN0:
  .file   1 "srcdir/na_cur_fnl.c"
   .loc    1  7  is_stmt 1
        pushq     %rbp                                          #7.85
..___tag_value_NA_CUR_FNL.3:                                    #
..LN1:
        movq      %rsp, %rbp                                    #7.85
..___tag_value_NA_CUR_FNL.4:                                    #
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
        subq      $88, %rsp                                     #7.85
..LN9:
   .loc    1  28  is_stmt 1

###     int i, z;
###     double dina, rhs;
### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     likwid_markerStartRegion("NA_CUR_FNL");
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
###     for (z = 0; ((z < n)); z+=176)//&&(C_b[n-1] != 100000.12345)

        xorl      %r11d, %r11d                                  #28.5
..___tag_value_NA_CUR_FNL.6:                                    #
..LN10:
        xorl      %r15d, %r15d                                  #
..LN11:
   .loc    1  7  is_stmt 1
        movq      %rsi, %r13                                    #7.85
..LN12:
        movl      72(%rbp), %esi                                #7.85
..LN13:
        movq      %rdx, %r14                                    #7.85
..LN14:
        movq      %rdi, %r12                                    #7.85
..LN15:
        xorl      %r10d, %r10d                                  #
..LN16:
        xorl      %ebx, %ebx                                    #
..LN17:
   .loc    1  28  is_stmt 1
        testl     %esi, %esi                                    #28.23
..LN18:
        jle       ..B1.44       # Prob 10%                      #28.23
..LN19:
                                # LOE rcx rbx r8 r9 r12 r13 r14 r15 esi r10d r11d
..B1.2:                         # Preds ..B1.1
..LN20:
   .loc    1  40  is_stmt 1

###     {
### 
###         #pragma vector aligned
###         #pragma simd
###         //#pragma unroll(8)
###         for (i=z; i<((z+176)<n ? (z+176):n); ++i){
###             C_f[i] *= PVAR_0[i];
###             C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         }
### 
###        // Dummy
###         if(C_c[n >>1] == 123456.123456)

        movl      %esi, %edi                                    #40.20
..LN21:
        movq      $0x2e8ba2e8ba2e8ba3, %rax                     #
..LN22:
        sarl      $1, %edi                                      #40.20
..LN23:
        movslq    %edi, %rdi                                    #40.12
..LN24:
        movq      %rdi, 64(%rsp)                                #40.12
..LN25:
   .loc    1  7  is_stmt 1
        movslq    %esi, %rdi                                    #7.85
..LN26:
        addq      $175, %rdi                                    #7.85
..LN27:
        imulq     %rdi                                          #
..LN28:
        shrq      $5, %rdx                                      #
..LN29:
        sarq      $63, %rdi                                     #
..LN30:
        subq      %rdi, %rdx                                    #
..LN31:
   .loc    1  40  is_stmt 1
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #40.26
..LN32:
        movl      %edx, 72(%rsp)                                #
..LN33:
        movl      %r11d, 80(%rsp)                               #
..LN34:
        movq      %r12, 16(%rsp)                                #
..LN35:
        movq      %rcx, 24(%rsp)                                #
..LN36:
        movq      %r8, 32(%rsp)                                 #
..LN37:
        movq      %r9, 40(%rsp)                                 #
..LN38:
                                # LOE rbx r13 r14 r15 r10d xmm1
..B1.3:                         # Preds ..B1.42 ..B1.2
..LN39:
   .loc    1  34  is_stmt 1
        movl      72(%rbp), %eax                                #34.14
..LN40:
        lea       176(%r10), %r12d                              #34.14
..LN41:
        cmpl      %eax, %r12d                                   #34.14
..LN42:
        cmovge    %eax, %r12d                                   #34.14
..LN43:
        cmpl      %r10d, %r12d                                  #34.50
..LN44:
        jle       ..B1.12       # Prob 50%                      #34.50
..LN45:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.4:                         # Preds ..B1.3
..LN46:
        movslq    %r12d, %rcx                                   #34.9
..LN47:
        addq      %rbx, %rcx                                    #34.9
..LN48:
        cmpq      $16, %rcx                                     #34.9
..LN49:
        jl        ..B1.51       # Prob 10%                      #34.9
..LN50:
                                # LOE rcx rbx r13 r14 r15 r10d r12d xmm1
..B1.5:                         # Preds ..B1.4
..LN51:
   .loc    1  36  is_stmt 1
        movq      24(%rsp), %rsi                                #36.31
..LN52:
   .loc    1  34  is_stmt 1
        movl      %ecx, %eax                                    #34.9
..LN53:
   .loc    1  35  is_stmt 1
        movq      40(%rsp), %r11                                #35.13
..LN54:
   .loc    1  34  is_stmt 1
        andl      $-16, %eax                                    #34.9
..LN55:
   .loc    1  36  is_stmt 1
        movq      16(%rsp), %rdi                                #36.22
..LN56:
   .loc    1  34  is_stmt 1
        xorl      %edx, %edx                                    #34.9
..LN57:
   .loc    1  35  is_stmt 1
        movq      32(%rbp), %r8                                 #35.23
..LN58:
   .loc    1  36  is_stmt 1
        lea       (%rsi,%r15,8), %rsi                           #36.31
..LN59:
        movq      %rsi, 56(%rsp)                                #36.31
..LN60:
   .loc    1  35  is_stmt 1
        lea       (%r11,%r15,8), %r11                           #35.13
..LN61:
   .loc    1  36  is_stmt 1
        movq      32(%rsp), %rsi                                #36.58
..LN62:
        lea       (%rdi,%r15,8), %rdi                           #36.22
..LN63:
        movq      %r14, 8(%rsp)                                 #36.58
..LN64:
   .loc    1  35  is_stmt 1
        lea       (%r8,%r15,8), %r9                             #35.23
..LN65:
   .loc    1  34  is_stmt 1
        movslq    %eax, %rax                                    #34.9
..LN66:
   .loc    1  36  is_stmt 1
        lea       (%r14,%r15,8), %r8                            #36.13
..LN67:
        lea       (%rsi,%r15,8), %rsi                           #36.58
..LN68:
        movq      %rsi, 48(%rsp)                                #36.58
..LN69:
        movq      48(%rsp), %r14                                #36.58
..LN70:
        movq      56(%rsp), %rsi                                #36.58
..LN71:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.6:                         # Preds ..B1.6 ..B1.5
..LN72:
        vmovupd   (%rsi,%rdx,8), %ymm5                          #36.31
..LN73:
        vmovupd   32(%rsi,%rdx,8), %ymm12                       #36.31
..LN74:
   .loc    1  35  is_stmt 1
        vmovupd   (%r11,%rdx,8), %ymm0                          #35.13
..LN75:
        vmovupd   32(%r11,%rdx,8), %ymm8                        #35.13
..LN76:
        vmovupd   64(%r11,%rdx,8), %ymm15                       #35.13
..LN77:
   .loc    1  36  is_stmt 1
        vmulpd    (%rdi,%rdx,8), %ymm5, %ymm3                   #36.31
..LN78:
        vmulpd    32(%rdi,%rdx,8), %ymm12, %ymm10               #36.31
..LN79:
   .loc    1  35  is_stmt 1
        vmulpd    (%r9,%rdx,8), %ymm0, %ymm2                    #35.13
..LN80:
        vmulpd    32(%r9,%rdx,8), %ymm8, %ymm9                  #35.13
..LN81:
        vmulpd    64(%r9,%rdx,8), %ymm15, %ymm0                 #35.13
..LN82:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm5, %ymm3, %ymm4                           #36.40
..LN83:
        vmulpd    %ymm12, %ymm10, %ymm11                        #36.40
..LN84:
   .loc    1  35  is_stmt 1
        vmovupd   %ymm2, (%r11,%rdx,8)                          #35.13
..LN85:
        vmovupd   %ymm9, 32(%r11,%rdx,8)                        #35.13
..LN86:
        vmovupd   %ymm0, 64(%r11,%rdx,8)                        #35.13
..LN87:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm5, %ymm4, %ymm6                           #36.49
..LN88:
        vmulpd    %ymm12, %ymm11, %ymm13                        #36.49
..LN89:
        vmovupd   64(%rsi,%rdx,8), %ymm4                        #36.31
..LN90:
        vmovupd   96(%rsi,%rdx,8), %ymm11                       #36.31
..LN91:
        vmulpd    (%r14,%rdx,8), %ymm6, %ymm7                   #36.58
..LN92:
        vmulpd    32(%r14,%rdx,8), %ymm13, %ymm14               #36.58
..LN93:
        vmulpd    64(%rdi,%rdx,8), %ymm4, %ymm2                 #36.31
..LN94:
        vmulpd    96(%rdi,%rdx,8), %ymm11, %ymm9                #36.31
..LN95:
        vmovupd   %ymm7, (%r8,%rdx,8)                           #36.13
..LN96:
   .loc    1  35  is_stmt 1
        vmovupd   96(%r11,%rdx,8), %ymm7                        #35.13
..LN97:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm4, %ymm2, %ymm3                           #36.40
..LN98:
        vmulpd    %ymm11, %ymm9, %ymm10                         #36.40
..LN99:
        vmovupd   %ymm14, 32(%r8,%rdx,8)                        #36.13
..LN100:
   .loc    1  35  is_stmt 1
        vmulpd    96(%r9,%rdx,8), %ymm7, %ymm8                  #35.13
..LN101:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm4, %ymm3, %ymm5                           #36.49
..LN102:
        vmulpd    %ymm11, %ymm10, %ymm12                        #36.49
..LN103:
   .loc    1  35  is_stmt 1
        vmovupd   %ymm8, 96(%r11,%rdx,8)                        #35.13
..LN104:
   .loc    1  36  is_stmt 1
        vmulpd    64(%r14,%rdx,8), %ymm5, %ymm6                 #36.58
..LN105:
        vmulpd    96(%r14,%rdx,8), %ymm12, %ymm13               #36.58
..LN106:
        vmovupd   %ymm6, 64(%r8,%rdx,8)                         #36.13
..LN107:
        vmovupd   %ymm13, 96(%r8,%rdx,8)                        #36.13
..LN108:
   .loc    1  34  is_stmt 1
        addq      $16, %rdx                                     #34.9
..LN109:
        cmpq      %rax, %rdx                                    #34.9
..LN110:
        jb        ..B1.6        # Prob 82%                      #34.9
..LN111:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.7:                         # Preds ..B1.6
..LN112:
        movq      8(%rsp), %r14                                 #
..LN113:
                                # LOE rax rcx rbx r13 r14 r15 r10d r12d xmm1
..B1.8:                         # Preds ..B1.7 ..B1.51
..LN114:
        cmpq      %rcx, %rax                                    #34.9
..LN115:
        jae       ..B1.12       # Prob 10%                      #34.9
..LN116:
                                # LOE rax rcx rbx r13 r14 r15 r10d r12d xmm1
..B1.9:                         # Preds ..B1.8
..LN117:
   .loc    1  35  is_stmt 1
        movq      40(%rsp), %r9                                 #35.13
..LN118:
   .loc    1  36  is_stmt 1
        movq      16(%rsp), %r8                                 #36.22
..LN119:
        movq      24(%rsp), %rdi                                #36.49
..LN120:
        movq      32(%rsp), %rsi                                #36.58
..LN121:
   .loc    1  35  is_stmt 1
        lea       (%r9,%r15,8), %rdx                            #35.13
..LN122:
        movq      32(%rbp), %r11                                #35.23
..LN123:
   .loc    1  36  is_stmt 1
        lea       (%r14,%r15,8), %r9                            #36.13
..LN124:
        lea       (%r8,%r15,8), %r8                             #36.22
..LN125:
        lea       (%rdi,%r15,8), %rdi                           #36.49
..LN126:
   .loc    1  35  is_stmt 1
        lea       (%r11,%r15,8), %r11                           #35.23
..LN127:
   .loc    1  36  is_stmt 1
        lea       (%rsi,%r15,8), %rsi                           #36.58
..LN128:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.10:                        # Preds ..B1.10 ..B1.9
..LN129:
        vmovsd    (%rdi,%rax,8), %xmm5                          #36.31
..LN130:
        vmulsd    (%r8,%rax,8), %xmm5, %xmm3                    #36.31
..LN131:
        vmulsd    %xmm5, %xmm3, %xmm4                           #36.40
..LN132:
        vmulsd    %xmm5, %xmm4, %xmm6                           #36.49
..LN133:
   .loc    1  35  is_stmt 1
        vmovsd    (%rdx,%rax,8), %xmm0                          #35.13
..LN134:
        vmulsd    (%r11,%rax,8), %xmm0, %xmm2                   #35.13
..LN135:
   .loc    1  36  is_stmt 1
        vmulsd    (%rsi,%rax,8), %xmm6, %xmm7                   #36.58
..LN136:
   .loc    1  35  is_stmt 1
        vmovsd    %xmm2, (%rdx,%rax,8)                          #35.13
..LN137:
   .loc    1  36  is_stmt 1
        vmovsd    %xmm7, (%r9,%rax,8)                           #36.13
..LN138:
   .loc    1  34  is_stmt 1
        incq      %rax                                          #34.9
..LN139:
        cmpq      %rcx, %rax                                    #34.9
..LN140:
        jb        ..B1.10       # Prob 82%                      #34.9
..LN141:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.12:                        # Preds ..B1.10 ..B1.3 ..B1.8
..LN142:
   .loc    1  40  is_stmt 1
        movq      64(%rsp), %rax                                #40.12
..LN143:
        vmovsd    (%r14,%rax,8), %xmm0                          #40.12
..LN144:
        vucomisd  %xmm1, %xmm0                                  #40.26
..LN145:
        jp        ..B1.13       # Prob 0%                       #40.26
..LN146:
        je        ..B1.50       # Prob 5%                       #40.26
..LN147:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.13:                        # Preds ..B1.56 ..B1.12
..LN148:
   .loc    1  47  is_stmt 1

###             NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###         #pragma vector aligned
###         #pragma simd
###         //#pragma unroll(8)
###         for (i=z; i<((z+176)<n ? (z+176):n); ++i){

        cmpl      %r10d, %r12d                                  #47.50
..LN149:
        jle       ..B1.22       # Prob 50%                      #47.50
..LN150:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.14:                        # Preds ..B1.13
..LN151:
        movslq    %r12d, %r8                                    #47.9
..LN152:
        addq      %rbx, %r8                                     #47.9
..LN153:
        cmpq      $16, %r8                                      #47.9
..LN154:
        jl        ..B1.49       # Prob 10%                      #47.9
..LN155:
                                # LOE rbx r8 r13 r14 r15 r10d r12d xmm1
..B1.15:                        # Preds ..B1.14
..LN156:
   .loc    1  48  is_stmt 1

###             PVAR_2[i] += C_c[i];

        movq      48(%rbp), %rax                                #48.13
..LN157:
   .loc    1  47  is_stmt 1
        movl      %r8d, %edi                                    #47.9
..LN158:
   .loc    1  49  is_stmt 1

###             C_g[i] = V_0[i];

        movq      16(%rbp), %r9                                 #49.13
..LN159:
   .loc    1  47  is_stmt 1
        andl      $-16, %edi                                    #47.9
..LN160:
   .loc    1  49  is_stmt 1
        movq      64(%rbp), %r11                                #49.22
..LN161:
   .loc    1  47  is_stmt 1
        xorl      %ecx, %ecx                                    #47.9
..LN162:
        movslq    %edi, %rdi                                    #47.9
..LN163:
   .loc    1  48  is_stmt 1
        lea       (%rax,%r15,8), %rax                           #48.13
..LN164:
   .loc    1  49  is_stmt 1
        lea       (%r9,%r15,8), %rdx                            #49.13
..LN165:
        lea       (%r11,%r15,8), %r11                           #49.22
..LN166:
   .loc    1  48  is_stmt 1
        lea       (%r14,%r15,8), %r9                            #48.26
..LN167:
                                # LOE rax rdx rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.16:                        # Preds ..B1.16 ..B1.15
..LN168:
        vmovupd   (%rax,%rcx,8), %ymm0                          #48.13
..LN169:
        vmovupd   32(%rax,%rcx,8), %ymm4                        #48.13
..LN170:
        vmovupd   64(%rax,%rcx,8), %ymm7                        #48.13
..LN171:
        vmovupd   96(%rax,%rcx,8), %ymm10                       #48.13
..LN172:
   .loc    1  49  is_stmt 1
        vmovupd   (%r11,%rcx,8), %ymm3                          #49.22
..LN173:
        vmovupd   32(%r11,%rcx,8), %ymm6                        #49.22
..LN174:
        vmovupd   64(%r11,%rcx,8), %ymm9                        #49.22
..LN175:
        vmovupd   96(%r11,%rcx,8), %ymm12                       #49.22
..LN176:
        vmovupd   %ymm3, (%rdx,%rcx,8)                          #49.13
..LN177:
        vmovupd   %ymm6, 32(%rdx,%rcx,8)                        #49.13
..LN178:
        vmovupd   %ymm9, 64(%rdx,%rcx,8)                        #49.13
..LN179:
        vmovupd   %ymm12, 96(%rdx,%rcx,8)                       #49.13
..LN180:
   .loc    1  48  is_stmt 1
        vaddpd    (%r9,%rcx,8), %ymm0, %ymm2                    #48.13
..LN181:
        vaddpd    32(%r9,%rcx,8), %ymm4, %ymm5                  #48.13
..LN182:
        vaddpd    64(%r9,%rcx,8), %ymm7, %ymm8                  #48.13
..LN183:
        vaddpd    96(%r9,%rcx,8), %ymm10, %ymm11                #48.13
..LN184:
        vmovupd   %ymm2, (%rax,%rcx,8)                          #48.13
..LN185:
        vmovupd   %ymm5, 32(%rax,%rcx,8)                        #48.13
..LN186:
        vmovupd   %ymm8, 64(%rax,%rcx,8)                        #48.13
..LN187:
        vmovupd   %ymm11, 96(%rax,%rcx,8)                       #48.13
..LN188:
   .loc    1  47  is_stmt 1
        addq      $16, %rcx                                     #47.9
..LN189:
        cmpq      %rdi, %rcx                                    #47.9
..LN190:
        jb        ..B1.16       # Prob 82%                      #47.9
..LN191:
                                # LOE rax rdx rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.18:                        # Preds ..B1.16 ..B1.49
..LN192:
        cmpq      %r8, %rdi                                     #47.9
..LN193:
        jae       ..B1.22       # Prob 10%                      #47.9
..LN194:
                                # LOE rbx rdi r8 r13 r14 r15 r10d r12d xmm1
..B1.19:                        # Preds ..B1.18
..LN195:
   .loc    1  48  is_stmt 1
        movq      48(%rbp), %rax                                #48.13
..LN196:
   .loc    1  49  is_stmt 1
        movq      16(%rbp), %r11                                #49.13
..LN197:
        movq      64(%rbp), %rcx                                #49.22
..LN198:
   .loc    1  48  is_stmt 1
        lea       (%rax,%r15,8), %rax                           #48.13
..LN199:
   .loc    1  49  is_stmt 1
        lea       (%r11,%r15,8), %r11                           #49.13
..LN200:
        lea       (%rcx,%r15,8), %r9                            #49.22
..LN201:
   .loc    1  48  is_stmt 1
        lea       (%r14,%r15,8), %rcx                           #48.26
..LN202:
                                # LOE rax rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.20:                        # Preds ..B1.20 ..B1.19
..LN203:
        vmovsd    (%rax,%rdi,8), %xmm0                          #48.13
..LN204:
   .loc    1  49  is_stmt 1
        movq      (%r9,%rdi,8), %rdx                            #49.22
..LN205:
        movq      %rdx, (%r11,%rdi,8)                           #49.13
..LN206:
   .loc    1  48  is_stmt 1
        vaddsd    (%rcx,%rdi,8), %xmm0, %xmm2                   #48.13
..LN207:
        vmovsd    %xmm2, (%rax,%rdi,8)                          #48.13
..LN208:
   .loc    1  47  is_stmt 1
        incq      %rdi                                          #47.9
..LN209:
        cmpq      %r8, %rdi                                     #47.9
..LN210:
        jb        ..B1.20       # Prob 82%                      #47.9
..LN211:
                                # LOE rax rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.22:                        # Preds ..B1.20 ..B1.13 ..B1.18
..LN212:
   .loc    1  53  is_stmt 1

###         }
### 
###         // Dummy
###         if(C_g[n >>1] == 123456.123456)

        movq      16(%rbp), %rax                                #53.12
..LN213:
        movq      64(%rsp), %rcx                                #53.12
..LN214:
        vmovsd    (%rax,%rcx,8), %xmm0                          #53.12
..LN215:
        vucomisd  %xmm1, %xmm0                                  #53.26
..LN216:
        jp        ..B1.23       # Prob 0%                       #53.26
..LN217:
        je        ..B1.48       # Prob 5%                       #53.26
..LN218:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.23:                        # Preds ..B1.55 ..B1.22
..LN219:
   .loc    1  59  is_stmt 1

###             NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
###         #pragma vector aligned
###         #pragma simd
###         //#pragma unroll(8)
###         for (i=z; i<((z+176)<n ? (z+176):n); ++i){

        cmpl      %r10d, %r12d                                  #59.50
..LN220:
        jle       ..B1.32       # Prob 50%                      #59.50
..LN221:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.24:                        # Preds ..B1.23
..LN222:
        movslq    %r12d, %rax                                   #59.9
..LN223:
        addq      %rbx, %rax                                    #59.9
..LN224:
        cmpq      $16, %rax                                     #59.9
..LN225:
        jl        ..B1.47       # Prob 10%                      #59.9
..LN226:
                                # LOE rax rbx r13 r14 r15 r10d r12d xmm1
..B1.25:                        # Preds ..B1.24
..LN227:
   .loc    1  60  is_stmt 1

###             C_h[i] = C_c[i];

        movq      24(%rbp), %r8                                 #60.13
..LN228:
   .loc    1  59  is_stmt 1
        movl      %eax, %ecx                                    #59.9
..LN229:
   .loc    1  61  is_stmt 1

###             C_b[i] = C_c[i] * (V_0[i] - C_f[i]);

        movq      64(%rbp), %rdi                                #61.32
..LN230:
   .loc    1  59  is_stmt 1
        andl      $-16, %ecx                                    #59.9
..LN231:
   .loc    1  61  is_stmt 1
        movq      40(%rsp), %rdx                                #61.41
..LN232:
   .loc    1  59  is_stmt 1
        xorl      %r11d, %r11d                                  #59.9
..LN233:
        movslq    %ecx, %rcx                                    #59.9
..LN234:
   .loc    1  60  is_stmt 1
        lea       (%r8,%r15,8), %r9                             #60.13
..LN235:
   .loc    1  61  is_stmt 1
        lea       (%r13,%r15,8), %r8                            #61.13
..LN236:
        lea       (%rdi,%r15,8), %rdi                           #61.32
..LN237:
        lea       (%rdx,%r15,8), %rsi                           #61.41
..LN238:
   .loc    1  60  is_stmt 1
        lea       (%r14,%r15,8), %rdx                           #60.22
..LN239:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.26:                        # Preds ..B1.26 ..B1.25
..LN240:
   .loc    1  61  is_stmt 1
        vmovupd   (%rdi,%r11,8), %ymm0                          #61.32
..LN241:
        vmovupd   32(%rdi,%r11,8), %ymm5                        #61.32
..LN242:
        vmovupd   64(%rdi,%r11,8), %ymm9                        #61.32
..LN243:
        vmovupd   96(%rdi,%r11,8), %ymm13                       #61.32
..LN244:
   .loc    1  60  is_stmt 1
        vmovupd   (%rdx,%r11,8), %ymm2                          #60.22
..LN245:
        vmovupd   32(%rdx,%r11,8), %ymm6                        #60.22
..LN246:
        vmovupd   64(%rdx,%r11,8), %ymm10                       #60.22
..LN247:
        vmovupd   96(%rdx,%r11,8), %ymm14                       #60.22
..LN248:
        vmovupd   %ymm2, (%r9,%r11,8)                           #60.13
..LN249:
        vmovupd   %ymm6, 32(%r9,%r11,8)                         #60.13
..LN250:
        vmovupd   %ymm10, 64(%r9,%r11,8)                        #60.13
..LN251:
        vmovupd   %ymm14, 96(%r9,%r11,8)                        #60.13
..LN252:
   .loc    1  61  is_stmt 1
        vsubpd    (%rsi,%r11,8), %ymm0, %ymm3                   #61.41
..LN253:
        vsubpd    32(%rsi,%r11,8), %ymm5, %ymm7                 #61.41
..LN254:
        vsubpd    64(%rsi,%r11,8), %ymm9, %ymm11                #61.41
..LN255:
        vsubpd    96(%rsi,%r11,8), %ymm13, %ymm15               #61.41
..LN256:
        vmulpd    %ymm3, %ymm2, %ymm4                           #61.41
..LN257:
        vmulpd    %ymm7, %ymm6, %ymm8                           #61.41
..LN258:
        vmulpd    %ymm11, %ymm10, %ymm12                        #61.41
..LN259:
        vmulpd    %ymm15, %ymm14, %ymm0                         #61.41
..LN260:
        vmovupd   %ymm4, (%r8,%r11,8)                           #61.13
..LN261:
        vmovupd   %ymm8, 32(%r8,%r11,8)                         #61.13
..LN262:
        vmovupd   %ymm12, 64(%r8,%r11,8)                        #61.13
..LN263:
        vmovupd   %ymm0, 96(%r8,%r11,8)                         #61.13
..LN264:
   .loc    1  59  is_stmt 1
        addq      $16, %r11                                     #59.9
..LN265:
        cmpq      %rcx, %r11                                    #59.9
..LN266:
        jb        ..B1.26       # Prob 82%                      #59.9
..LN267:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.28:                        # Preds ..B1.26 ..B1.47
..LN268:
        cmpq      %rax, %rcx                                    #59.9
..LN269:
        jae       ..B1.32       # Prob 10%                      #59.9
..LN270:
                                # LOE rax rcx rbx r13 r14 r15 r10d r12d xmm1
..B1.29:                        # Preds ..B1.28
..LN271:
   .loc    1  60  is_stmt 1
        movq      24(%rbp), %r8                                 #60.13
..LN272:
   .loc    1  61  is_stmt 1
        movq      64(%rbp), %rdi                                #61.32
..LN273:
        movq      40(%rsp), %r11                                #61.41
..LN274:
   .loc    1  60  is_stmt 1
        lea       (%r8,%r15,8), %r9                             #60.13
..LN275:
   .loc    1  61  is_stmt 1
        lea       (%r13,%r15,8), %r8                            #61.13
..LN276:
        lea       (%rdi,%r15,8), %rdi                           #61.32
..LN277:
        lea       (%r11,%r15,8), %rdx                           #61.41
..LN278:
   .loc    1  60  is_stmt 1
        lea       (%r14,%r15,8), %r11                           #60.22
..LN279:
                                # LOE rax rdx rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.30:                        # Preds ..B1.30 ..B1.29
..LN280:
   .loc    1  61  is_stmt 1
        vmovsd    (%rdi,%rcx,8), %xmm0                          #61.32
..LN281:
   .loc    1  60  is_stmt 1
        movq      (%r11,%rcx,8), %rsi                           #60.22
..LN282:
        movq      %rsi, (%r9,%rcx,8)                            #60.13
..LN283:
   .loc    1  61  is_stmt 1
        vsubsd    (%rdx,%rcx,8), %xmm0, %xmm2                   #61.41
..LN284:
        vmulsd    (%r11,%rcx,8), %xmm2, %xmm3                   #61.41
..LN285:
        vmovsd    %xmm3, (%r8,%rcx,8)                           #61.13
..LN286:
   .loc    1  59  is_stmt 1
        incq      %rcx                                          #59.9
..LN287:
        cmpq      %rax, %rcx                                    #59.9
..LN288:
        jb        ..B1.30       # Prob 82%                      #59.9
..LN289:
                                # LOE rax rdx rcx rbx rdi r8 r9 r11 r13 r14 r15 r10d r12d xmm1
..B1.32:                        # Preds ..B1.30 ..B1.23 ..B1.28
..LN290:
   .loc    1  65  is_stmt 1

###         }
### 
###         // Dummy
###         if(C_b[n >>1] == 123456.123456)

        movq      64(%rsp), %rax                                #65.12
..LN291:
        vmovsd    (%r13,%rax,8), %xmm0                          #65.12
..LN292:
        vucomisd  %xmm1, %xmm0                                  #65.26
..LN293:
        jp        ..B1.33       # Prob 0%                       #65.26
..LN294:
        je        ..B1.46       # Prob 5%                       #65.26
..LN295:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.33:                        # Preds ..B1.54 ..B1.32
..LN296:
   .loc    1  72  is_stmt 1

###             NA_CUR_ALT_SMP(C_a, C_b, C_c, C_d, C_e, C_f, C_g, C_h, PVAR_0, PVAR_1, PVAR_2, RHS_0, V_0, n);
### 
### 
###         #pragma vector aligned
###         #pragma simd
###         //#pragma unroll(8)
###         for (i=z; i<((z+176)<n ? (z+176):n); ++i){

        cmpl      %r10d, %r12d                                  #72.50
..LN297:
        jle       ..B1.42       # Prob 50%                      #72.50
..LN298:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.34:                        # Preds ..B1.33
..LN299:
        movslq    %r12d, %r12                                   #72.9
..LN300:
        addq      %rbx, %r12                                    #72.9
..LN301:
        cmpq      $16, %r12                                     #72.9
..LN302:
        jl        ..B1.45       # Prob 10%                      #72.9
..LN303:
                                # LOE rbx r12 r13 r14 r15 r10d xmm1
..B1.35:                        # Preds ..B1.34
..LN304:
   .loc    1  73  is_stmt 1

###             RHS_0[i] -= C_b[i];     

        movq      56(%rbp), %r8                                 #73.13
..LN305:
   .loc    1  72  is_stmt 1
        movl      %r12d, %eax                                   #72.9
..LN306:
   .loc    1  74  is_stmt 1

###             PVAR_1[i] += C_b[i];

        movq      40(%rbp), %rcx                                #74.13
..LN307:
   .loc    1  72  is_stmt 1
        andl      $-16, %eax                                    #72.9
..LN308:
        movslq    %eax, %rax                                    #72.9
..LN309:
        xorl      %r9d, %r9d                                    #72.9
..LN310:
   .loc    1  73  is_stmt 1
        lea       (%r8,%r15,8), %r8                             #73.13
..LN311:
   .loc    1  74  is_stmt 1
        lea       (%rcx,%r15,8), %rdi                           #74.13
..LN312:
   .loc    1  73  is_stmt 1
        lea       (%r13,%r15,8), %rcx                           #73.25
..LN313:
                                # LOE rax rcx rbx rdi r8 r9 r12 r13 r14 r15 r10d xmm1
..B1.36:                        # Preds ..B1.36 ..B1.35
..LN314:
        vmovupd   (%r8,%r9,8), %ymm0                            #73.13
..LN315:
        vmovupd   32(%r8,%r9,8), %ymm5                          #73.13
..LN316:
        vmovupd   64(%r8,%r9,8), %ymm9                          #73.13
..LN317:
        vmovupd   96(%r8,%r9,8), %ymm13                         #73.13
..LN318:
        vmovupd   (%rcx,%r9,8), %ymm3                           #73.25
..LN319:
        vmovupd   32(%rcx,%r9,8), %ymm7                         #73.25
..LN320:
        vmovupd   64(%rcx,%r9,8), %ymm11                        #73.25
..LN321:
        vmovupd   96(%rcx,%r9,8), %ymm15                        #73.25
..LN322:
        vsubpd    %ymm3, %ymm0, %ymm2                           #73.13
..LN323:
   .loc    1  74  is_stmt 1
        vaddpd    (%rdi,%r9,8), %ymm3, %ymm4                    #74.13
..LN324:
        vaddpd    32(%rdi,%r9,8), %ymm7, %ymm8                  #74.13
..LN325:
        vaddpd    64(%rdi,%r9,8), %ymm11, %ymm12                #74.13
..LN326:
        vaddpd    96(%rdi,%r9,8), %ymm15, %ymm0                 #74.13
..LN327:
   .loc    1  73  is_stmt 1
        vsubpd    %ymm7, %ymm5, %ymm6                           #73.13
..LN328:
        vsubpd    %ymm11, %ymm9, %ymm10                         #73.13
..LN329:
        vsubpd    %ymm15, %ymm13, %ymm14                        #73.13
..LN330:
        vmovupd   %ymm2, (%r8,%r9,8)                            #73.13
..LN331:
   .loc    1  74  is_stmt 1
        vmovupd   %ymm4, (%rdi,%r9,8)                           #74.13
..LN332:
   .loc    1  73  is_stmt 1
        vmovupd   %ymm6, 32(%r8,%r9,8)                          #73.13
..LN333:
   .loc    1  74  is_stmt 1
        vmovupd   %ymm8, 32(%rdi,%r9,8)                         #74.13
..LN334:
   .loc    1  73  is_stmt 1
        vmovupd   %ymm10, 64(%r8,%r9,8)                         #73.13
..LN335:
   .loc    1  74  is_stmt 1
        vmovupd   %ymm12, 64(%rdi,%r9,8)                        #74.13
..LN336:
   .loc    1  73  is_stmt 1
        vmovupd   %ymm14, 96(%r8,%r9,8)                         #73.13
..LN337:
   .loc    1  74  is_stmt 1
        vmovupd   %ymm0, 96(%rdi,%r9,8)                         #74.13
..LN338:
   .loc    1  72  is_stmt 1
        addq      $16, %r9                                      #72.9
..LN339:
        cmpq      %rax, %r9                                     #72.9
..LN340:
        jb        ..B1.36       # Prob 82%                      #72.9
..LN341:
                                # LOE rax rcx rbx rdi r8 r9 r12 r13 r14 r15 r10d xmm1
..B1.38:                        # Preds ..B1.36 ..B1.45
..LN342:
        cmpq      %r12, %rax                                    #72.9
..LN343:
        jae       ..B1.42       # Prob 10%                      #72.9
..LN344:
                                # LOE rax rbx r12 r13 r14 r15 r10d xmm1
..B1.39:                        # Preds ..B1.38
..LN345:
   .loc    1  73  is_stmt 1
        movq      56(%rbp), %r8                                 #73.13
..LN346:
   .loc    1  74  is_stmt 1
        movq      40(%rbp), %rcx                                #74.13
..LN347:
   .loc    1  73  is_stmt 1
        lea       (%r8,%r15,8), %r8                             #73.13
..LN348:
   .loc    1  74  is_stmt 1
        lea       (%rcx,%r15,8), %rdi                           #74.13
..LN349:
   .loc    1  73  is_stmt 1
        lea       (%r13,%r15,8), %rcx                           #73.25
..LN350:
                                # LOE rax rcx rbx rdi r8 r12 r13 r14 r15 r10d xmm1
..B1.40:                        # Preds ..B1.40 ..B1.39
..LN351:
        vmovsd    (%rcx,%rax,8), %xmm3                          #73.25
..LN352:
        vmovsd    (%r8,%rax,8), %xmm0                           #73.13
..LN353:
        vsubsd    %xmm3, %xmm0, %xmm2                           #73.13
..LN354:
   .loc    1  74  is_stmt 1
        vaddsd    (%rdi,%rax,8), %xmm3, %xmm4                   #74.13
..LN355:
   .loc    1  73  is_stmt 1
        vmovsd    %xmm2, (%r8,%rax,8)                           #73.13
..LN356:
   .loc    1  74  is_stmt 1
        vmovsd    %xmm4, (%rdi,%rax,8)                          #74.13
..LN357:
   .loc    1  72  is_stmt 1
        incq      %rax                                          #72.9
..LN358:
        cmpq      %r12, %rax                                    #72.9
..LN359:
        jb        ..B1.40       # Prob 82%                      #72.9
..LN360:
                                # LOE rax rcx rbx rdi r8 r12 r13 r14 r15 r10d xmm1
..B1.42:                        # Preds ..B1.40 ..B1.38 ..B1.33
..LN361:
   .loc    1  28  is_stmt 1
        movl      80(%rsp), %eax                                #28.5
..LN362:
        addq      $176, %r15                                    #28.5
..LN363:
        incl      %eax                                          #28.5
..LN364:
        addl      $176, %r10d                                   #28.5
..LN365:
        addq      $-176, %rbx                                   #28.5
..LN366:
        movl      %eax, 80(%rsp)                                #28.5
..LN367:
        cmpl      72(%rsp), %eax                                #28.5
..LN368:
        jb        ..B1.3        # Prob 82%                      #28.5
..LN369:
                                # LOE rbx r13 r14 r15 r10d xmm1
..B1.44:                        # Preds ..B1.42 ..B1.1
..LN370:
   .loc    1  93  is_stmt 1

###         }
### 
###     }
### 
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("NA_CUR_FNL"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     
### 
###     return 0.1;

        vzeroupper                                              #93.12
..LN371:
        vmovsd    .L_2il0floatpacket.15(%rip), %xmm0            #93.12
..LN372:
        addq      $88, %rsp                                     #93.12
..___tag_value_NA_CUR_FNL.11:                                   #93.12
..LN373:
        popq      %rbx                                          #93.12
..___tag_value_NA_CUR_FNL.12:                                   #93.12
..LN374:
        popq      %r15                                          #93.12
..___tag_value_NA_CUR_FNL.13:                                   #93.12
..LN375:
        popq      %r14                                          #93.12
..___tag_value_NA_CUR_FNL.14:                                   #93.12
..LN376:
        popq      %r13                                          #93.12
..___tag_value_NA_CUR_FNL.15:                                   #93.12
..LN377:
        popq      %r12                                          #93.12
..LN378:
        movq      %rbp, %rsp                                    #93.12
..LN379:
        popq      %rbp                                          #93.12
..___tag_value_NA_CUR_FNL.16:                                   #
..LN380:
        ret                                                     #93.12
..___tag_value_NA_CUR_FNL.18:                                   #
..LN381:
                                # LOE
..B1.45:                        # Preds ..B1.34                 # Infreq
..LN382:
   .loc    1  72  is_stmt 1
        xorl      %eax, %eax                                    #72.9
..LN383:
        jmp       ..B1.38       # Prob 100%                     #72.9
..LN384:
                                # LOE rax rbx r12 r13 r14 r15 r10d xmm1
..B1.46:                        # Preds ..B1.32                 # Infreq
..LN385:
   .loc    1  66  is_stmt 1
        movl      72(%rbp), %eax                                #66.13
..LN386:
        movq      %r13, %rsi                                    #66.13
..LN387:
        pushq     %rax                                          #66.13
..LN388:
        pushq     64(%rbp)                                      #66.13
..LN389:
        pushq     56(%rbp)                                      #66.13
..LN390:
        pushq     48(%rbp)                                      #66.13
..LN391:
        pushq     40(%rbp)                                      #66.13
..LN392:
        pushq     32(%rbp)                                      #66.13
..LN393:
        pushq     24(%rbp)                                      #66.13
..LN394:
        pushq     16(%rbp)                                      #66.13
..LN395:
        movq      %r14, %rdx                                    #66.13
..LN396:
        movq      80(%rsp), %rdi                                #66.13
..LN397:
        movq      88(%rsp), %rcx                                #66.13
..LN398:
        movq      96(%rsp), %r8                                 #66.13
..LN399:
        movq      104(%rsp), %r9                                #66.13
..LN400:
        movl      %r10d, 64(%rsp)                               #66.13
..LN401:
        vzeroupper                                              #66.13
..___tag_value_NA_CUR_FNL.25:                                   #66.13
..LN402:
        call      NA_CUR_ALT_SMP                                #66.13
..___tag_value_NA_CUR_FNL.26:                                   #
..LN403:
                                # LOE rbx r13 r14 r15 r12d
..B1.54:                        # Preds ..B1.46                 # Infreq
..LN404:
        movl      64(%rsp), %r10d                               #
..LN405:
        addq      $64, %rsp                                     #66.13
..LN406:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #
..LN407:
        jmp       ..B1.33       # Prob 100%                     #
..LN408:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.47:                        # Preds ..B1.24                 # Infreq
..LN409:
   .loc    1  59  is_stmt 1
        xorl      %ecx, %ecx                                    #59.9
..LN410:
        jmp       ..B1.28       # Prob 100%                     #59.9
..LN411:
                                # LOE rax rcx rbx r13 r14 r15 r10d r12d xmm1
..B1.48:                        # Preds ..B1.22                 # Infreq
..LN412:
   .loc    1  54  is_stmt 1
        movl      72(%rbp), %eax                                #54.13
..LN413:
        movq      %r13, %rsi                                    #54.13
..LN414:
        pushq     %rax                                          #54.13
..LN415:
        pushq     64(%rbp)                                      #54.13
..LN416:
        pushq     56(%rbp)                                      #54.13
..LN417:
        pushq     48(%rbp)                                      #54.13
..LN418:
        pushq     40(%rbp)                                      #54.13
..LN419:
        pushq     32(%rbp)                                      #54.13
..LN420:
        pushq     24(%rbp)                                      #54.13
..LN421:
        pushq     16(%rbp)                                      #54.13
..LN422:
        movq      %r14, %rdx                                    #54.13
..LN423:
        movq      80(%rsp), %rdi                                #54.13
..LN424:
        movq      88(%rsp), %rcx                                #54.13
..LN425:
        movq      96(%rsp), %r8                                 #54.13
..LN426:
        movq      104(%rsp), %r9                                #54.13
..LN427:
        movl      %r10d, 64(%rsp)                               #54.13
..LN428:
        vzeroupper                                              #54.13
..___tag_value_NA_CUR_FNL.27:                                   #54.13
..LN429:
        call      NA_CUR_ALT_SMP                                #54.13
..___tag_value_NA_CUR_FNL.28:                                   #
..LN430:
                                # LOE rbx r13 r14 r15 r12d
..B1.55:                        # Preds ..B1.48                 # Infreq
..LN431:
        movl      64(%rsp), %r10d                               #
..LN432:
        addq      $64, %rsp                                     #54.13
..LN433:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #
..LN434:
        jmp       ..B1.23       # Prob 100%                     #
..LN435:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.49:                        # Preds ..B1.14                 # Infreq
..LN436:
   .loc    1  47  is_stmt 1
        xorl      %edi, %edi                                    #47.9
..LN437:
        jmp       ..B1.18       # Prob 100%                     #47.9
..LN438:
                                # LOE rbx rdi r8 r13 r14 r15 r10d r12d xmm1
..B1.50:                        # Preds ..B1.12                 # Infreq
..LN439:
   .loc    1  41  is_stmt 1
        movl      72(%rbp), %eax                                #41.13
..LN440:
        movq      %r13, %rsi                                    #41.13
..LN441:
        pushq     %rax                                          #41.13
..LN442:
        pushq     64(%rbp)                                      #41.13
..LN443:
        pushq     56(%rbp)                                      #41.13
..LN444:
        pushq     48(%rbp)                                      #41.13
..LN445:
        pushq     40(%rbp)                                      #41.13
..LN446:
        pushq     32(%rbp)                                      #41.13
..LN447:
        pushq     24(%rbp)                                      #41.13
..LN448:
        pushq     16(%rbp)                                      #41.13
..LN449:
        movq      %r14, %rdx                                    #41.13
..LN450:
        movq      80(%rsp), %rdi                                #41.13
..LN451:
        movq      88(%rsp), %rcx                                #41.13
..LN452:
        movq      96(%rsp), %r8                                 #41.13
..LN453:
        movq      104(%rsp), %r9                                #41.13
..LN454:
        movl      %r10d, 64(%rsp)                               #41.13
..LN455:
        vzeroupper                                              #41.13
..___tag_value_NA_CUR_FNL.29:                                   #41.13
..LN456:
        call      NA_CUR_ALT_SMP                                #41.13
..___tag_value_NA_CUR_FNL.30:                                   #
..LN457:
                                # LOE rbx r13 r14 r15 r12d
..B1.56:                        # Preds ..B1.50                 # Infreq
..LN458:
        movl      64(%rsp), %r10d                               #
..LN459:
        addq      $64, %rsp                                     #41.13
..LN460:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm1            #
..LN461:
        jmp       ..B1.13       # Prob 100%                     #
..LN462:
                                # LOE rbx r13 r14 r15 r10d r12d xmm1
..B1.51:                        # Preds ..B1.4                  # Infreq
..LN463:
   .loc    1  34  is_stmt 1
        xorl      %eax, %eax                                    #34.9
..LN464:
        jmp       ..B1.8        # Prob 100%                     #34.9
        .align    16,0x90
..___tag_value_NA_CUR_FNL.31:                                   #
..LN465:
                                # LOE rax rcx rbx r13 r14 r15 r10d r12d xmm1
..LN466:
# mark_end;
	.type	NA_CUR_FNL,@function
	.size	NA_CUR_FNL,.-NA_CUR_FNL
..LNNA_CUR_FNL.467:
.LNNA_CUR_FNL:
	.data
# -- End  NA_CUR_FNL
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
