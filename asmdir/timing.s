	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -fno-inline -finline-functions -finline-limit=20 -fsource-asm -S -DNSIZE=0 -DKERNEL=22 -DIACA=1 -DOMP=0 -D";
# mark_description "LIKWID=0 -DEXT=1 -vec-report3 -o asmdir/timing.s";
	.file "timing.c"
	.text
..TXTST0:
L__routine_start_timing_0:
# -- Begin  timing
# mark_begin;
       .align    16,0x90
	.globl timing
timing:
# parameter 1(wcTime): %rdi
# parameter 2(cpuTime): %rsi
..B1.1:                         # Preds ..B1.0

### {

..___tag_value_timing.1:                                        #5.1
..LN0:
  .file   1 "timing.c"
   .loc    1  5  is_stmt 1
        pushq     %r12                                          #5.1
..___tag_value_timing.3:                                        #
..LN1:
        pushq     %r13                                          #5.1
..___tag_value_timing.5:                                        #
..LN2:
        subq      $168, %rsp                                    #5.1
..___tag_value_timing.7:                                        #
..LN3:
        movq      %rsi, %r13                                    #5.1
..LN4:
        movq      %rdi, %r12                                    #5.1
..LN5:
   .loc    1  9  is_stmt 1

###    struct timeval tp;
###    struct rusage ruse;
### 
###    gettimeofday(&tp, NULL);

        lea       144(%rsp), %rdi                               #9.4
..LN6:
        xorl      %esi, %esi                                    #9.4
..___tag_value_timing.8:                                        #9.4
..LN7:
        call      gettimeofday                                  #9.4
..___tag_value_timing.9:                                        #
..LN8:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN9:
   .loc    1  10  is_stmt 1

###    *wcTime=(double) (tp.tv_sec + tp.tv_usec/1000000.0); 

        vcvtsi2sdq 152(%rsp), %xmm0, %xmm0                      #10.34
..LN10:
        vcvtsi2sdq 144(%rsp), %xmm1, %xmm1                      #10.22
..LN11:
        vdivsd    .L_2il0floatpacket.9(%rip), %xmm0, %xmm2      #10.45
..LN12:
   .loc    1  12  is_stmt 1

###   
###    getrusage(RUSAGE_SELF, &ruse);

        xorl      %edi, %edi                                    #12.4
..LN13:
        lea       (%rsp), %rsi                                  #12.4
..LN14:
   .loc    1  10  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #10.45
..LN15:
        vmovsd    %xmm3, (%r12)                                 #10.5
..___tag_value_timing.10:                                       #12.4
..LN16:
   .loc    1  12  is_stmt 1
        call      getrusage                                     #12.4
..___tag_value_timing.11:                                       #
..LN17:
                                # LOE rbx rbp r13 r14 r15
..B1.3:                         # Preds ..B1.2
..LN18:
   .loc    1  13  is_stmt 1

###    *cpuTime=(double)(ruse.ru_utime.tv_sec+ruse.ru_utime.tv_usec / 1000000.0);

        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #13.43
..LN19:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #13.22
..LN20:
        vdivsd    .L_2il0floatpacket.9(%rip), %xmm0, %xmm2      #13.67
..LN21:
        vaddsd    %xmm2, %xmm1, %xmm3                           #13.67
..LN22:
        vmovsd    %xmm3, (%r13)                                 #13.5
..LN23:
   .loc    1  14  is_stmt 1

### }

        addq      $168, %rsp                                    #14.1
..___tag_value_timing.12:                                       #
..LN24:
        popq      %r13                                          #14.1
..___tag_value_timing.14:                                       #
..LN25:
        popq      %r12                                          #14.1
..___tag_value_timing.16:                                       #
..LN26:
        ret                                                     #14.1
        .align    16,0x90
..___tag_value_timing.17:                                       #
..LN27:
                                # LOE
..LN28:
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.29:
.LNtiming:
	.data
# -- End  timing
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.9:
	.long	0x00000000,0x412e8480
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,8
	.data
	.section .note.GNU-stack, ""
# End
