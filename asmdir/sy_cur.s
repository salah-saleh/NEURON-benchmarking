	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -fno-inline -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=0 -DKERNEL=22 -DIACA=1 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -vec-report3 -o asmdir/sy_cur.s";
	.file "sy_cur.c"
	.text
..TXTST0:
L__routine_start_SY_CUR_0:
# -- Begin  SY_CUR
# mark_begin;
       .align    16,0x90
	.globl SY_CUR
SY_CUR:
# parameter 1(C_a): %rdi
# parameter 2(C_b): %rsi
# parameter 3(C_c): %rdx
# parameter 4(C_d): %rcx
# parameter 5(C_e): %r8
# parameter 6(C_f): %r9
# parameter 7(C_g): 16 + %rbp
# parameter 8(C_h): 24 + %rbp
# parameter 9(C_i): 32 + %rbp
# parameter 10(C_j): 40 + %rbp
# parameter 11(C_k): 48 + %rbp
# parameter 12(C_l): 56 + %rbp
# parameter 13(C_m): 64 + %rbp
# parameter 14(C_n): 72 + %rbp
# parameter 15(PVAR_0): 80 + %rbp
# parameter 16(RHS_0): 88 + %rbp
# parameter 17(V_0): 96 + %rbp
# parameter 18(n): 104 + %rbp
..B1.1:                         # Preds ..B1.0

###     double * restrict PVAR_0, double * restrict RHS_0, double * restrict V_0, int n){

..___tag_value_SY_CUR.1:                                        #10.85
..LN0:
  .file   1 "sy_cur.c"
   .loc    1  10  is_stmt 1
        pushq     %rbp                                          #10.85
..___tag_value_SY_CUR.3:                                        #
..LN1:
        movq      %rsp, %rbp                                    #10.85
..___tag_value_SY_CUR.4:                                        #
..LN2:
        andq      $-32, %rsp                                    #10.85
..LN3:
        pushq     %r12                                          #10.85
..LN4:
        pushq     %r13                                          #10.85
..LN5:
        pushq     %r14                                          #10.85
..LN6:
        pushq     %r15                                          #10.85
..LN7:
        pushq     %rbx                                          #10.85
..LN8:
        subq      $472, %rsp                                    #10.85

###     int i;
###     double tmpCn, rhs;

..LN9:
   .loc    1  12  is_stmt 1
..LN10:
   .loc    1  10  is_stmt 1
        movq      %rsi, %r10                                    #10.85
..LN11:
        movslq    104(%rbp), %rax                               #10.85
..LN12:
   .loc    1  12  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #12.5
..LN13:
   .loc    1  24  is_stmt 1

### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     likwid_markerStartRegion("SY_CUR");
###     #endif
### 
###     #if IACA 
###     IACA_START

        movl      $111, %ebx                                    #24.0
..LN14:
        .byte     100                                           #24.0
..LN15:
        .byte     103                                           #24.0
..LN16:
        .byte     144                                           #24.0
..LN17:
   .loc    1  34  is_stmt 1

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

        testq     %rax, %rax                                    #34.23
..LN18:
        jle       ..B1.20       # Prob 50%                      #34.23
..___tag_value_SY_CUR.6:                                        #
..LN19:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r14 r15 xmm0
..B1.2:                         # Preds ..B1.1
..LN20:
   .loc    1  10  is_stmt 1
        movq      24(%rbp), %r11                                #10.85
..LN21:
        movq      16(%rbp), %rsi                                #10.85
..LN22:
        movq      40(%rbp), %r13                                #10.85
..LN23:
        movq      %r11, 376(%rsp)                               #10.85
..LN24:
        movq      32(%rbp), %r12                                #10.85
..LN25:
        movq      56(%rbp), %r11                                #10.85
..LN26:
        movq      %rsi, 384(%rsp)                               #10.85
..LN27:
        movq      %r13, 360(%rsp)                               #10.85
..LN28:
        movq      %r12, 368(%rsp)                               #10.85
..LN29:
        movq      48(%rbp), %rsi                                #10.85
..LN30:
        movq      80(%rbp), %r13                                #10.85
..LN31:
        movq      %r11, 336(%rsp)                               #10.85
..LN32:
        movq      72(%rbp), %r12                                #10.85
..LN33:
        movq      88(%rbp), %r11                                #10.85
..LN34:
        movq      %rsi, 352(%rsp)                               #10.85
..LN35:
        movq      %r13, 320(%rsp)                               #10.85
..LN36:
        movq      64(%rbp), %rsi                                #10.85
..LN37:
        movq      96(%rbp), %r13                                #10.85
..LN38:
        movq      %r12, 328(%rsp)                               #10.85
..LN39:
        movq      %r11, 344(%rsp)                               #10.85
..LN40:
   .loc    1  34  is_stmt 1
        cmpq      $4, %rax                                      #34.5
..LN41:
        jl        ..B1.21       # Prob 10%                      #34.5
..LN42:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B1.3:                         # Preds ..B1.2
..LN43:
   .loc    1  56  is_stmt 1

### 
###         C_m[i] = V_0[i] + 0.001;
###         V_0[i] = C_b[i] * 0.28 / (1. + exp(-0.062 * C_m[i]));
###         C_f[i] = 32. * (C_j[i] - C_i[i]);
###         C_g[i] = 32. * (C_l[i] - C_k[i]) * V_0[i];
###         C_h[i] = (C_f[i] + C_g[i]);
###         C_d[i] = C_f[i] * (C_m[i] - C_a[i]);
###         C_e[i] = C_g[i] * (C_m[i] - C_a[i]);
###         tmpCn = (C_d[i] - C_e[i]);
### 
###         C_m[i] = V_0[i] + 0.;
###         V_0[i] = C_b[i] * 0.28 / (1. + exp(-0.062 * C_m[i]));
###         // C_f doesn't change
###         C_g[i] = 32. * (C_l[i] - C_k[i]) * V_0[i];
###         C_h[i] = (C_f[i] + C_g[i]);
###         C_d[i] = C_f[i] * (C_m[i] - C_a[i]);
###         C_e[i] = C_g[i] * (C_m[i] - C_a[i]);
###         C_c[i] = (C_d[i] - C_e[i]);
###         
###         tmpCn = (tmpCn - rhs) * 1000.;
###         C_n[i] = tmpCn * 100. / PVAR_0[i];
###         RHS_0[i] -= 100. * rhs /PVAR_0[i];

        vmulsd    .L_2il0floatpacket.25(%rip), %xmm0, %xmm1     #56.28
..LN44:
   .loc    1  34  is_stmt 1
        movl      %eax, %r12d                                   #34.5
..LN45:
   .loc    1  36  is_stmt 1
        vmovupd   .L_2il0floatpacket.19(%rip), %ymm8            #36.27
..LN46:
   .loc    1  37  is_stmt 1
        vmovupd   .L_2il0floatpacket.20(%rip), %ymm7            #37.44
..LN47:
        vmovupd   .L_2il0floatpacket.21(%rip), %ymm6            #37.27
..LN48:
        vmovupd   .L_2il0floatpacket.22(%rip), %ymm5            #37.35
..LN49:
   .loc    1  38  is_stmt 1
        vmovupd   .L_2il0floatpacket.23(%rip), %ymm4            #38.18
..LN50:
   .loc    1  56  is_stmt 1
..LN51:
   .loc    1  54  is_stmt 1
        vmovupd   .L_2il0floatpacket.24(%rip), %ymm3            #54.33
..LN52:
   .loc    1  56  is_stmt 1
        vmovddup  %xmm1, %xmm2                                  #56.28
..LN53:
        vmovupd   %ymm6, 128(%rsp)                              #56.28
..LN54:
        vmovupd   %ymm5, 96(%rsp)                               #56.28
..LN55:
        vmovupd   %ymm4, 224(%rsp)                              #56.28
..LN56:
        vmovupd   %ymm3, 32(%rsp)                               #56.28
..LN57:
        vmovupd   %ymm7, 160(%rsp)                              #56.28
..LN58:
        vmovupd   %ymm8, 64(%rsp)                               #56.28
..LN59:
   .loc    1  34  is_stmt 1
        andl      $-4, %r12d                                    #34.5
..LN60:
        xorl      %r11d, %r11d                                  #34.5
..LN61:
        movslq    %r12d, %r12                                   #34.5
..LN62:
   .loc    1  56  is_stmt 1
        movq      %rsi, %rbx                                    #56.28
..LN63:
        movq      %r12, 432(%rsp)                               #56.28
..LN64:
        movq      %r11, %r12                                    #56.28
..LN65:
        movq      %r13, 456(%rsp)                               #56.28
..LN66:
        movq      %rax, 392(%rsp)                               #56.28
..LN67:
        movq      %rdi, 440(%rsp)                               #56.28
..LN68:
        movq      %r10, 416(%rsp)                               #56.28
..LN69:
        movq      %rdx, 400(%rsp)                               #56.28
..LN70:
        movq      %rcx, 408(%rsp)                               #56.28
..LN71:
        movq      %r8, 448(%rsp)                                #56.28
..LN72:
        movq      %r9, 424(%rsp)                                #56.28
..LN73:
        vinsertf128 $1, %xmm2, %ymm2, %ymm1                     #56.28
..LN74:
        vmovups   %ymm1, (%rsp)                                 #56.28
..LN75:
                                # LOE rbx r12
..B1.4:                         # Preds ..B1.12 ..B1.3
..LN76:
   .loc    1  36  is_stmt 1
        vmovupd   64(%rsp), %ymm1                               #36.27
..LN77:
   .loc    1  37  is_stmt 1
        movl      $1, %eax                                      #37.40
..LN78:
   .loc    1  36  is_stmt 1
        movq      456(%rsp), %rdx                               #36.27
..LN79:
        vaddpd    (%rdx,%r12,8), %ymm1, %ymm2                   #36.27
..LN80:
   .loc    1  37  is_stmt 1
        vmulpd    160(%rsp), %ymm2, %ymm0                       #37.53
..LN81:
   .loc    1  36  is_stmt 1
        vmovupd   %ymm2, (%rbx,%r12,8)                          #36.9
..LN82:
   .loc    1  37  is_stmt 1
        vextractf128 $1, %ymm0, 256(%rsp)                       #37.40
..LN83:
        vmovaps   %xmm0, %xmm1                                  #37.40
..LN84:
        vmovapd   %xmm1, %xmm0                                  #37.40
..LN85:
        vzeroupper                                              #37.40
..LN86:
        vmovups   %xmm1, 288(%rsp)                              #37.40
..___tag_value_SY_CUR.11:                                       #37.40
..LN87:
        call      exp                                           #37.40
..___tag_value_SY_CUR.12:                                       #
..LN88:
                                # LOE rbx r12 eax
..B1.24:                        # Preds ..B1.4
..LN89:
        vmovups   288(%rsp), %xmm1                              #
..LN90:
        movl      %eax, %r13d                                   #37.40
..LN91:
                                # LOE rbx r12 r13d xmm1 ymm1 zmm1
..B1.5:                         # Preds ..B1.24
..LN92:
        vpshufd   $14, %xmm1, %xmm0                             #37.40
..LN93:
        movl      $1, %eax                                      #37.40
..___tag_value_SY_CUR.13:                                       #37.40
..LN94:
        call      exp                                           #37.40
..___tag_value_SY_CUR.14:                                       #
..LN95:
                                # LOE rbx r12 eax r13d
..B1.25:                        # Preds ..B1.5
..LN96:
        movl      %eax, %r14d                                   #37.40
..LN97:
                                # LOE rbx r12 r13d r14d
..B1.6:                         # Preds ..B1.25
..LN98:
        movl      $1, %eax                                      #37.40
..LN99:
        vmovsd    256(%rsp), %xmm0                              #37.40
..___tag_value_SY_CUR.15:                                       #37.40
..LN100:
        call      exp                                           #37.40
..___tag_value_SY_CUR.16:                                       #
..LN101:
                                # LOE rbx r12 eax r13d r14d
..B1.26:                        # Preds ..B1.6
..LN102:
        movl      %eax, %r15d                                   #37.40
..LN103:
                                # LOE rbx r12 r13d r14d r15d
..B1.7:                         # Preds ..B1.26
..LN104:
        vpshufd   $14, 256(%rsp), %xmm0                         #37.40
..LN105:
        movl      $1, %eax                                      #37.40
..___tag_value_SY_CUR.17:                                       #37.40
..LN106:
        call      exp                                           #37.40
..___tag_value_SY_CUR.18:                                       #
..LN107:
                                # LOE rbx r12 eax r13d r14d r15d
..B1.8:                         # Preds ..B1.7
..LN108:
        vmovd     %r13d, %xmm2                                  #37.40
..LN109:
        vmovd     %r14d, %xmm3                                  #37.40
..LN110:
        vmovd     %r15d, %xmm4                                  #37.40
..LN111:
        vmovd     %eax, %xmm5                                   #37.40
..LN112:
        vmovupd   128(%rsp), %ymm1                              #37.27
..LN113:
        vpunpcklqdq %xmm3, %xmm2, %xmm6                         #37.40
..LN114:
        vpunpcklqdq %xmm5, %xmm4, %xmm7                         #37.40
..LN115:
        vshufps   $136, %xmm7, %xmm6, %xmm8                     #37.40
..LN116:
        vcvtdq2pd %xmm8, %ymm9                                  #37.40
..LN117:
   .loc    1  38  is_stmt 1
        vmovupd   224(%rsp), %ymm15                             #38.34
..LN118:
   .loc    1  37  is_stmt 1
        vaddpd    96(%rsp), %ymm9, %ymm11                       #37.40
..LN119:
        movq      416(%rsp), %rdx                               #37.27
..LN120:
   .loc    1  38  is_stmt 1
        movq      360(%rsp), %rdi                               #38.25
..LN121:
   .loc    1  39  is_stmt 1
        movq      336(%rsp), %r10                               #39.25
..LN122:
   .loc    1  37  is_stmt 1
        vmulpd    (%rdx,%r12,8), %ymm1, %ymm10                  #37.27
..LN123:
   .loc    1  38  is_stmt 1
        vmovupd   (%rdi,%r12,8), %ymm12                         #38.25
..LN124:
   .loc    1  39  is_stmt 1
        vmovupd   (%r10,%r12,8), %ymm14                         #39.25
..LN125:
   .loc    1  37  is_stmt 1
        vdivpd    %ymm11, %ymm10, %ymm6                         #37.40
..LN126:
   .loc    1  38  is_stmt 1
        movq      368(%rsp), %r8                                #38.34
..LN127:
   .loc    1  39  is_stmt 1
        movq      352(%rsp), %r13                               #39.34
..LN128:
   .loc    1  41  is_stmt 1
        movq      440(%rsp), %rax                               #41.37
..LN129:
   .loc    1  38  is_stmt 1
        vsubpd    (%r8,%r12,8), %ymm12, %ymm13                  #38.34
..LN130:
   .loc    1  39  is_stmt 1
        vsubpd    (%r13,%r12,8), %ymm14, %ymm14                 #39.34
..LN131:
   .loc    1  38  is_stmt 1
        vmulpd    %ymm13, %ymm15, %ymm0                         #38.34
..LN132:
   .loc    1  39  is_stmt 1
        vmulpd    %ymm14, %ymm15, %ymm15                        #39.34
..LN133:
   .loc    1  41  is_stmt 1
        vmovupd   (%rbx,%r12,8), %ymm13                         #41.28
..LN134:
   .loc    1  45  is_stmt 1
        vmovupd   %ymm6, (%rbx,%r12,8)                          #45.9
..LN135:
   .loc    1  39  is_stmt 1
        vmulpd    %ymm6, %ymm15, %ymm1                          #39.44
..LN136:
   .loc    1  41  is_stmt 1
        vsubpd    (%rax,%r12,8), %ymm13, %ymm2                  #41.37
..LN137:
   .loc    1  40  is_stmt 1
        vaddpd    %ymm1, %ymm0, %ymm12                          #40.28
..LN138:
   .loc    1  41  is_stmt 1
        vmulpd    %ymm2, %ymm0, %ymm3                           #41.37
..LN139:
   .loc    1  42  is_stmt 1
        vmulpd    %ymm2, %ymm1, %ymm4                           #42.37
..LN140:
   .loc    1  38  is_stmt 1
        movq      424(%rsp), %r9                                #38.9
..LN141:
   .loc    1  41  is_stmt 1
        movq      408(%rsp), %rax                               #41.9
..LN142:
   .loc    1  39  is_stmt 1
        movq      384(%rsp), %r14                               #39.9
..LN143:
   .loc    1  38  is_stmt 1
        vmovupd   %ymm0, (%r9,%r12,8)                           #38.9
..LN144:
   .loc    1  46  is_stmt 1
        vmulpd    160(%rsp), %ymm6, %ymm0                       #46.53
..LN145:
   .loc    1  41  is_stmt 1
        vmovupd   %ymm3, (%rax,%r12,8)                          #41.9
..LN146:
   .loc    1  39  is_stmt 1
        vmovupd   %ymm1, (%r14,%r12,8)                          #39.9
..LN147:
   .loc    1  43  is_stmt 1
        vsubpd    %ymm4, %ymm3, %ymm5                           #43.27
..LN148:
   .loc    1  46  is_stmt 1
        vextractf128 $1, %ymm0, 272(%rsp)                       #46.40
..LN149:
   .loc    1  43  is_stmt 1
        vmovupd   %ymm5, 192(%rsp)                              #43.27
..LN150:
   .loc    1  42  is_stmt 1
        movq      448(%rsp), %rax                               #42.9
..LN151:
   .loc    1  37  is_stmt 1
        movq      456(%rsp), %rcx                               #37.9
..LN152:
   .loc    1  40  is_stmt 1
        movq      376(%rsp), %r15                               #40.9
..LN153:
   .loc    1  42  is_stmt 1
        vmovupd   %ymm4, (%rax,%r12,8)                          #42.9
..LN154:
   .loc    1  46  is_stmt 1
        movl      $1, %eax                                      #46.40
..LN155:
   .loc    1  37  is_stmt 1
        vmovupd   %ymm6, (%rcx,%r12,8)                          #37.9
..LN156:
   .loc    1  40  is_stmt 1
        vmovupd   %ymm12, (%r15,%r12,8)                         #40.9
..LN157:
   .loc    1  46  is_stmt 1
        vmovaps   %xmm0, %xmm1                                  #46.40
..LN158:
        vmovapd   %xmm1, %xmm0                                  #46.40
..LN159:
        vzeroupper                                              #46.40
..LN160:
        vmovups   %xmm1, 304(%rsp)                              #46.40
..___tag_value_SY_CUR.19:                                       #46.40
..LN161:
        call      exp                                           #46.40
..___tag_value_SY_CUR.20:                                       #
..LN162:
                                # LOE rbx r12 eax
..B1.28:                        # Preds ..B1.8
..LN163:
        vmovups   304(%rsp), %xmm1                              #
..LN164:
        movl      %eax, %r13d                                   #46.40
..LN165:
                                # LOE rbx r12 r13d xmm1 ymm1 zmm1
..B1.9:                         # Preds ..B1.28
..LN166:
        vpshufd   $14, %xmm1, %xmm0                             #46.40
..LN167:
        movl      $1, %eax                                      #46.40
..___tag_value_SY_CUR.21:                                       #46.40
..LN168:
        call      exp                                           #46.40
..___tag_value_SY_CUR.22:                                       #
..LN169:
                                # LOE rbx r12 eax r13d
..B1.29:                        # Preds ..B1.9
..LN170:
        movl      %eax, %r14d                                   #46.40
..LN171:
                                # LOE rbx r12 r13d r14d
..B1.10:                        # Preds ..B1.29
..LN172:
        movl      $1, %eax                                      #46.40
..LN173:
        vmovsd    272(%rsp), %xmm0                              #46.40
..___tag_value_SY_CUR.23:                                       #46.40
..LN174:
        call      exp                                           #46.40
..___tag_value_SY_CUR.24:                                       #
..LN175:
                                # LOE rbx r12 eax r13d r14d
..B1.30:                        # Preds ..B1.10
..LN176:
        movl      %eax, %r15d                                   #46.40
..LN177:
                                # LOE rbx r12 r13d r14d r15d
..B1.11:                        # Preds ..B1.30
..LN178:
        vpshufd   $14, 272(%rsp), %xmm0                         #46.40
..LN179:
        movl      $1, %eax                                      #46.40
..___tag_value_SY_CUR.25:                                       #46.40
..LN180:
        call      exp                                           #46.40
..___tag_value_SY_CUR.26:                                       #
..LN181:
                                # LOE rbx r12 eax r13d r14d r15d
..B1.31:                        # Preds ..B1.11
..LN182:
        movl      %eax, %edx                                    #46.40
..LN183:
                                # LOE rbx r12 edx r13d r14d r15d
..B1.12:                        # Preds ..B1.31
..LN184:
        vmovd     %r13d, %xmm1                                  #46.40
..LN185:
        vmovd     %r14d, %xmm2                                  #46.40
..LN186:
        vmovd     %r15d, %xmm3                                  #46.40
..LN187:
        vmovd     %edx, %xmm4                                   #46.40
..LN188:
        vmovupd   128(%rsp), %ymm0                              #46.27
..LN189:
        vpunpcklqdq %xmm2, %xmm1, %xmm5                         #46.40
..LN190:
        vpunpcklqdq %xmm4, %xmm3, %xmm6                         #46.40
..LN191:
        vshufps   $136, %xmm6, %xmm5, %xmm7                     #46.40
..LN192:
        vcvtdq2pd %xmm7, %ymm8                                  #46.40
..LN193:
   .loc    1  55  is_stmt 1
        vmovupd   192(%rsp), %ymm6                              #55.26
..LN194:
   .loc    1  46  is_stmt 1
        vaddpd    96(%rsp), %ymm8, %ymm10                       #46.40
..LN195:
   .loc    1  55  is_stmt 1
        vmulpd    32(%rsp), %ymm6, %ymm7                        #55.26
..LN196:
   .loc    1  46  is_stmt 1
        movq      416(%rsp), %rax                               #46.27
..LN197:
   .loc    1  48  is_stmt 1
        movq      336(%rsp), %rcx                               #48.25
..LN198:
        movq      352(%rsp), %rdi                               #48.34
..LN199:
   .loc    1  46  is_stmt 1
        vmulpd    (%rax,%r12,8), %ymm0, %ymm9                   #46.27
..LN200:
   .loc    1  48  is_stmt 1
        vmovupd   (%rcx,%r12,8), %ymm11                         #48.25
..LN201:
   .loc    1  46  is_stmt 1
        vdivpd    %ymm10, %ymm9, %ymm14                         #46.40
..LN202:
   .loc    1  56  is_stmt 1
        vmovups   (%rsp), %ymm9                                 #56.33
..LN203:
   .loc    1  48  is_stmt 1
        vsubpd    (%rdi,%r12,8), %ymm11, %ymm12                 #48.34
..LN204:
        vmulpd    224(%rsp), %ymm12, %ymm13                     #48.34
..LN205:
   .loc    1  49  is_stmt 1
        movq      424(%rsp), %r9                                #49.19
..LN206:
   .loc    1  48  is_stmt 1
        vmulpd    %ymm14, %ymm13, %ymm1                         #48.44
..LN207:
   .loc    1  49  is_stmt 1
        vmovupd   (%r9,%r12,8), %ymm0                           #49.19
..LN208:
        vaddpd    %ymm1, %ymm0, %ymm15                          #49.28
..LN209:
        movq      376(%rsp), %r10                               #49.9
..LN210:
   .loc    1  50  is_stmt 1
        movq      440(%rsp), %r13                               #50.37
..LN211:
   .loc    1  52  is_stmt 1
        movq      400(%rsp), %rax                               #52.9
..LN212:
   .loc    1  49  is_stmt 1
        vmovupd   %ymm15, (%r10,%r12,8)                         #49.9
..LN213:
   .loc    1  50  is_stmt 1
        vmovupd   (%rbx,%r12,8), %ymm15                         #50.28
..LN214:
        vsubpd    (%r13,%r12,8), %ymm15, %ymm2                  #50.37
..LN215:
        vmulpd    %ymm2, %ymm0, %ymm3                           #50.37
..LN216:
   .loc    1  51  is_stmt 1
        vmulpd    %ymm2, %ymm1, %ymm4                           #51.37
..LN217:
   .loc    1  52  is_stmt 1
        vsubpd    %ymm4, %ymm3, %ymm5                           #52.28
..LN218:
        vmovupd   %ymm5, (%rax,%r12,8)                          #52.9
..LN219:
   .loc    1  55  is_stmt 1
        movq      320(%rsp), %rax                               #55.33
..LN220:
   .loc    1  46  is_stmt 1
        movq      456(%rsp), %rdx                               #46.9
..LN221:
   .loc    1  48  is_stmt 1
        movq      384(%rsp), %r8                                #48.9
..LN222:
   .loc    1  55  is_stmt 1
        vmovupd   (%rax,%r12,8), %ymm10                         #55.33
..LN223:
   .loc    1  46  is_stmt 1
        vmovupd   %ymm14, (%rdx,%r12,8)                         #46.9
..LN224:
   .loc    1  48  is_stmt 1
        vmovupd   %ymm1, (%r8,%r12,8)                           #48.9
..LN225:
   .loc    1  55  is_stmt 1
        vdivpd    %ymm10, %ymm7, %ymm8                          #55.33
..LN226:
   .loc    1  56  is_stmt 1
        vdivpd    %ymm10, %ymm9, %ymm12                         #56.33
..LN227:
   .loc    1  55  is_stmt 1
        movq      328(%rsp), %rax                               #55.9
..LN228:
   .loc    1  50  is_stmt 1
        movq      408(%rsp), %r14                               #50.9
..LN229:
   .loc    1  51  is_stmt 1
        movq      448(%rsp), %r15                               #51.9
..LN230:
   .loc    1  55  is_stmt 1
        vmovupd   %ymm8, (%rax,%r12,8)                          #55.9
..LN231:
   .loc    1  50  is_stmt 1
        vmovupd   %ymm3, (%r14,%r12,8)                          #50.9
..LN232:
   .loc    1  51  is_stmt 1
        vmovupd   %ymm4, (%r15,%r12,8)                          #51.9
..LN233:
   .loc    1  56  is_stmt 1
        movq      344(%rsp), %rax                               #56.9
..LN234:
        vmovupd   (%rax,%r12,8), %ymm11                         #56.9
..LN235:
        vsubpd    %ymm12, %ymm11, %ymm13                        #56.9
..LN236:
        vmovupd   %ymm13, (%rax,%r12,8)                         #56.9
..LN237:
   .loc    1  34  is_stmt 1
        addq      $4, %r12                                      #34.5
..LN238:
        cmpq      432(%rsp), %r12                               #34.5
..LN239:
        jb        ..B1.4        # Prob 82%                      #34.5
..LN240:
                                # LOE rbx r12
..B1.13:                        # Preds ..B1.12
..LN241:
        movq      432(%rsp), %r12                               #
..LN242:
        movq      %rbx, %rsi                                    #
..LN243:
        movq      456(%rsp), %r13                               #
..LN244:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN245:
        movq      392(%rsp), %rax                               #
..LN246:
        movq      440(%rsp), %rdi                               #
..LN247:
        movq      416(%rsp), %r10                               #
..LN248:
        movq      400(%rsp), %rdx                               #
..LN249:
        movq      408(%rsp), %rcx                               #
..LN250:
        movq      448(%rsp), %r8                                #
..LN251:
        movq      424(%rsp), %r9                                #
..LN252:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm0
..B1.14:                        # Preds ..B1.13 ..B1.21
..LN253:
        cmpq      %rax, %r12                                    #34.5
..LN254:
        jae       ..B1.20       # Prob 10%                      #34.5
..LN255:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm0
..B1.15:                        # Preds ..B1.14
..LN256:
   .loc    1  56  is_stmt 1
        vmulsd    .L_2il0floatpacket.25(%rip), %xmm0, %xmm7     #56.28
..LN257:
   .loc    1  54  is_stmt 1
        movq      %rsi, %rbx                                    #54.33
..LN258:
   .loc    1  36  is_stmt 1
        vmovsd    .L_2il0floatpacket.26(%rip), %xmm6            #36.27
..LN259:
   .loc    1  54  is_stmt 1
        movq      %rdi, %r14                                    #54.33
..LN260:
   .loc    1  37  is_stmt 1
        vmovsd    .L_2il0floatpacket.27(%rip), %xmm5            #37.44
..LN261:
   .loc    1  54  is_stmt 1
        movq      %r8, %r15                                     #54.33
..LN262:
   .loc    1  37  is_stmt 1
        vmovsd    .L_2il0floatpacket.28(%rip), %xmm4            #37.27
..LN263:
   .loc    1  38  is_stmt 1
        vmovsd    .L_2il0floatpacket.29(%rip), %xmm1            #38.18
..LN264:
   .loc    1  54  is_stmt 1
        vmovsd    %xmm7, (%rsp)                                 #54.33
..LN265:
        movq      %rax, 392(%rsp)                               #54.33
..LN266:
        movq      %r10, 416(%rsp)                               #54.33
..LN267:
        movq      %rdx, 400(%rsp)                               #54.33
..LN268:
        movq      %rcx, 408(%rsp)                               #54.33
..LN269:
        movq      %r9, 424(%rsp)                                #54.33
..LN270:
                                # LOE rbx r12 r13 r14 r15 xmm1
..B1.16:                        # Preds ..B1.18 ..B1.15
..LN271:
   .loc    1  36  is_stmt 1
        vmovsd    .L_2il0floatpacket.26(%rip), %xmm2            #36.27
..LN272:
   .loc    1  37  is_stmt 1
        movl      $1, %eax                                      #37.40
..LN273:
   .loc    1  36  is_stmt 1
        vaddsd    (%r13,%r12,8), %xmm2, %xmm3                   #36.27
..LN274:
   .loc    1  37  is_stmt 1
        vmulsd    .L_2il0floatpacket.27(%rip), %xmm3, %xmm0     #37.40
..LN275:
   .loc    1  36  is_stmt 1
        vmovsd    %xmm3, (%rbx,%r12,8)                          #36.9
..LN276:
   .loc    1  37  is_stmt 1
        vzeroupper                                              #37.40
..___tag_value_SY_CUR.27:                                       #37.40
..LN277:
        call      exp                                           #37.40
..___tag_value_SY_CUR.28:                                       #
..LN278:
                                # LOE rbx r12 r13 r14 r15 eax
..B1.32:                        # Preds ..B1.16
..LN279:
        vmovsd    .L_2il0floatpacket.29(%rip), %xmm1            #
..LN280:
                                # LOE rbx r12 r13 r14 r15 eax xmm1
..B1.17:                        # Preds ..B1.32
..LN281:
        vxorpd    %xmm3, %xmm3, %xmm3                           #37.40
..LN282:
        vcvtsi2sd %eax, %xmm3, %xmm3                            #37.40
..LN283:
        movq      416(%rsp), %rdx                               #37.27
..LN284:
        vmovsd    .L_2il0floatpacket.28(%rip), %xmm2            #37.27
..LN285:
   .loc    1  39  is_stmt 1
        movq      336(%rsp), %r11                               #39.25
..LN286:
   .loc    1  37  is_stmt 1
        vmulsd    (%rdx,%r12,8), %xmm2, %xmm4                   #37.27
..LN287:
        vaddsd    .L_2il0floatpacket.31(%rip), %xmm3, %xmm5     #37.40
..LN288:
        vdivsd    %xmm5, %xmm4, %xmm0                           #37.40
..LN289:
   .loc    1  39  is_stmt 1
        movq      352(%rsp), %rax                               #39.34
..LN290:
        vmovsd    (%r11,%r12,8), %xmm8                          #39.25
..LN291:
   .loc    1  38  is_stmt 1
        movq      360(%rsp), %rcx                               #38.25
..LN292:
        movq      368(%rsp), %r9                                #38.34
..LN293:
   .loc    1  41  is_stmt 1
        vmovsd    (%rbx,%r12,8), %xmm12                         #41.28
..LN294:
   .loc    1  38  is_stmt 1
        vmovsd    (%rcx,%r12,8), %xmm6                          #38.25
..LN295:
        movq      424(%rsp), %r10                               #38.9
..LN296:
   .loc    1  37  is_stmt 1
        vmovsd    %xmm0, (%r13,%r12,8)                          #37.9
..LN297:
   .loc    1  45  is_stmt 1
        vmovsd    %xmm0, (%rbx,%r12,8)                          #45.9
..LN298:
   .loc    1  39  is_stmt 1
        vsubsd    (%rax,%r12,8), %xmm8, %xmm9                   #39.34
..LN299:
   .loc    1  38  is_stmt 1
        vsubsd    (%r9,%r12,8), %xmm6, %xmm7                    #38.34
..LN300:
   .loc    1  41  is_stmt 1
        vsubsd    (%r14,%r12,8), %xmm12, %xmm15                 #41.37
..LN301:
   .loc    1  39  is_stmt 1
        vmulsd    %xmm9, %xmm1, %xmm10                          #39.34
..LN302:
   .loc    1  38  is_stmt 1
        vmulsd    %xmm7, %xmm1, %xmm13                          #38.34
..LN303:
   .loc    1  39  is_stmt 1
        vmulsd    %xmm0, %xmm10, %xmm14                         #39.44
..LN304:
   .loc    1  41  is_stmt 1
        vmulsd    %xmm15, %xmm13, %xmm6                         #41.37
..LN305:
   .loc    1  46  is_stmt 1
        vmulsd    .L_2il0floatpacket.27(%rip), %xmm0, %xmm0     #46.40
..LN306:
   .loc    1  40  is_stmt 1
        vaddsd    %xmm14, %xmm13, %xmm11                        #40.28
..LN307:
   .loc    1  42  is_stmt 1
        vmulsd    %xmm15, %xmm14, %xmm7                         #42.37
..LN308:
   .loc    1  39  is_stmt 1
        movq      384(%rsp), %rax                               #39.9
..LN309:
   .loc    1  43  is_stmt 1
        vsubsd    %xmm7, %xmm6, %xmm8                           #43.27
..LN310:
   .loc    1  39  is_stmt 1
        vmovsd    %xmm14, (%rax,%r12,8)                         #39.9
..LN311:
   .loc    1  40  is_stmt 1
        movq      376(%rsp), %rax                               #40.9
..LN312:
   .loc    1  38  is_stmt 1
        vmovsd    %xmm13, (%r10,%r12,8)                         #38.9
..LN313:
   .loc    1  42  is_stmt 1
        vmovsd    %xmm7, (%r15,%r12,8)                          #42.9
..LN314:
   .loc    1  40  is_stmt 1
        vmovsd    %xmm11, (%rax,%r12,8)                         #40.9
..LN315:
   .loc    1  41  is_stmt 1
        movq      408(%rsp), %rax                               #41.9
..LN316:
   .loc    1  43  is_stmt 1
        vmovsd    %xmm8, 8(%rsp)                                #43.27
..LN317:
   .loc    1  41  is_stmt 1
        vmovsd    %xmm6, (%rax,%r12,8)                          #41.9
..LN318:
   .loc    1  46  is_stmt 1
        movl      $1, %eax                                      #46.40
..___tag_value_SY_CUR.29:                                       #46.40
..LN319:
        call      exp                                           #46.40
..___tag_value_SY_CUR.30:                                       #
..LN320:
                                # LOE rbx r12 r13 r14 r15 eax
..B1.33:                        # Preds ..B1.17
..LN321:
        vmovsd    .L_2il0floatpacket.29(%rip), %xmm1            #
..LN322:
        movl      %eax, %edx                                    #46.40
..LN323:
                                # LOE rbx r12 r13 r14 r15 edx xmm1
..B1.18:                        # Preds ..B1.33
..LN324:
        vxorpd    %xmm2, %xmm2, %xmm2                           #46.40
..LN325:
        vcvtsi2sd %edx, %xmm2, %xmm2                            #46.40
..LN326:
        movq      416(%rsp), %rax                               #46.27
..LN327:
        vmovsd    .L_2il0floatpacket.28(%rip), %xmm0            #46.27
..LN328:
   .loc    1  48  is_stmt 1
        movq      336(%rsp), %rdx                               #48.25
..LN329:
   .loc    1  46  is_stmt 1
        vmulsd    (%rax,%r12,8), %xmm0, %xmm3                   #46.27
..LN330:
        vaddsd    .L_2il0floatpacket.31(%rip), %xmm2, %xmm4     #46.40
..LN331:
        vdivsd    %xmm4, %xmm3, %xmm8                           #46.40
..LN332:
   .loc    1  54  is_stmt 1
..LN333:
   .loc    1  48  is_stmt 1
        movq      352(%rsp), %rcx                               #48.34
..LN334:
   .loc    1  54  is_stmt 1
        vxorpd    %xmm3, %xmm3, %xmm3                           #54.26
..LN335:
   .loc    1  48  is_stmt 1
        vmovsd    (%rdx,%r12,8), %xmm5                          #48.25
..LN336:
   .loc    1  50  is_stmt 1
        vmovsd    (%rbx,%r12,8), %xmm10                         #50.28
..LN337:
   .loc    1  49  is_stmt 1
        movq      424(%rsp), %r10                               #49.19
..LN338:
   .loc    1  54  is_stmt 1
        vmovsd    8(%rsp), %xmm2                                #54.26
..LN339:
   .loc    1  50  is_stmt 1
        movq      408(%rsp), %rax                               #50.9
..LN340:
   .loc    1  54  is_stmt 1
        vsubsd    %xmm3, %xmm2, %xmm4                           #54.26
..LN341:
   .loc    1  48  is_stmt 1
        vsubsd    (%rcx,%r12,8), %xmm5, %xmm6                   #48.34
..LN342:
   .loc    1  50  is_stmt 1
        vsubsd    (%r14,%r12,8), %xmm10, %xmm13                 #50.37
..LN343:
   .loc    1  55  is_stmt 1
        vmulsd    .L_2il0floatpacket.30(%rip), %xmm4, %xmm5     #55.26
..LN344:
   .loc    1  48  is_stmt 1
        vmulsd    %xmm6, %xmm1, %xmm7                           #48.34
..LN345:
        vmulsd    %xmm8, %xmm7, %xmm12                          #48.44
..LN346:
   .loc    1  49  is_stmt 1
        vmovsd    (%r10,%r12,8), %xmm11                         #49.19
..LN347:
   .loc    1  50  is_stmt 1
        vmulsd    %xmm13, %xmm11, %xmm14                        #50.37
..LN348:
   .loc    1  49  is_stmt 1
        vaddsd    %xmm12, %xmm11, %xmm9                         #49.28
..LN349:
   .loc    1  51  is_stmt 1
        vmulsd    %xmm13, %xmm12, %xmm15                        #51.37
..LN350:
   .loc    1  50  is_stmt 1
        vmovsd    %xmm14, (%rax,%r12,8)                         #50.9
..LN351:
   .loc    1  52  is_stmt 1
        vsubsd    %xmm15, %xmm14, %xmm0                         #52.28
..LN352:
        movq      400(%rsp), %rax                               #52.9
..LN353:
   .loc    1  46  is_stmt 1
        vmovsd    %xmm8, (%r13,%r12,8)                          #46.9
..LN354:
   .loc    1  56  is_stmt 1
        vmovsd    (%rsp), %xmm7                                 #56.33
..LN355:
   .loc    1  52  is_stmt 1
        vmovsd    %xmm0, (%rax,%r12,8)                          #52.9
..LN356:
   .loc    1  55  is_stmt 1
        movq      320(%rsp), %rax                               #55.33
..LN357:
   .loc    1  49  is_stmt 1
        movq      376(%rsp), %r11                               #49.9
..LN358:
   .loc    1  48  is_stmt 1
        movq      384(%rsp), %r9                                #48.9
..LN359:
   .loc    1  55  is_stmt 1
        vmovsd    (%rax,%r12,8), %xmm8                          #55.33
..LN360:
        vdivsd    %xmm8, %xmm5, %xmm6                           #55.33
..LN361:
   .loc    1  56  is_stmt 1
        vdivsd    %xmm8, %xmm7, %xmm10                          #56.33
..LN362:
   .loc    1  55  is_stmt 1
        movq      328(%rsp), %rax                               #55.9
..LN363:
   .loc    1  49  is_stmt 1
        vmovsd    %xmm9, (%r11,%r12,8)                          #49.9
..LN364:
   .loc    1  48  is_stmt 1
        vmovsd    %xmm12, (%r9,%r12,8)                          #48.9
..LN365:
   .loc    1  55  is_stmt 1
        vmovsd    %xmm6, (%rax,%r12,8)                          #55.9
..LN366:
   .loc    1  56  is_stmt 1
        movq      344(%rsp), %rax                               #56.9
..LN367:
   .loc    1  51  is_stmt 1
        vmovsd    %xmm15, (%r15,%r12,8)                         #51.9
..LN368:
   .loc    1  56  is_stmt 1
        vmovsd    (%rax,%r12,8), %xmm9                          #56.9
..LN369:
        vsubsd    %xmm10, %xmm9, %xmm11                         #56.9
..LN370:
        vmovsd    %xmm11, (%rax,%r12,8)                         #56.9
..LN371:
   .loc    1  34  is_stmt 1
        incq      %r12                                          #34.5
..LN372:
        cmpq      392(%rsp), %r12                               #34.5
..LN373:
        jb        ..B1.16       # Prob 82%                      #34.5
..LN374:
                                # LOE rbx r12 r13 r14 r15 xmm1
..B1.20:                        # Preds ..B1.18 ..B1.1 ..B1.14
..LN375:
   .loc    1  60  is_stmt 1

### 
###     }
###     #if IACA 
###     IACA_END

        movl      $222, %ebx                                    #60.0
..LN376:
        .byte     100                                           #60.0
..LN377:
        .byte     103                                           #60.0
..LN378:
        .byte     144                                           #60.0
..LN379:
   .loc    1  71  is_stmt 1

###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("SY_CUR"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     return 0.1;

        vmovsd    .L_2il0floatpacket.18(%rip), %xmm0            #71.12
..LN380:
        vzeroupper                                              #71.12
..LN381:
        addq      $472, %rsp                                    #71.12
..___tag_value_SY_CUR.31:                                       #71.12
..LN382:
        popq      %rbx                                          #71.12
..___tag_value_SY_CUR.32:                                       #71.12
..LN383:
        popq      %r15                                          #71.12
..___tag_value_SY_CUR.33:                                       #71.12
..LN384:
        popq      %r14                                          #71.12
..___tag_value_SY_CUR.34:                                       #71.12
..LN385:
        popq      %r13                                          #71.12
..___tag_value_SY_CUR.35:                                       #71.12
..LN386:
        popq      %r12                                          #71.12
..LN387:
        movq      %rbp, %rsp                                    #71.12
..LN388:
        popq      %rbp                                          #71.12
..___tag_value_SY_CUR.36:                                       #
..LN389:
        ret                                                     #71.12
..___tag_value_SY_CUR.38:                                       #
..LN390:
                                # LOE
..B1.21:                        # Preds ..B1.2                  # Infreq
..LN391:
   .loc    1  34  is_stmt 1
        xorl      %r12d, %r12d                                  #34.5
..LN392:
        jmp       ..B1.14       # Prob 100%                     #34.5
        .align    16,0x90
..___tag_value_SY_CUR.45:                                       #
..LN393:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm0
..LN394:
# mark_end;
	.type	SY_CUR,@function
	.size	SY_CUR,.-SY_CUR
..LNSY_CUR.395:
.LNSY_CUR:
	.data
# -- End  SY_CUR
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.19:
	.long	0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d
	.type	.L_2il0floatpacket.19,@object
	.size	.L_2il0floatpacket.19,32
	.align 32
.L_2il0floatpacket.20:
	.long	0xc8b43958,0xbfafbe76,0xc8b43958,0xbfafbe76,0xc8b43958,0xbfafbe76,0xc8b43958,0xbfafbe76
	.type	.L_2il0floatpacket.20,@object
	.size	.L_2il0floatpacket.20,32
	.align 32
.L_2il0floatpacket.21:
	.long	0x1eb851ec,0x3fd1eb85,0x1eb851ec,0x3fd1eb85,0x1eb851ec,0x3fd1eb85,0x1eb851ec,0x3fd1eb85
	.type	.L_2il0floatpacket.21,@object
	.size	.L_2il0floatpacket.21,32
	.align 32
.L_2il0floatpacket.22:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.22,@object
	.size	.L_2il0floatpacket.22,32
	.align 32
.L_2il0floatpacket.23:
	.long	0x00000000,0x40400000,0x00000000,0x40400000,0x00000000,0x40400000,0x00000000,0x40400000
	.type	.L_2il0floatpacket.23,@object
	.size	.L_2il0floatpacket.23,32
	.align 32
.L_2il0floatpacket.24:
	.long	0x00000000,0x40f86a00,0x00000000,0x40f86a00,0x00000000,0x40f86a00,0x00000000,0x40f86a00
	.type	.L_2il0floatpacket.24,@object
	.size	.L_2il0floatpacket.24,32
	.align 8
.L_2il0floatpacket.18:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.18,@object
	.size	.L_2il0floatpacket.18,8
	.align 8
.L_2il0floatpacket.25:
	.long	0x00000000,0x40590000
	.type	.L_2il0floatpacket.25,@object
	.size	.L_2il0floatpacket.25,8
	.align 8
.L_2il0floatpacket.26:
	.long	0xd2f1a9fc,0x3f50624d
	.type	.L_2il0floatpacket.26,@object
	.size	.L_2il0floatpacket.26,8
	.align 8
.L_2il0floatpacket.27:
	.long	0xc8b43958,0xbfafbe76
	.type	.L_2il0floatpacket.27,@object
	.size	.L_2il0floatpacket.27,8
	.align 8
.L_2il0floatpacket.28:
	.long	0x1eb851ec,0x3fd1eb85
	.type	.L_2il0floatpacket.28,@object
	.size	.L_2il0floatpacket.28,8
	.align 8
.L_2il0floatpacket.29:
	.long	0x00000000,0x40400000
	.type	.L_2il0floatpacket.29,@object
	.size	.L_2il0floatpacket.29,8
	.align 8
.L_2il0floatpacket.30:
	.long	0x00000000,0x40f86a00
	.type	.L_2il0floatpacket.30,@object
	.size	.L_2il0floatpacket.30,8
	.align 8
.L_2il0floatpacket.31:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.31,@object
	.size	.L_2il0floatpacket.31,8
	.data
	.section .note.GNU-stack, ""
# End
