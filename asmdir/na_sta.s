	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=1000 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 ";
# mark_description "-DLIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -DEXTMATH=0 -vec-report3 -o asmdir/na_sta.s";
	.file "na_sta.c"
	.text
..TXTST0:
L__routine_start_NA_STA_0:
# -- Begin  NA_STA
# mark_begin;
       .align    16,0x90
	.globl NA_STA
NA_STA:
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

..___tag_value_NA_STA.1:                                        #27.80
..LN0:
  .file   1 "srcdir/na_sta.c"
   .loc    1  27  is_stmt 1
        pushq     %rbp                                          #27.80
..___tag_value_NA_STA.3:                                        #
..LN1:
        movq      %rsp, %rbp                                    #27.80
..___tag_value_NA_STA.4:                                        #
..LN2:
        andq      $-32, %rsp                                    #27.80
..LN3:
        pushq     %r12                                          #27.80
..LN4:
        pushq     %r13                                          #27.80
..LN5:
        pushq     %r14                                          #27.80
..LN6:
        pushq     %r15                                          #27.80
..LN7:
        pushq     %rbx                                          #27.80
..LN8:
        subq      $472, %rsp                                    #27.80

###     
###     int i;
###     double tmp0, tmp1, tmp2, tmp3, tmp4;

..LN9:
   .loc    1  30  is_stmt 1
..LN10:
   .loc    1  27  is_stmt 1
        movslq    56(%rbp), %rax                                #27.80
..LN11:
   .loc    1  30  is_stmt 1
        vxorpd    %xmm14, %xmm14, %xmm14                        #30.5
..LN12:
   .loc    1  52  is_stmt 1

### 
###     #if OMP
###     #pragma omp parallel
###     {
###     #endif
### 
###     #if LIKWID
###     likwid_markerStartRegion("NA_STA");
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

        testq     %rax, %rax                                    #52.23
..LN13:
        jle       ..B1.40       # Prob 50%                      #52.23
..___tag_value_NA_STA.6:                                        #
..LN14:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r12 r13 r14 r15 xmm14
..B1.2:                         # Preds ..B1.1
..LN15:
        cmpq      $4, %rax                                      #52.5
..LN16:
        jl        ..B1.41       # Prob 10%                      #52.5
..LN17:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r12 r13 r14 r15 xmm14
..B1.3:                         # Preds ..B1.2
..LN18:
   .loc    1  84  is_stmt 1

### 
###         // C_mAlpha[i] = EXPc_smp(C_mAlpha[i]);
###         // C_mAlpha[0] += DIVMACROc(1.0,i);
###         // C_mAlpha[i] = exp(i/n);
###         // C_mAlpha[0] += 1.0/i;
###     
###         // #if EXTMATH        
###         //     tmp0        = C_v[i] + 35.0;
###         //     tmp1        = EXPc_smp(tmp0 * 0.1111111111111);
###         //     C_mAlpha[i] = 0.128 * tmp0 * DIVMACROc(tmp1 , (tmp1 - 1.));
###         //     C_mBeta[i]  = -0.124 * DIVMACROc(tmp0 , (1. - tmp1));
###         //     C_mTau[i]   = DIVMACROc(1. , (C_mAlpha[i] + C_mBeta[i]));
###         //     C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
###         //     tmp2        = C_v[i] + 50.;
###         //     tmp3        = C_v[i] + 75.;
###         //     C_hAlpha[i] = 0.024 * DIVMACROc(tmp3 , (1. - EXPc_smp(tmp3 * 0.2)));
###         //     C_hBeta[i]  = -0.0091 * DIVMACROc(tmp4 , (1. - EXPc_smp(tmp4 * 0.2)));
###         //     C_hInf[i]   = DIVMACROc(1. , (1. + EXPc_smp(C_v[i] + 65.) * .0153846158462));
###         //     C_hTau[i]   = DIVMACROc(1. , (C_hAlpha[i] + C_hBeta[i]));
###         //     C_m[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_mTau[i]))) * (C_mInf[i] - C_m[i]);
###         //     C_h[i]     += (1. - EXPc_smp(DIVMACROc(-0.1 , C_hTau[i]))) * (C_hInf[i] - C_h[i]);
###         // #else
###             tmp0        = C_v[i] + 35.0;
###             tmp1        = exp(tmp0 * 0.1111111111111);
###             C_mAlpha[i] = 0.128 * tmp0 * tmp1 / (tmp1 - 1.);
###             C_mBeta[i]  = -0.124 * tmp0 / (1. - tmp1);
###             C_mTau[i]   = 1. / (C_mAlpha[i] + C_mBeta[i]);
###             C_mInf[i]   = C_mAlpha[i] * C_mTau[i];
###             tmp2        = C_v[i] + 50.;
###             tmp3        = C_v[i] + 75.;
###             C_hAlpha[i] = 0.024 * tmp3 / (1. - exp(tmp3 * 0.2));
###             C_hBeta[i]  = -0.0091 * tmp4 / (1. - exp(tmp4 * 0.2));

        vmulsd    .L_2il0floatpacket.21(%rip), %xmm14, %xmm0    #84.61
..LN19:
   .loc    1  52  is_stmt 1
        movl      %eax, %r11d                                   #52.5
..LN20:
   .loc    1  75  is_stmt 1
        vmovupd   .L_2il0floatpacket.13(%rip), %ymm13           #75.36
..LN21:
   .loc    1  84  is_stmt 1
        vmulsd    .L_2il0floatpacket.22(%rip), %xmm14, %xmm1    #84.37
..LN22:
   .loc    1  76  is_stmt 1
        vmovupd   .L_2il0floatpacket.14(%rip), %ymm12           #76.38
..LN23:
   .loc    1  77  is_stmt 1
        vmovupd   .L_2il0floatpacket.15(%rip), %ymm11           #77.27
..LN24:
   .loc    1  84  is_stmt 1
..LN25:
   .loc    1  77  is_stmt 1
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm10           #77.57
..LN26:
   .loc    1  78  is_stmt 1
        vmovupd   .L_2il0floatpacket.17(%rip), %ymm9            #78.27
..LN27:
   .loc    1  84  is_stmt 1
..LN28:
        vmovddup  %xmm0, %xmm4                                  #84.61
..LN29:
        vmovddup  %xmm1, %xmm2                                  #84.37
..LN30:
        vpshufd   $14, %xmm4, %xmm5                             #84.50

###             C_hInf[i]   = 1. / (1. + exp(C_v[i] + 65.) * .0153846158462);
###             C_hTau[i]   = 1. / (C_hAlpha[i] + C_hBeta[i]);
###             C_m[i]     += (1. - exp(-0.1 / C_mTau[i])) * (C_mInf[i] - C_m[i]);

..LN31:
   .loc    1  87  is_stmt 1
        vmovsd    %xmm5, 288(%rsp)                              #87.37
..LN32:
   .loc    1  52  is_stmt 1
        andl      $-4, %r11d                                    #52.5
..LN33:
        xorl      %r10d, %r10d                                  #52.5
..LN34:
        movslq    %r11d, %r11                                   #52.5
..LN35:
   .loc    1  87  is_stmt 1
        movq      %rdx, %rbx                                    #87.37
..LN36:
   .loc    1  82  is_stmt 1
        vmovupd   .L_2il0floatpacket.18(%rip), %ymm8            #82.36
..LN37:
   .loc    1  87  is_stmt 1
        movq      %rcx, %r13                                    #87.37
..LN38:
        vmovsd    %xmm4, 280(%rsp)                              #87.37
..LN39:
   .loc    1  83  is_stmt 1
        vmovupd   .L_2il0floatpacket.19(%rip), %ymm7            #83.59
..LN40:
        vmovupd   .L_2il0floatpacket.20(%rip), %ymm6            #83.27
..LN41:
   .loc    1  87  is_stmt 1
        movq      %r11, 296(%rsp)                               #87.37
..LN42:
        movq      %r9, %r15                                     #87.37
..LN43:
        movq      %rdi, 264(%rsp)                               #87.37
..LN44:
        movq      %r10, %r14                                    #87.37
..LN45:
        movq      %rsi, 256(%rsp)                               #87.37
..LN46:
        movq      %r8, 272(%rsp)                                #87.37
..LN47:
        movq      48(%rbp), %r12                                #87.37
..LN48:
   .loc    1  84  is_stmt 1
        vinsertf128 $1, %xmm2, %ymm2, %ymm3                     #84.37
..LN49:
   .loc    1  87  is_stmt 1
        vmovups   %ymm3, (%rsp)                                 #87.37
..LN50:
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.28 ..B1.3
..LN51:
   .loc    1  75  is_stmt 1
        vmovupd   .L_2il0floatpacket.13(%rip), %ymm1            #75.36
..LN52:
        vaddpd    (%r12,%r14,8), %ymm1, %ymm2                   #75.36
..LN53:
   .loc    1  76  is_stmt 1
        vmulpd    .L_2il0floatpacket.14(%rip), %ymm2, %ymm0     #76.38
..LN54:
   .loc    1  75  is_stmt 1
        vmovupd   %ymm2, 64(%rsp)                               #75.36
..LN55:
   .loc    1  76  is_stmt 1
        vextractf128 $1, %ymm0, 96(%rsp)                        #76.27
..LN56:
        vmovaps   %xmm0, %xmm1                                  #76.27
..LN57:
        vmovapd   %xmm1, %xmm0                                  #76.27
..LN58:
        vzeroupper                                              #76.27
..LN59:
        vmovups   %xmm1, 176(%rsp)                              #76.27
..___tag_value_NA_STA.11:                                       #76.27
..LN60:
        call      exp                                           #76.27
..___tag_value_NA_STA.12:                                       #
..LN61:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.44:                        # Preds ..B1.4
..LN62:
        vmovups   176(%rsp), %xmm1                              #
..LN63:
        vmovsd    %xmm0, 312(%rsp)                              #76.27
..LN64:
                                # LOE rbx r12 r13 r14 r15 xmm1 ymm1 zmm1
..B1.5:                         # Preds ..B1.44
..LN65:
        vpshufd   $14, %xmm1, %xmm0                             #76.27
..___tag_value_NA_STA.13:                                       #76.27
..LN66:
        call      exp                                           #76.27
..___tag_value_NA_STA.14:                                       #
..LN67:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.45:                        # Preds ..B1.5
..LN68:
        vmovsd    %xmm0, 368(%rsp)                              #76.27
..LN69:
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.45
..LN70:
        vmovsd    96(%rsp), %xmm0                               #76.27
..___tag_value_NA_STA.15:                                       #76.27
..LN71:
        call      exp                                           #76.27
..___tag_value_NA_STA.16:                                       #
..LN72:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.46:                        # Preds ..B1.6
..LN73:
        vmovsd    %xmm0, 344(%rsp)                              #76.27
..LN74:
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.46
..LN75:
        vpshufd   $14, 96(%rsp), %xmm0                          #76.27
..___tag_value_NA_STA.17:                                       #76.27
..LN76:
        call      exp                                           #76.27
..___tag_value_NA_STA.18:                                       #
..LN77:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.8:                         # Preds ..B1.7
..LN78:
        vmovsd    312(%rsp), %xmm1                              #76.27
..LN79:
        vmovsd    344(%rsp), %xmm2                              #76.27
..LN80:
        vmovhpd   368(%rsp), %xmm1, %xmm3                       #76.27
..LN81:
        vunpcklpd %xmm0, %xmm2, %xmm4                           #76.27
..LN82:
   .loc    1  77  is_stmt 1
        vmovupd   64(%rsp), %ymm8                               #77.42
..LN83:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm13           #77.57
..LN84:
   .loc    1  82  is_stmt 1
        vmovupd   .L_2il0floatpacket.18(%rip), %ymm2            #82.36
..LN85:
   .loc    1  78  is_stmt 1
        vmulpd    .L_2il0floatpacket.17(%rip), %ymm8, %ymm10    #78.36
..LN86:
   .loc    1  77  is_stmt 1
        movq      264(%rsp), %rax                               #77.13
..LN87:
   .loc    1  78  is_stmt 1
        movq      256(%rsp), %rsi                               #78.13
..LN88:
   .loc    1  76  is_stmt 1
        vinsertf128 $1, %xmm4, %ymm3, %ymm9                     #76.27
..LN89:
   .loc    1  77  is_stmt 1
        vmulpd    .L_2il0floatpacket.15(%rip), %ymm9, %ymm5     #77.35
..LN90:
        vsubpd    %ymm13, %ymm9, %ymm7                          #77.57
..LN91:
   .loc    1  78  is_stmt 1
        vsubpd    %ymm9, %ymm13, %ymm11                         #78.49
..LN92:
   .loc    1  82  is_stmt 1
        vaddpd    (%r12,%r14,8), %ymm2, %ymm3                   #82.36
..LN93:
   .loc    1  77  is_stmt 1
        vmulpd    %ymm5, %ymm8, %ymm6                           #77.42
..LN94:
   .loc    1  78  is_stmt 1
        vdivpd    %ymm11, %ymm10, %ymm12                        #78.49
..LN95:
   .loc    1  77  is_stmt 1
        vdivpd    %ymm7, %ymm6, %ymm15                          #77.57
..LN96:
   .loc    1  78  is_stmt 1
        vmovupd   %ymm12, (%rsi,%r14,8)                         #78.13
..LN97:
   .loc    1  82  is_stmt 1
        vmovupd   %ymm3, 32(%rsp)                               #82.36
..LN98:
   .loc    1  79  is_stmt 1
        vaddpd    %ymm12, %ymm15, %ymm14                        #79.47
..LN99:
   .loc    1  77  is_stmt 1
        vmovupd   %ymm15, (%rax,%r14,8)                         #77.13
..LN100:
   .loc    1  79  is_stmt 1
        vdivpd    %ymm14, %ymm13, %ymm0                         #79.47
..LN101:
        vmovupd   %ymm0, (%rbx,%r14,8)                          #79.13
..LN102:
   .loc    1  80  is_stmt 1
        vmulpd    %ymm0, %ymm15, %ymm1                          #80.41
..LN103:
   .loc    1  83  is_stmt 1
        vmulpd    .L_2il0floatpacket.19(%rip), %ymm3, %ymm0     #83.59
..LN104:
   .loc    1  80  is_stmt 1
        vmovupd   %ymm1, (%r13,%r14,8)                          #80.13
..LN105:
   .loc    1  83  is_stmt 1
        vextractf128 $1, %ymm0, 160(%rsp)                       #83.48
..LN106:
        vmovaps   %xmm0, %xmm1                                  #83.48
..LN107:
        vmovapd   %xmm1, %xmm0                                  #83.48
..LN108:
        vzeroupper                                              #83.48
..LN109:
        vmovups   %xmm1, 192(%rsp)                              #83.48
..___tag_value_NA_STA.19:                                       #83.48
..LN110:
        call      exp                                           #83.48
..___tag_value_NA_STA.20:                                       #
..LN111:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.48:                        # Preds ..B1.8
..LN112:
        vmovups   192(%rsp), %xmm1                              #
..LN113:
        vmovsd    %xmm0, 304(%rsp)                              #83.48
..LN114:
                                # LOE rbx r12 r13 r14 r15 xmm1 ymm1 zmm1
..B1.9:                         # Preds ..B1.48
..LN115:
        vpshufd   $14, %xmm1, %xmm0                             #83.48
..___tag_value_NA_STA.21:                                       #83.48
..LN116:
        call      exp                                           #83.48
..___tag_value_NA_STA.22:                                       #
..LN117:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.49:                        # Preds ..B1.9
..LN118:
        vmovsd    %xmm0, 360(%rsp)                              #83.48
..LN119:
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.49
..LN120:
        vmovsd    160(%rsp), %xmm0                              #83.48
..___tag_value_NA_STA.23:                                       #83.48
..LN121:
        call      exp                                           #83.48
..___tag_value_NA_STA.24:                                       #
..LN122:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.50:                        # Preds ..B1.10
..LN123:
        vmovsd    %xmm0, 424(%rsp)                              #83.48
..LN124:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.50
..LN125:
        vpshufd   $14, 160(%rsp), %xmm0                         #83.48
..___tag_value_NA_STA.25:                                       #83.48
..LN126:
        call      exp                                           #83.48
..___tag_value_NA_STA.26:                                       #
..LN127:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.51:                        # Preds ..B1.11
..LN128:
        vmovapd   %xmm0, %xmm3                                  #83.48
..LN129:
                                # LOE rbx r12 r13 r14 r15 xmm3
..B1.12:                        # Preds ..B1.51
..LN130:
        vmovupd   32(%rsp), %ymm4                               #83.35
..LN131:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm5            #83.48
..LN132:
        vmovsd    304(%rsp), %xmm0                              #83.48
..LN133:
        vmovhpd   360(%rsp), %xmm0, %xmm2                       #83.48
..LN134:
        vmovapd   %xmm3, %xmm0                                  #83.48
..LN135:
        vmovsd    424(%rsp), %xmm1                              #83.48
..LN136:
        vunpcklpd %xmm0, %xmm1, %xmm3                           #83.48
..LN137:
        vmulpd    .L_2il0floatpacket.20(%rip), %ymm4, %ymm7     #83.35
..LN138:
        movq      272(%rsp), %rax                               #83.13
..LN139:
        vinsertf128 $1, %xmm3, %ymm2, %ymm6                     #83.48
..LN140:
        vsubpd    %ymm6, %ymm5, %ymm8                           #83.48
..LN141:
        vdivpd    %ymm8, %ymm7, %ymm9                           #83.48
..LN142:
        vmovupd   %ymm9, (%rax,%r14,8)                          #83.13
..LN143:
   .loc    1  84  is_stmt 1
        vzeroupper                                              #84.50
..LN144:
        vmovsd    280(%rsp), %xmm0                              #84.50
..___tag_value_NA_STA.27:                                       #84.50
..LN145:
        call      exp                                           #84.50
..___tag_value_NA_STA.28:                                       #
..LN146:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.52:                        # Preds ..B1.12
..LN147:
        vmovsd    %xmm0, 440(%rsp)                              #84.50
..LN148:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.52
..LN149:
        vmovsd    288(%rsp), %xmm0                              #84.50
..___tag_value_NA_STA.29:                                       #84.50
..LN150:
        call      exp                                           #84.50
..___tag_value_NA_STA.30:                                       #
..LN151:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.53:                        # Preds ..B1.13
..LN152:
        vmovsd    %xmm0, 416(%rsp)                              #84.50
..LN153:
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.53
..LN154:
        vmovsd    280(%rsp), %xmm0                              #84.50
..___tag_value_NA_STA.31:                                       #84.50
..LN155:
        call      exp                                           #84.50
..___tag_value_NA_STA.32:                                       #
..LN156:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.54:                        # Preds ..B1.14
..LN157:
        vmovsd    %xmm0, 384(%rsp)                              #84.50
..LN158:
                                # LOE rbx r12 r13 r14 r15
..B1.15:                        # Preds ..B1.54
..LN159:
        vmovsd    288(%rsp), %xmm0                              #84.50
..___tag_value_NA_STA.33:                                       #84.50
..LN160:
        call      exp                                           #84.50
..___tag_value_NA_STA.34:                                       #
..LN161:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.16:                        # Preds ..B1.15
..LN162:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm5            #84.50
..LN163:
        vmovsd    440(%rsp), %xmm1                              #84.50
..LN164:
        vmovsd    384(%rsp), %xmm2                              #84.50
..LN165:
        vmovhpd   416(%rsp), %xmm1, %xmm3                       #84.50
..LN166:
        vunpcklpd %xmm0, %xmm2, %xmm4                           #84.50
..LN167:
        vmovups   (%rsp), %ymm7                                 #84.50
..LN168:
   .loc    1  85  is_stmt 1
        vmovupd   .L_2il0floatpacket.23(%rip), %ymm10           #85.51
..LN169:
        vaddpd    (%r12,%r14,8), %ymm10, %ymm0                  #85.51
..LN170:
        vextractf128 $1, %ymm0, 112(%rsp)                       #85.38
..LN171:
   .loc    1  84  is_stmt 1
        vinsertf128 $1, %xmm4, %ymm3, %ymm6                     #84.50
..LN172:
        vsubpd    %ymm6, %ymm5, %ymm8                           #84.50
..LN173:
        vdivpd    %ymm8, %ymm7, %ymm9                           #84.50
..LN174:
        vmovupd   %ymm9, (%r15,%r14,8)                          #84.13
..LN175:
   .loc    1  85  is_stmt 1
        vmovaps   %xmm0, %xmm1                                  #85.38
..LN176:
        vmovapd   %xmm1, %xmm0                                  #85.38
..LN177:
        vzeroupper                                              #85.38
..LN178:
        vmovups   %xmm1, 208(%rsp)                              #85.38
..___tag_value_NA_STA.35:                                       #85.38
..LN179:
        call      exp                                           #85.38
..___tag_value_NA_STA.36:                                       #
..LN180:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.56:                        # Preds ..B1.16
..LN181:
        vmovups   208(%rsp), %xmm1                              #
..LN182:
        vmovsd    %xmm0, 320(%rsp)                              #85.38
..LN183:
                                # LOE rbx r12 r13 r14 r15 xmm1 ymm1 zmm1
..B1.17:                        # Preds ..B1.56
..LN184:
        vpshufd   $14, %xmm1, %xmm0                             #85.38
..___tag_value_NA_STA.37:                                       #85.38
..LN185:
        call      exp                                           #85.38
..___tag_value_NA_STA.38:                                       #
..LN186:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.57:                        # Preds ..B1.17
..LN187:
        vmovsd    %xmm0, 376(%rsp)                              #85.38
..LN188:
                                # LOE rbx r12 r13 r14 r15
..B1.18:                        # Preds ..B1.57
..LN189:
        vmovsd    112(%rsp), %xmm0                              #85.38
..___tag_value_NA_STA.39:                                       #85.38
..LN190:
        call      exp                                           #85.38
..___tag_value_NA_STA.40:                                       #
..LN191:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.58:                        # Preds ..B1.18
..LN192:
        vmovsd    %xmm0, 432(%rsp)                              #85.38
..LN193:
                                # LOE rbx r12 r13 r14 r15
..B1.19:                        # Preds ..B1.58
..LN194:
        vpshufd   $14, 112(%rsp), %xmm0                         #85.38
..___tag_value_NA_STA.41:                                       #85.38
..LN195:
        call      exp                                           #85.38
..___tag_value_NA_STA.42:                                       #
..LN196:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.20:                        # Preds ..B1.19
..LN197:
        vmovsd    320(%rsp), %xmm1                              #85.38
..LN198:
        vmovsd    432(%rsp), %xmm2                              #85.38
..LN199:
   .loc    1  86  is_stmt 1
        movq      272(%rsp), %rsi                               #86.33
..LN200:
   .loc    1  85  is_stmt 1
        vmovhpd   376(%rsp), %xmm1, %xmm3                       #85.38
..LN201:
        vunpcklpd %xmm0, %xmm2, %xmm4                           #85.38
..LN202:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm10           #85.58
..LN203:
   .loc    1  86  is_stmt 1
        vmovupd   (%rsi,%r14,8), %ymm9                          #86.33
..LN204:
   .loc    1  87  is_stmt 1
        vmovupd   .L_2il0floatpacket.25(%rip), %ymm13           #87.44
..LN205:
   .loc    1  86  is_stmt 1
        vaddpd    (%r15,%r14,8), %ymm9, %ymm11                  #86.47
..LN206:
   .loc    1  87  is_stmt 1
        vdivpd    (%rbx,%r14,8), %ymm13, %ymm0                  #87.44
..LN207:
   .loc    1  86  is_stmt 1
        vdivpd    %ymm11, %ymm10, %ymm12                        #86.47
..LN208:
   .loc    1  87  is_stmt 1
        vextractf128 $1, %ymm0, 128(%rsp)                       #87.33
..LN209:
   .loc    1  85  is_stmt 1
        movq      24(%rbp), %rax                                #85.13
..LN210:
   .loc    1  86  is_stmt 1
        movq      16(%rbp), %rdi                                #86.13
..LN211:
   .loc    1  85  is_stmt 1
        vinsertf128 $1, %xmm4, %ymm3, %ymm5                     #85.38
..LN212:
        vmulpd    .L_2il0floatpacket.24(%rip), %ymm5, %ymm6     #85.58
..LN213:
   .loc    1  86  is_stmt 1
        vmovupd   %ymm12, (%rdi,%r14,8)                         #86.13
..LN214:
   .loc    1  85  is_stmt 1
        vaddpd    %ymm6, %ymm10, %ymm7                          #85.58
..LN215:
        vdivpd    %ymm7, %ymm10, %ymm8                          #85.58
..LN216:
        vmovupd   %ymm8, (%rax,%r14,8)                          #85.13
..LN217:
   .loc    1  87  is_stmt 1
        vmovaps   %xmm0, %xmm1                                  #87.33
..LN218:
        vmovapd   %xmm1, %xmm0                                  #87.33
..LN219:
        vzeroupper                                              #87.33
..LN220:
        vmovups   %xmm1, 224(%rsp)                              #87.33
..___tag_value_NA_STA.43:                                       #87.33
..LN221:
        call      exp                                           #87.33
..___tag_value_NA_STA.44:                                       #
..LN222:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.60:                        # Preds ..B1.20
..LN223:
        vmovups   224(%rsp), %xmm1                              #
..LN224:
        vmovsd    %xmm0, 328(%rsp)                              #87.33
..LN225:
                                # LOE rbx r12 r13 r14 r15 xmm1 ymm1 zmm1
..B1.21:                        # Preds ..B1.60
..LN226:
        vpshufd   $14, %xmm1, %xmm0                             #87.33
..___tag_value_NA_STA.45:                                       #87.33
..LN227:
        call      exp                                           #87.33
..___tag_value_NA_STA.46:                                       #
..LN228:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.61:                        # Preds ..B1.21
..LN229:
        vmovsd    %xmm0, 408(%rsp)                              #87.33
..LN230:
                                # LOE rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.61
..LN231:
        vmovsd    128(%rsp), %xmm0                              #87.33
..___tag_value_NA_STA.47:                                       #87.33
..LN232:
        call      exp                                           #87.33
..___tag_value_NA_STA.48:                                       #
..LN233:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.62:                        # Preds ..B1.22
..LN234:
        vmovsd    %xmm0, 352(%rsp)                              #87.33
..LN235:
                                # LOE rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.62
..LN236:
        vpshufd   $14, 128(%rsp), %xmm0                         #87.33
..___tag_value_NA_STA.49:                                       #87.33
..LN237:
        call      exp                                           #87.33
..___tag_value_NA_STA.50:                                       #
..LN238:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.24:                        # Preds ..B1.23
..LN239:
   .loc    1  88  is_stmt 1

###             C_h[i]     += (1. - exp(-0.1 / C_hTau[i])) * (C_hInf[i] - C_h[i]);

        vmovupd   .L_2il0floatpacket.25(%rip), %ymm12           #88.44
..LN240:
   .loc    1  87  is_stmt 1
        vmovsd    352(%rsp), %xmm2                              #87.33
..LN241:
        vunpcklpd %xmm0, %xmm2, %xmm4                           #87.33
..LN242:
        vmovsd    328(%rsp), %xmm1                              #87.33
..LN243:
        vmovhpd   408(%rsp), %xmm1, %xmm3                       #87.33
..LN244:
   .loc    1  88  is_stmt 1
        movq      16(%rbp), %rsi                                #88.44
..LN245:
   .loc    1  87  is_stmt 1
        vmovupd   (%r13,%r14,8), %ymm5                          #87.59
..LN246:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm6            #87.33
..LN247:
   .loc    1  88  is_stmt 1
        vdivpd    (%rsi,%r14,8), %ymm12, %ymm0                  #88.44
..LN248:
   .loc    1  87  is_stmt 1
        movq      32(%rbp), %rax                                #87.71
..LN249:
   .loc    1  88  is_stmt 1
        vextractf128 $1, %ymm0, 144(%rsp)                       #88.33
..LN250:
   .loc    1  87  is_stmt 1
        vsubpd    (%rax,%r14,8), %ymm5, %ymm8                   #87.71
..LN251:
        vinsertf128 $1, %xmm4, %ymm3, %ymm7                     #87.33
..LN252:
        vsubpd    %ymm7, %ymm6, %ymm9                           #87.33
..LN253:
        vmulpd    %ymm9, %ymm8, %ymm10                          #87.71
..LN254:
        vaddpd    (%rax,%r14,8), %ymm10, %ymm11                 #87.13
..LN255:
        vmovupd   %ymm11, (%rax,%r14,8)                         #87.13
..LN256:
   .loc    1  88  is_stmt 1
        vmovaps   %xmm0, %xmm1                                  #88.33
..LN257:
        vmovapd   %xmm1, %xmm0                                  #88.33
..LN258:
        vzeroupper                                              #88.33
..LN259:
        vmovups   %xmm1, 240(%rsp)                              #88.33
..___tag_value_NA_STA.51:                                       #88.33
..LN260:
        call      exp                                           #88.33
..___tag_value_NA_STA.52:                                       #
..LN261:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.64:                        # Preds ..B1.24
..LN262:
        vmovups   240(%rsp), %xmm1                              #
..LN263:
        vmovsd    %xmm0, 336(%rsp)                              #88.33
..LN264:
                                # LOE rbx r12 r13 r14 r15 xmm1 ymm1 zmm1
..B1.25:                        # Preds ..B1.64
..LN265:
        vpshufd   $14, %xmm1, %xmm0                             #88.33
..___tag_value_NA_STA.53:                                       #88.33
..LN266:
        call      exp                                           #88.33
..___tag_value_NA_STA.54:                                       #
..LN267:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.65:                        # Preds ..B1.25
..LN268:
        vmovsd    %xmm0, 400(%rsp)                              #88.33
..LN269:
                                # LOE rbx r12 r13 r14 r15
..B1.26:                        # Preds ..B1.65
..LN270:
        vmovsd    144(%rsp), %xmm0                              #88.33
..___tag_value_NA_STA.55:                                       #88.33
..LN271:
        call      exp                                           #88.33
..___tag_value_NA_STA.56:                                       #
..LN272:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.66:                        # Preds ..B1.26
..LN273:
        vmovsd    %xmm0, 392(%rsp)                              #88.33
..LN274:
                                # LOE rbx r12 r13 r14 r15
..B1.27:                        # Preds ..B1.66
..LN275:
        vpshufd   $14, 144(%rsp), %xmm0                         #88.33
..___tag_value_NA_STA.57:                                       #88.33
..LN276:
        call      exp                                           #88.33
..___tag_value_NA_STA.58:                                       #
..LN277:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.67:                        # Preds ..B1.27
..LN278:
        vmovapd   %xmm0, %xmm3                                  #88.33
..LN279:
                                # LOE rbx r12 r13 r14 r15 xmm3
..B1.28:                        # Preds ..B1.67
..LN280:
        movq      24(%rbp), %rax                                #88.59
..LN281:
        vmovupd   .L_2il0floatpacket.16(%rip), %ymm5            #88.33
..LN282:
        vmovsd    336(%rsp), %xmm0                              #88.33
..LN283:
        vmovhpd   400(%rsp), %xmm0, %xmm2                       #88.33
..LN284:
        vmovapd   %xmm3, %xmm0                                  #88.33
..LN285:
        vmovsd    392(%rsp), %xmm1                              #88.33
..LN286:
        vunpcklpd %xmm0, %xmm1, %xmm3                           #88.33
..LN287:
        vmovupd   (%rax,%r14,8), %ymm4                          #88.59
..LN288:
        movq      40(%rbp), %rsi                                #88.71
..LN289:
        vinsertf128 $1, %xmm3, %ymm2, %ymm6                     #88.33
..LN290:
        vsubpd    (%rsi,%r14,8), %ymm4, %ymm7                   #88.71
..LN291:
        vsubpd    %ymm6, %ymm5, %ymm8                           #88.33
..LN292:
        vmulpd    %ymm8, %ymm7, %ymm9                           #88.71
..LN293:
        vaddpd    (%rsi,%r14,8), %ymm9, %ymm10                  #88.13
..LN294:
        vmovupd   %ymm10, (%rsi,%r14,8)                         #88.13
..LN295:
   .loc    1  52  is_stmt 1
        addq      $4, %r14                                      #52.5
..LN296:
        cmpq      296(%rsp), %r14                               #52.5
..LN297:
        jb        ..B1.4        # Prob 82%                      #52.5
..LN298:
                                # LOE rbx r12 r13 r14 r15
..B1.29:                        # Preds ..B1.28
..LN299:
        movq      296(%rsp), %r11                               #
..LN300:
        movq      %rbx, %rdx                                    #
..LN301:
        movq      264(%rsp), %rdi                               #
..LN302:
        movq      %r13, %rcx                                    #
..LN303:
        movq      256(%rsp), %rsi                               #
..LN304:
        movq      %r15, %r9                                     #
..LN305:
        movq      272(%rsp), %r8                                #
..LN306:
        vxorpd    %xmm14, %xmm14, %xmm14                        #
..LN307:
        movslq    56(%rbp), %rax                                #
..LN308:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 xmm14
..B1.30:                        # Preds ..B1.29 ..B1.41
..LN309:
        cmpq      %rax, %r11                                    #52.5
..LN310:
        jae       ..B1.40       # Prob 10%                      #52.5
..LN311:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 xmm14
..B1.31:                        # Preds ..B1.30
..LN312:
   .loc    1  83  is_stmt 1
        vmovsd    .L_2il0floatpacket.21(%rip), %xmm12           #83.59
..LN313:
   .loc    1  87  is_stmt 1
        movq      %rdx, %r13                                    #87.37
..LN314:
   .loc    1  84  is_stmt 1
        vmulsd    %xmm14, %xmm12, %xmm11                        #84.61
..LN315:
   .loc    1  87  is_stmt 1
        movq      %rcx, %r15                                    #87.37
..LN316:
   .loc    1  84  is_stmt 1
        vmulsd    .L_2il0floatpacket.22(%rip), %xmm14, %xmm10   #84.37
..LN317:
   .loc    1  75  is_stmt 1
        vmovsd    .L_2il0floatpacket.26(%rip), %xmm9            #75.36
..LN318:
   .loc    1  87  is_stmt 1
        movq      %r11, %rbx                                    #87.37
..LN319:
   .loc    1  76  is_stmt 1
        vmovsd    .L_2il0floatpacket.27(%rip), %xmm8            #76.38
..LN320:
   .loc    1  77  is_stmt 1
        vmovsd    .L_2il0floatpacket.28(%rip), %xmm7            #77.27
..LN321:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #77.57
..LN322:
   .loc    1  78  is_stmt 1
        vmovsd    .L_2il0floatpacket.29(%rip), %xmm6            #78.27
..LN323:
   .loc    1  83  is_stmt 1
        vmovsd    .L_2il0floatpacket.31(%rip), %xmm4            #83.27
..LN324:
   .loc    1  85  is_stmt 1
        vmovsd    .L_2il0floatpacket.32(%rip), %xmm3            #85.51
..LN325:
   .loc    1  87  is_stmt 1
        vmovsd    %xmm10, 8(%rsp)                               #87.37
..LN326:
        vmovsd    %xmm11, (%rsp)                                #87.37
..LN327:
        movq      %rdi, 264(%rsp)                               #87.37
..LN328:
        movq      %rsi, 256(%rsp)                               #87.37
..LN329:
        movq      %r8, 272(%rsp)                                #87.37
..LN330:
        movq      %r9, 16(%rsp)                                 #87.37
..LN331:
        movq      48(%rbp), %r12                                #87.37
..LN332:
        movq      16(%rbp), %r14                                #87.37
..LN333:
                                # LOE rbx r12 r13 r14 r15 xmm1
..B1.32:                        # Preds ..B1.38 ..B1.31
..LN334:
   .loc    1  75  is_stmt 1
        vmovsd    .L_2il0floatpacket.26(%rip), %xmm2            #75.36
..LN335:
        vaddsd    (%r12,%rbx,8), %xmm2, %xmm5                   #75.36
..LN336:
   .loc    1  76  is_stmt 1
        vmulsd    .L_2il0floatpacket.27(%rip), %xmm5, %xmm0     #76.27
..LN337:
        vzeroupper                                              #76.27
..LN338:
        vmovsd    %xmm5, 32(%rsp)                               #76.27
..___tag_value_NA_STA.59:                                       #76.27
..LN339:
        call      exp                                           #76.27
..___tag_value_NA_STA.60:                                       #
..LN340:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.68:                        # Preds ..B1.32
..LN341:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN342:
        vmovsd    32(%rsp), %xmm5                               #
..LN343:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1 xmm5
..B1.33:                        # Preds ..B1.68
..LN344:
   .loc    1  77  is_stmt 1
        vmulsd    .L_2il0floatpacket.28(%rip), %xmm0, %xmm2     #77.35
..LN345:
        vsubsd    %xmm0, %xmm1, %xmm6                           #77.57
..LN346:
        vmulsd    %xmm5, %xmm2, %xmm3                           #77.42
..LN347:
   .loc    1  78  is_stmt 1
        vmulsd    .L_2il0floatpacket.29(%rip), %xmm5, %xmm5     #78.36
..LN348:
   .loc    1  77  is_stmt 1
        vxorpd    .L_2il0floatpacket.35(%rip), %xmm6, %xmm4     #77.57
..LN349:
        vdivsd    %xmm4, %xmm3, %xmm9                           #77.57
..LN350:
   .loc    1  78  is_stmt 1
        vdivsd    %xmm6, %xmm5, %xmm7                           #78.49
..LN351:
   .loc    1  82  is_stmt 1
        vmovsd    .L_2il0floatpacket.30(%rip), %xmm12           #82.36
..LN352:
   .loc    1  79  is_stmt 1
        vaddsd    %xmm7, %xmm9, %xmm8                           #79.47
..LN353:
   .loc    1  82  is_stmt 1
        vaddsd    (%r12,%rbx,8), %xmm12, %xmm13                 #82.36
..LN354:
   .loc    1  79  is_stmt 1
        vdivsd    %xmm8, %xmm1, %xmm10                          #79.47
..LN355:
   .loc    1  80  is_stmt 1
        vmulsd    %xmm10, %xmm9, %xmm11                         #80.41
..LN356:
   .loc    1  83  is_stmt 1
        vmulsd    .L_2il0floatpacket.21(%rip), %xmm13, %xmm0    #83.48
..LN357:
   .loc    1  77  is_stmt 1
        movq      264(%rsp), %rax                               #77.13
..LN358:
   .loc    1  78  is_stmt 1
        movq      256(%rsp), %rsi                               #78.13
..LN359:
   .loc    1  79  is_stmt 1
        vmovsd    %xmm10, (%r13,%rbx,8)                         #79.13
..LN360:
   .loc    1  77  is_stmt 1
        vmovsd    %xmm9, (%rax,%rbx,8)                          #77.13
..LN361:
   .loc    1  78  is_stmt 1
        vmovsd    %xmm7, (%rsi,%rbx,8)                          #78.13
..LN362:
   .loc    1  80  is_stmt 1
        vmovsd    %xmm11, (%r15,%rbx,8)                         #80.13
..LN363:
   .loc    1  82  is_stmt 1
        vmovsd    %xmm13, 24(%rsp)                              #82.36
..___tag_value_NA_STA.61:                                       #83.48
..LN364:
   .loc    1  83  is_stmt 1
        call      exp                                           #83.48
..___tag_value_NA_STA.62:                                       #
..LN365:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.69:                        # Preds ..B1.33
..LN366:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN367:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1
..B1.34:                        # Preds ..B1.69
..LN368:
        vmovsd    24(%rsp), %xmm2                               #83.35
..LN369:
        vsubsd    %xmm0, %xmm1, %xmm4                           #83.48
..LN370:
        vmulsd    .L_2il0floatpacket.31(%rip), %xmm2, %xmm3     #83.35
..LN371:
        vdivsd    %xmm4, %xmm3, %xmm5                           #83.48
..LN372:
        movq      272(%rsp), %rax                               #83.13
..LN373:
        vmovsd    %xmm5, (%rax,%rbx,8)                          #83.13
..LN374:
   .loc    1  84  is_stmt 1
        vmovsd    (%rsp), %xmm0                                 #84.50
..___tag_value_NA_STA.63:                                       #84.50
..LN375:
        call      exp                                           #84.50
..___tag_value_NA_STA.64:                                       #
..LN376:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.70:                        # Preds ..B1.34
..LN377:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN378:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1
..B1.35:                        # Preds ..B1.70
..LN379:
        vmovsd    8(%rsp), %xmm2                                #84.50
..LN380:
        vsubsd    %xmm0, %xmm1, %xmm3                           #84.50
..LN381:
        vdivsd    %xmm3, %xmm2, %xmm4                           #84.50
..LN382:
        movq      16(%rsp), %rax                                #84.13
..LN383:
   .loc    1  85  is_stmt 1
        vmovsd    .L_2il0floatpacket.32(%rip), %xmm5            #85.38
..LN384:
        vaddsd    (%r12,%rbx,8), %xmm5, %xmm0                   #85.38
..LN385:
   .loc    1  84  is_stmt 1
        vmovsd    %xmm4, (%rax,%rbx,8)                          #84.13
..___tag_value_NA_STA.65:                                       #85.38
..LN386:
   .loc    1  85  is_stmt 1
        call      exp                                           #85.38
..___tag_value_NA_STA.66:                                       #
..LN387:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.71:                        # Preds ..B1.35
..LN388:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN389:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1
..B1.36:                        # Preds ..B1.71
..LN390:
        vmulsd    .L_2il0floatpacket.33(%rip), %xmm0, %xmm2     #85.58
..LN391:
   .loc    1  86  is_stmt 1
        movq      272(%rsp), %rsi                               #86.33
..LN392:
   .loc    1  85  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #85.58
..LN393:
   .loc    1  86  is_stmt 1
        movq      16(%rsp), %rdi                                #86.47
..LN394:
        vmovsd    (%rsi,%rbx,8), %xmm5                          #86.33
..LN395:
   .loc    1  85  is_stmt 1
        vdivsd    %xmm3, %xmm1, %xmm4                           #85.58
..LN396:
        movq      24(%rbp), %rax                                #85.13
..LN397:
   .loc    1  87  is_stmt 1
        vmovsd    .L_2il0floatpacket.34(%rip), %xmm8            #87.33
..LN398:
        vdivsd    (%r13,%rbx,8), %xmm8, %xmm0                   #87.33
..LN399:
   .loc    1  85  is_stmt 1
        vmovsd    %xmm4, (%rax,%rbx,8)                          #85.13
..LN400:
   .loc    1  86  is_stmt 1
        vaddsd    (%rdi,%rbx,8), %xmm5, %xmm6                   #86.47
..LN401:
        vdivsd    %xmm6, %xmm1, %xmm7                           #86.47
..LN402:
        vmovsd    %xmm7, (%r14,%rbx,8)                          #86.13
..___tag_value_NA_STA.67:                                       #87.33
..LN403:
   .loc    1  87  is_stmt 1
        call      exp                                           #87.33
..___tag_value_NA_STA.68:                                       #
..LN404:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.72:                        # Preds ..B1.36
..LN405:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN406:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1
..B1.37:                        # Preds ..B1.72
..LN407:
        movq      32(%rbp), %rax                                #87.13
..LN408:
        vsubsd    %xmm0, %xmm1, %xmm4                           #87.33
..LN409:
        vmovsd    (%rax,%rbx,8), %xmm5                          #87.13
..LN410:
        vmovsd    (%r15,%rbx,8), %xmm2                          #87.59
..LN411:
   .loc    1  88  is_stmt 1
        vmovsd    .L_2il0floatpacket.34(%rip), %xmm8            #88.33
..LN412:
   .loc    1  87  is_stmt 1
        vsubsd    %xmm5, %xmm2, %xmm3                           #87.71
..LN413:
   .loc    1  88  is_stmt 1
        vdivsd    (%r14,%rbx,8), %xmm8, %xmm0                   #88.33
..LN414:
   .loc    1  87  is_stmt 1
        vmulsd    %xmm4, %xmm3, %xmm6                           #87.71
..LN415:
        vaddsd    %xmm6, %xmm5, %xmm7                           #87.13
..LN416:
        vmovsd    %xmm7, (%rax,%rbx,8)                          #87.13
..___tag_value_NA_STA.69:                                       #88.33
..LN417:
   .loc    1  88  is_stmt 1
        call      exp                                           #88.33
..___tag_value_NA_STA.70:                                       #
..LN418:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.73:                        # Preds ..B1.37
..LN419:
        vmovsd    .L_2il0floatpacket.36(%rip), %xmm1            #
..LN420:
        vmovapd   %xmm0, %xmm3                                  #88.33
..LN421:
                                # LOE rbx r12 r13 r14 r15 xmm1 xmm3
..B1.38:                        # Preds ..B1.73
..LN422:
        movq      40(%rbp), %rsi                                #88.13
..LN423:
        vsubsd    %xmm3, %xmm1, %xmm3                           #88.33
..LN424:
        movq      24(%rbp), %rax                                #88.59
..LN425:
        vmovsd    (%rsi,%rbx,8), %xmm4                          #88.13
..LN426:
   .loc    1  52  is_stmt 1
        movslq    56(%rbp), %rdi                                #52.5
..LN427:
   .loc    1  88  is_stmt 1
        vmovsd    (%rax,%rbx,8), %xmm0                          #88.59
..LN428:
        vsubsd    %xmm4, %xmm0, %xmm2                           #88.71
..LN429:
        vmulsd    %xmm3, %xmm2, %xmm5                           #88.71
..LN430:
        vaddsd    %xmm5, %xmm4, %xmm6                           #88.13
..LN431:
        vmovsd    %xmm6, (%rsi,%rbx,8)                          #88.13
..LN432:
   .loc    1  52  is_stmt 1
        incq      %rbx                                          #52.5
..LN433:
        cmpq      %rdi, %rbx                                    #52.5
..LN434:
        jb        ..B1.32       # Prob 82%                      #52.5
..LN435:
                                # LOE rbx r12 r13 r14 r15 xmm1
..B1.40:                        # Preds ..B1.38 ..B1.1 ..B1.30
..LN436:
   .loc    1  103  is_stmt 1

###         // #endif
###     }
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("NA_STA"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     return 0.1;

        vzeroupper                                              #103.12
..LN437:
        vmovsd    .L_2il0floatpacket.12(%rip), %xmm0            #103.12
..LN438:
        addq      $472, %rsp                                    #103.12
..___tag_value_NA_STA.71:                                       #103.12
..LN439:
        popq      %rbx                                          #103.12
..___tag_value_NA_STA.72:                                       #103.12
..LN440:
        popq      %r15                                          #103.12
..___tag_value_NA_STA.73:                                       #103.12
..LN441:
        popq      %r14                                          #103.12
..___tag_value_NA_STA.74:                                       #103.12
..LN442:
        popq      %r13                                          #103.12
..___tag_value_NA_STA.75:                                       #103.12
..LN443:
        popq      %r12                                          #103.12
..LN444:
        movq      %rbp, %rsp                                    #103.12
..LN445:
        popq      %rbp                                          #103.12
..___tag_value_NA_STA.76:                                       #
..LN446:
        ret                                                     #103.12
..___tag_value_NA_STA.78:                                       #
..LN447:
                                # LOE
..B1.41:                        # Preds ..B1.2                  # Infreq
..LN448:
   .loc    1  52  is_stmt 1
        xorl      %r11d, %r11d                                  #52.5
..LN449:
        jmp       ..B1.30       # Prob 100%                     #52.5
        .align    16,0x90
..___tag_value_NA_STA.85:                                       #
..LN450:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 xmm14
..LN451:
# mark_end;
	.type	NA_STA,@function
	.size	NA_STA,.-NA_STA
..LNNA_STA.452:
.LNNA_STA:
	.data
# -- End  NA_STA
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.13:
	.long	0x00000000,0x40418000,0x00000000,0x40418000,0x00000000,0x40418000,0x00000000,0x40418000
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,32
	.align 32
.L_2il0floatpacket.14:
	.long	0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7,0x1c71c3fc,0x3fbc71c7
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,32
	.align 32
.L_2il0floatpacket.15:
	.long	0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d,0xd2f1a9fc,0x3fc0624d
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,32
	.align 32
.L_2il0floatpacket.16:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,32
	.align 32
.L_2il0floatpacket.17:
	.long	0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76,0xc8b43958,0xbfbfbe76
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,32
	.align 32
.L_2il0floatpacket.18:
	.long	0x00000000,0x4052c000,0x00000000,0x4052c000,0x00000000,0x4052c000,0x00000000,0x4052c000
	.type	.L_2il0floatpacket.18,@object
	.size	.L_2il0floatpacket.18,32
	.align 32
.L_2il0floatpacket.19:
	.long	0x9999999a,0x3fc99999,0x9999999a,0x3fc99999,0x9999999a,0x3fc99999,0x9999999a,0x3fc99999
	.type	.L_2il0floatpacket.19,@object
	.size	.L_2il0floatpacket.19,32
	.align 32
.L_2il0floatpacket.20:
	.long	0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374,0xbc6a7efa,0x3f989374
	.type	.L_2il0floatpacket.20,@object
	.size	.L_2il0floatpacket.20,32
	.align 32
.L_2il0floatpacket.23:
	.long	0x00000000,0x40504000,0x00000000,0x40504000,0x00000000,0x40504000,0x00000000,0x40504000
	.type	.L_2il0floatpacket.23,@object
	.size	.L_2il0floatpacket.23,32
	.align 32
.L_2il0floatpacket.24:
	.long	0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8,0x2f5e1c46,0x3f8f81f8
	.type	.L_2il0floatpacket.24,@object
	.size	.L_2il0floatpacket.24,32
	.align 32
.L_2il0floatpacket.25:
	.long	0x9999999a,0xbfb99999,0x9999999a,0xbfb99999,0x9999999a,0xbfb99999,0x9999999a,0xbfb99999
	.type	.L_2il0floatpacket.25,@object
	.size	.L_2il0floatpacket.25,32
	.align 16
.L_2il0floatpacket.35:
	.long	0x00000000,0x80000000,0x00000000,0x00000000
	.type	.L_2il0floatpacket.35,@object
	.size	.L_2il0floatpacket.35,16
	.align 8
.L_2il0floatpacket.12:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,8
	.align 8
.L_2il0floatpacket.21:
	.long	0x9999999a,0x3fc99999
	.type	.L_2il0floatpacket.21,@object
	.size	.L_2il0floatpacket.21,8
	.align 8
.L_2il0floatpacket.22:
	.long	0x532617c2,0xbf82a305
	.type	.L_2il0floatpacket.22,@object
	.size	.L_2il0floatpacket.22,8
	.align 8
.L_2il0floatpacket.26:
	.long	0x00000000,0x40418000
	.type	.L_2il0floatpacket.26,@object
	.size	.L_2il0floatpacket.26,8
	.align 8
.L_2il0floatpacket.27:
	.long	0x1c71c3fc,0x3fbc71c7
	.type	.L_2il0floatpacket.27,@object
	.size	.L_2il0floatpacket.27,8
	.align 8
.L_2il0floatpacket.28:
	.long	0xd2f1a9fc,0x3fc0624d
	.type	.L_2il0floatpacket.28,@object
	.size	.L_2il0floatpacket.28,8
	.align 8
.L_2il0floatpacket.29:
	.long	0xc8b43958,0xbfbfbe76
	.type	.L_2il0floatpacket.29,@object
	.size	.L_2il0floatpacket.29,8
	.align 8
.L_2il0floatpacket.30:
	.long	0x00000000,0x4052c000
	.type	.L_2il0floatpacket.30,@object
	.size	.L_2il0floatpacket.30,8
	.align 8
.L_2il0floatpacket.31:
	.long	0xbc6a7efa,0x3f989374
	.type	.L_2il0floatpacket.31,@object
	.size	.L_2il0floatpacket.31,8
	.align 8
.L_2il0floatpacket.32:
	.long	0x00000000,0x40504000
	.type	.L_2il0floatpacket.32,@object
	.size	.L_2il0floatpacket.32,8
	.align 8
.L_2il0floatpacket.33:
	.long	0x2f5e1c46,0x3f8f81f8
	.type	.L_2il0floatpacket.33,@object
	.size	.L_2il0floatpacket.33,8
	.align 8
.L_2il0floatpacket.34:
	.long	0x9999999a,0xbfb99999
	.type	.L_2il0floatpacket.34,@object
	.size	.L_2il0floatpacket.34,8
	.align 8
.L_2il0floatpacket.36:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.36,@object
	.size	.L_2il0floatpacket.36,8
	.data
	.section .note.GNU-stack, ""
# End
