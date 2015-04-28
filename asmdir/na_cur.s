	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -DLIKEXT=0 -vec-report3 -o asmdir/na_cur.s";
	.file "na_cur.c"
	.text
..TXTST0:
L__routine_start_NA_CUR_0:
# -- Begin  NA_CUR
# mark_begin;
       .align    16,0x90
	.globl NA_CUR
NA_CUR:
# parameter 1(C_a): %rdi
# parameter 2(C_b): %rsi
# parameter 3(C_c): %rdx
# parameter 4(C_d): %rcx
# parameter 5(C_e): %r8
# parameter 6(C_f): %r9
# parameter 7(C_g): 48 + %rsp
# parameter 8(C_h): 56 + %rsp
# parameter 9(PVAR_0): 64 + %rsp
# parameter 10(PVAR_1): 72 + %rsp
# parameter 11(PVAR_2): 80 + %rsp
# parameter 12(RHS_0): 88 + %rsp
# parameter 13(V_0): 96 + %rsp
# parameter 14(n): 104 + %rsp
..B1.1:                         # Preds ..B1.0

###     double * restrict PVAR_2, double * restrict RHS_0, double * restrict V_0, int n){

..___tag_value_NA_CUR.1:                                        #7.85
..LN0:
  .file   1 "na_cur.c"
   .loc    1  7  is_stmt 1
        pushq     %r12                                          #7.85
..___tag_value_NA_CUR.3:                                        #
..LN1:
        pushq     %r13                                          #7.85
..___tag_value_NA_CUR.5:                                        #
..LN2:
        pushq     %r14                                          #7.85
..___tag_value_NA_CUR.7:                                        #
..LN3:
        pushq     %r15                                          #7.85
..___tag_value_NA_CUR.9:                                        #
..LN4:
        pushq     %rbx                                          #7.85
..___tag_value_NA_CUR.11:                                       #
..LN5:
        movq      %rsi, %r10                                    #7.85
..LN6:
        movslq    104(%rsp), %r11                               #7.85
..LN7:
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
###     likwid_markerStartRegion("NA_CUR");
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

        testq     %r11, %r11                                    #31.23
..LN8:
        jle       ..B1.10       # Prob 50%                      #31.23
..LN9:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN10:
        cmpq      $4, %r11                                      #31.5
..LN11:
        jl        ..B1.11       # Prob 10%                      #31.5
..LN12:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
..LN13:
        movl      %r11d, %eax                                   #31.5
..LN14:
        xorl      %esi, %esi                                    #31.5
..LN15:
        andl      $-4, %eax                                     #31.5
..LN16:
        movslq    %eax, %rax                                    #31.5
..LN17:
   .loc    1  35  is_stmt 1

### 
###         C_f[i] *= PVAR_0[i];
###         
###         C_g[i] = V_0[i] + 0.001;

        vmovupd   .L_2il0floatpacket.15(%rip), %ymm1            #35.27
..LN18:
   .loc    1  47  is_stmt 1

###         C_c[i] = C_a[i] * C_d[i] * C_d[i] * C_d[i] * C_e[i];
###         C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
###         C_h[i] = C_b[i];
###         
###         dina = C_b[i];
### 
###         C_g[i] = V_0[i];
###         //C_c[i] is not modified.
###         C_b[i] = C_c[i] * (C_g[i] - C_f[i]);
###         rhs = C_b[i];
### 
###         PVAR_2[i] += (dina - C_b[i]) * 1000.;

        vmovupd   .L_2il0floatpacket.16(%rip), %ymm0            #47.40
..LN19:
        movq      88(%rsp), %r12                                #47.40
..LN20:
        movq      80(%rsp), %r13                                #47.40
..LN21:
        movq      72(%rsp), %r14                                #47.40
..LN22:
        movq      56(%rsp), %rbx                                #47.40
..LN23:
        movq      48(%rsp), %r11                                #47.40
..LN24:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 ymm0 ymm1
..B1.4:                         # Preds ..B1.4 ..B1.3
..LN25:
   .loc    1  36  is_stmt 1
        vmovupd   (%rcx,%rsi,8), %ymm5                          #36.27
..LN26:
   .loc    1  33  is_stmt 1
        vmovupd   (%r9,%rsi,8), %ymm2                           #33.9
..LN27:
   .loc    1  36  is_stmt 1
        vmulpd    (%rdi,%rsi,8), %ymm5, %ymm3                   #36.27
..LN28:
   .loc    1  33  is_stmt 1
        movq      64(%rsp), %r15                                #33.9
..LN29:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm5, %ymm3, %ymm4                           #36.36
..LN30:
   .loc    1  33  is_stmt 1
        vmulpd    (%r15,%rsi,8), %ymm2, %ymm10                  #33.9
..LN31:
   .loc    1  36  is_stmt 1
        vmulpd    %ymm5, %ymm4, %ymm6                           #36.45
..LN32:
   .loc    1  33  is_stmt 1
        vmovupd   %ymm10, (%r9,%rsi,8)                          #33.9
..LN33:
   .loc    1  36  is_stmt 1
        vmulpd    (%r8,%rsi,8), %ymm6, %ymm11                   #36.54
..LN34:
   .loc    1  35  is_stmt 1
        movq      96(%rsp), %r15                                #35.18
..LN35:
   .loc    1  36  is_stmt 1
        vmovupd   %ymm11, (%rdx,%rsi,8)                         #36.9
..LN36:
   .loc    1  35  is_stmt 1
        vmovupd   (%r15,%rsi,8), %ymm9                          #35.18
..LN37:
        vaddpd    %ymm9, %ymm1, %ymm7                           #35.27
..LN38:
   .loc    1  44  is_stmt 1
        vsubpd    %ymm10, %ymm9, %ymm12                         #44.37
..LN39:
   .loc    1  42  is_stmt 1
        vmovupd   %ymm9, (%r11,%rsi,8)                          #42.9
..LN40:
   .loc    1  44  is_stmt 1
        vmulpd    %ymm12, %ymm11, %ymm2                         #44.37
..LN41:
   .loc    1  37  is_stmt 1
        vsubpd    %ymm10, %ymm7, %ymm8                          #37.37
..LN42:
   .loc    1  44  is_stmt 1
        vmovupd   %ymm2, (%r10,%rsi,8)                          #44.9
..LN43:
   .loc    1  37  is_stmt 1
        vmulpd    %ymm8, %ymm11, %ymm13                         #37.37
..LN44:
   .loc    1  47  is_stmt 1
        vsubpd    %ymm2, %ymm13, %ymm14                         #47.30
..LN45:
        vmulpd    %ymm14, %ymm0, %ymm13                         #47.40
..LN46:
   .loc    1  49  is_stmt 1

###         C_h[i] = (C_h[i] - rhs) * 1000.;
###         PVAR_1[i] += C_b[i];

        vaddpd    (%r14,%rsi,8), %ymm2, %ymm14                  #49.9
..LN47:
   .loc    1  47  is_stmt 1
        vaddpd    (%r13,%rsi,8), %ymm13, %ymm15                 #47.9
..LN48:
   .loc    1  48  is_stmt 1
        vmovupd   %ymm13, (%rbx,%rsi,8)                         #48.9
..LN49:
   .loc    1  49  is_stmt 1
        vmovupd   %ymm14, (%r14,%rsi,8)                         #49.9
..LN50:
   .loc    1  47  is_stmt 1
        vmovupd   %ymm15, (%r13,%rsi,8)                         #47.9
..LN51:
   .loc    1  50  is_stmt 1

###         RHS_0[i] -= rhs;

        vmovupd   (%r12,%rsi,8), %ymm15                         #50.9
..LN52:
        vsubpd    %ymm2, %ymm15, %ymm3                          #50.9
..LN53:
        vmovupd   %ymm3, (%r12,%rsi,8)                          #50.9
..LN54:
   .loc    1  31  is_stmt 1
        addq      $4, %rsi                                      #31.5
..LN55:
        cmpq      %rax, %rsi                                    #31.5
..LN56:
        jb        ..B1.4        # Prob 82%                      #31.5
..LN57:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 ymm0 ymm1
..B1.5:                         # Preds ..B1.4
..LN58:
        movslq    104(%rsp), %r11                               #
..LN59:
                                # LOE rax rdx rcx rbx rbp rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5 ..B1.11
..LN60:
        cmpq      %r11, %rax                                    #31.5
..LN61:
        jae       ..B1.10       # Prob 10%                      #31.5
..LN62:
                                # LOE rax rdx rcx rbx rbp rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
..LN63:
   .loc    1  35  is_stmt 1
        vmovsd    .L_2il0floatpacket.17(%rip), %xmm1            #35.27
..LN64:
   .loc    1  47  is_stmt 1
        vmovsd    .L_2il0floatpacket.18(%rip), %xmm0            #47.40
..LN65:
        movq      96(%rsp), %r11                                #47.40
..LN66:
        movq      88(%rsp), %r12                                #47.40
..LN67:
        movq      80(%rsp), %r13                                #47.40
..LN68:
        movq      72(%rsp), %r14                                #47.40
..LN69:
        movq      56(%rsp), %rsi                                #47.40
..LN70:
        movq      48(%rsp), %rbx                                #47.40
..LN71:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 xmm0 xmm1
..B1.8:                         # Preds ..B1.8 ..B1.7
..LN72:
   .loc    1  36  is_stmt 1
        vmovsd    (%rcx,%rax,8), %xmm5                          #36.27
..LN73:
        vmulsd    (%rdi,%rax,8), %xmm5, %xmm3                   #36.27
..LN74:
        vmulsd    %xmm5, %xmm3, %xmm4                           #36.36
..LN75:
   .loc    1  33  is_stmt 1
        movq      64(%rsp), %r15                                #33.9
..LN76:
        vmovsd    (%r9,%rax,8), %xmm2                           #33.9
..LN77:
   .loc    1  35  is_stmt 1
        vmovsd    (%r11,%rax,8), %xmm9                          #35.18
..LN78:
   .loc    1  33  is_stmt 1
        vmulsd    (%r15,%rax,8), %xmm2, %xmm10                  #33.9
..LN79:
   .loc    1  35  is_stmt 1
        vaddsd    %xmm9, %xmm1, %xmm7                           #35.27
..LN80:
   .loc    1  36  is_stmt 1
        vmulsd    %xmm5, %xmm4, %xmm6                           #36.45
..LN81:
   .loc    1  37  is_stmt 1
        vsubsd    %xmm10, %xmm7, %xmm8                          #37.37
..LN82:
   .loc    1  44  is_stmt 1
        vsubsd    %xmm10, %xmm9, %xmm12                         #44.37
..LN83:
   .loc    1  36  is_stmt 1
        vmulsd    (%r8,%rax,8), %xmm6, %xmm11                   #36.54
..LN84:
   .loc    1  37  is_stmt 1
        vmulsd    %xmm8, %xmm11, %xmm13                         #37.37
..LN85:
   .loc    1  44  is_stmt 1
        vmulsd    %xmm12, %xmm11, %xmm2                         #44.37
..LN86:
   .loc    1  35  is_stmt 1
        movq      (%r11,%rax,8), %r15                           #35.18
..LN87:
   .loc    1  47  is_stmt 1
        vsubsd    %xmm2, %xmm13, %xmm14                         #47.30
..LN88:
        vmulsd    %xmm14, %xmm0, %xmm13                         #47.40
..LN89:
   .loc    1  49  is_stmt 1
        vaddsd    (%r14,%rax,8), %xmm2, %xmm14                  #49.9
..LN90:
   .loc    1  33  is_stmt 1
        vmovsd    %xmm10, (%r9,%rax,8)                          #33.9
..LN91:
   .loc    1  36  is_stmt 1
        vmovsd    %xmm11, (%rdx,%rax,8)                         #36.9
..LN92:
   .loc    1  42  is_stmt 1
        movq      %r15, (%rbx,%rax,8)                           #42.9
..LN93:
   .loc    1  44  is_stmt 1
        vmovsd    %xmm2, (%r10,%rax,8)                          #44.9
..LN94:
   .loc    1  48  is_stmt 1
        vmovsd    %xmm13, (%rsi,%rax,8)                         #48.9
..LN95:
   .loc    1  49  is_stmt 1
        vmovsd    %xmm14, (%r14,%rax,8)                         #49.9
..LN96:
   .loc    1  31  is_stmt 1
        movslq    104(%rsp), %r15                               #31.5
..LN97:
   .loc    1  47  is_stmt 1
        vaddsd    (%r13,%rax,8), %xmm13, %xmm15                 #47.9
..LN98:
        vmovsd    %xmm15, (%r13,%rax,8)                         #47.9
..LN99:
   .loc    1  50  is_stmt 1
        vmovsd    (%r12,%rax,8), %xmm15                         #50.9
..LN100:
        vsubsd    %xmm2, %xmm15, %xmm3                          #50.9
..LN101:
        vmovsd    %xmm3, (%r12,%rax,8)                          #50.9
..LN102:
   .loc    1  31  is_stmt 1
        incq      %rax                                          #31.5
..LN103:
        cmpq      %r15, %rax                                    #31.5
..LN104:
        jb        ..B1.8        # Prob 82%                      #31.5
..LN105:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 xmm0 xmm1
..B1.10:                        # Preds ..B1.8 ..B1.1 ..B1.6
..LN106:
   .loc    1  67  is_stmt 1

### 
###     }
###     #if IACA 
###     IACA_END
###     #endif
### 
###     #if LIKWID
###     likwid_markerStopRegion("NA_CUR"); 
###     #endif
### 
###     #if OMP
###         }
###     #endif
### 
###     
### 
###     return 0.1;

        vzeroupper                                              #67.12
..LN107:
        vmovsd    .L_2il0floatpacket.14(%rip), %xmm0            #67.12
..___tag_value_NA_CUR.13:                                       #67.12
..LN108:
        popq      %rbx                                          #67.12
..___tag_value_NA_CUR.14:                                       #
..LN109:
        popq      %r15                                          #67.12
..___tag_value_NA_CUR.16:                                       #
..LN110:
        popq      %r14                                          #67.12
..___tag_value_NA_CUR.18:                                       #
..LN111:
        popq      %r13                                          #67.12
..___tag_value_NA_CUR.20:                                       #
..LN112:
        popq      %r12                                          #67.12
..___tag_value_NA_CUR.22:                                       #
..LN113:
        ret                                                     #67.12
..___tag_value_NA_CUR.23:                                       #
..LN114:
                                # LOE
..B1.11:                        # Preds ..B1.2                  # Infreq
..LN115:
   .loc    1  31  is_stmt 1
        xorl      %eax, %eax                                    #31.5
..LN116:
        jmp       ..B1.6        # Prob 100%                     #31.5
        .align    16,0x90
..___tag_value_NA_CUR.29:                                       #
..LN117:
                                # LOE rax rdx rcx rbx rbp rdi r8 r9 r10 r11 r12 r13 r14 r15
..LN118:
# mark_end;
	.type	NA_CUR,@function
	.size	NA_CUR,.-NA_CUR
..LNNA_CUR.119:
.LNNA_CUR:
	.data
# -- End  NA_CUR
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.15:
	.long	0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d,0xd2f1a9fc,0x3f50624d
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,32
	.align 32
.L_2il0floatpacket.16:
	.long	0x00000000,0x408f4000,0x00000000,0x408f4000,0x00000000,0x408f4000,0x00000000,0x408f4000
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,32
	.align 8
.L_2il0floatpacket.14:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,8
	.align 8
.L_2il0floatpacket.17:
	.long	0xd2f1a9fc,0x3f50624d
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,8
	.align 8
.L_2il0floatpacket.18:
	.long	0x00000000,0x408f4000
	.type	.L_2il0floatpacket.18,@object
	.size	.L_2il0floatpacket.18,8
	.data
	.section .note.GNU-stack, ""
# End
