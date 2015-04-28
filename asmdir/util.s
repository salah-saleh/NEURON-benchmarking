	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=1000 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 ";
# mark_description "-DLIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -DEXTMATH=0 -vec-report3 -o asmdir/util.s";
	.file "util.c"
	.text
..TXTST0:
L__routine_start_printBits_0:
# -- Begin  printBits
# mark_begin;
       .align    16,0x90
	.globl printBits
printBits:
# parameter 1(size): %rdi
# parameter 2(ptr): %rsi
..B1.1:                         # Preds ..B1.0

### {

..___tag_value_printBits.1:                                     #106.1
..LN0:
  .file   1 "srcdir/util.c"
   .loc    1  106  is_stmt 1
        subq      $24, %rsp                                     #106.1
..___tag_value_printBits.3:                                     #
..LN1:
   .loc    1  111  is_stmt 1

###     unsigned char *b = (unsigned char*) ptr;
###     unsigned char byte;
###     int i, j;
### 
###     for (i=size-1;i>=0;i--)

        decq      %rdi                                          #111.17
..LN2:
        movslq    %edi, %rdx                                    #111.10
..LN3:
        testq     %rdx, %rdx                                    #111.22
..LN4:
        jl        ..B1.8        # Prob 3%                       #111.22
..LN5:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN6:
        movq      %r12, 16(%rsp)                                #
..LN7:
        movq      %r13, 8(%rsp)                                 #
..___tag_value_printBits.4:                                     #
..LN8:
        movq      %rdx, %r13                                    #
..LN9:
        movq      %r14, (%rsp)                                  #
..___tag_value_printBits.6:                                     #
..LN10:
        movq      %rsi, %r14                                    #
..LN11:
                                # LOE rbx rbp r13 r14 r15
..B1.3:                         # Preds ..B1.6 ..B1.2
..LN12:
   .loc    1  113  is_stmt 1

###     {
###         for (j=7;j>=0;j--)

        movl      $7, %r12d                                     #113.14
..LN13:
                                # LOE rbx rbp r13 r14 r15 r12d
..B1.4:                         # Preds ..B1.5 ..B1.3
..LN14:
   .loc    1  117  is_stmt 1

###         {
###             byte = b[i] & (1<<j);
###             byte >>= j;
###             printf("%u", byte);

        movl      %r12d, %ecx                                   #117.13
..LN15:
        movl      $1, %r8d                                      #117.13
..LN16:
        shll      %cl, %r8d                                     #117.13
..LN17:
        movl      %r12d, %ecx                                   #117.13
..LN18:
        movzbl    (%r13,%r14), %esi                             #117.13
..LN19:
        movl      $.L_2__STRING.0, %edi                         #117.13
..LN20:
        andl      %r8d, %esi                                    #117.13
..LN21:
        xorl      %eax, %eax                                    #117.13
..LN22:
        shrl      %cl, %esi                                     #117.13
..___tag_value_printBits.7:                                     #117.13
..LN23:
        call      printf                                        #117.13
..___tag_value_printBits.8:                                     #
..LN24:
                                # LOE rbx rbp r13 r14 r15 r12d
..B1.5:                         # Preds ..B1.4
..LN25:
   .loc    1  113  is_stmt 1
        decl      %r12d                                         #113.23
..LN26:
        jge       ..B1.4        # Prob 87%                      #113.21
..LN27:
                                # LOE rbx rbp r13 r14 r15 r12d
..B1.6:                         # Preds ..B1.5
..LN28:
   .loc    1  111  is_stmt 1
        decq      %r13                                          #111.24
..LN29:
        jns       ..B1.3        # Prob 82%                      #111.22
..LN30:
                                # LOE rbx rbp r13 r14 r15
..B1.7:                         # Preds ..B1.6
..LN31:
        movq      16(%rsp), %r12                                #
..___tag_value_printBits.9:                                     #
..LN32:
        movq      8(%rsp), %r13                                 #
..___tag_value_printBits.10:                                    #
..LN33:
        movq      (%rsp), %r14                                  #
..___tag_value_printBits.11:                                    #
..LN34:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7 ..B1.1
..LN35:
   .loc    1  120  is_stmt 1

###         }
###     }
###     puts("");

        movl      $.L_2__STRING.1, %edi                         #120.5
..LN36:
        xorl      %eax, %eax                                    #120.5
..LN37:
        addq      $24, %rsp                                     #120.5
..___tag_value_printBits.12:                                    #
..LN38:
        jmp       puts                                          #120.5
        .align    16,0x90
..___tag_value_printBits.13:                                    #
..LN39:
                                # LOE
..LN40:
# mark_end;
	.type	printBits,@function
	.size	printBits,.-printBits
..LNprintBits.41:
.LNprintBits:
	.data
# -- End  printBits
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.word	29989
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,1
	.data
	.section .note.GNU-stack, ""
# End
