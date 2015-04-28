	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 14.0.2.144 Build 2014012";
# mark_description "0";
# mark_description "-I/apps/likwid/3.1.1/include -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inlin";
# mark_description "e -finline-functions -finline-limit=1000 -fsource-asm -S -DNSIZE=260 -DNITER=0 -DKERNEL=22 -DIACA=0 -DOMP=0 ";
# mark_description "-DLIKWID=0 -DEXT=1 -DLIKEXT=0 -DRANDSEED=0 -DPRTF=0 -DEXTMATH=0 -vec-report3 -o asmdir/main.s";
	.file "main.c"
	.text
..TXTST0:
L__routine_start_main_0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
# parameter 1(argc): %edi
# parameter 2(argv): %rsi
..B1.1:                         # Preds ..B1.0

### int main (int argc, char** argv){

..___tag_value_main.1:                                          #6.33
..LN0:
  .file   1 "srcdir/main.c"
   .loc    1  6  is_stmt 1
        pushq     %rbp                                          #6.33
..___tag_value_main.3:                                          #
..LN1:
        movq      %rsp, %rbp                                    #6.33
..___tag_value_main.4:                                          #
..LN2:
        andq      $-128, %rsp                                   #6.33
..LN3:
        pushq     %r12                                          #6.33
..LN4:
        pushq     %r13                                          #6.33
..LN5:
        pushq     %r14                                          #6.33
..LN6:
        pushq     %r15                                          #6.33
..LN7:
        pushq     %rbx                                          #6.33
..LN8:
        subq      $88, %rsp                                     #6.33
..___tag_value_main.6:                                          #
..LN9:
        movq      %rsi, %r13                                    #6.33
..LN10:
        movl      %edi, %ebx                                    #6.33
..LN11:
        movq      $0x0000117fe, %rsi                            #6.33
..LN12:
        movl      $3, %edi                                      #6.33
..LN13:
        call      __intel_new_feature_proc_init                 #6.33
..LN14:
                                # LOE r13 ebx
..B1.170:                       # Preds ..B1.1
..LN15:
        vstmxcsr  (%rsp)                                        #6.33
..LN16:
        movl      $.2.5_2_kmpc_loc_struct_pack.7, %edi          #6.33
..LN17:
        xorl      %esi, %esi                                    #6.33
..LN18:
        orl       $32832, (%rsp)                                #6.33
..LN19:
        xorl      %eax, %eax                                    #6.33
..LN20:
        vldmxcsr  (%rsp)                                        #6.33
..___tag_value_main.11:                                         #6.33
..LN21:
        call      __kmpc_begin                                  #6.33
..___tag_value_main.12:                                         #
..LN22:
                                # LOE r13 ebx
..B1.2:                         # Preds ..B1.170
..LN23:
   .loc    1  32  is_stmt 1

### 
###     // Init likwid
###     #if LIKWID
###         likwid_markerInit(); 
###         #if OMP
###             #pragma omp parallel
###             likwid_markerThreadInit();
###         #endif
###     #endif
### 
###     // Timers
###     double wct_start,wct_end,cput_start,cput_end, dummy;
### 
###     int i,        // Arrays counter
###     j,            // Index for repeating the experiment  
###     z,            // Outer loop blocking 
###     eSize,        // Evaluated size (command line - Preprocessor)
###     eIter,        // Evaluated Repeation (command line - Preprocessor)
###     eKernel,      // Evaluated Kernel (command line - Preprocessor)
###     eNarr,        // Evaluated eNarr (command line - Preprocessor)
###     reminder;     // Used for adding extra elements in the arrays So that we always start from a 32 aligned element  
### 
### 
###     // Evaluate Size and repeatation (command line - Preprocessor)
###     #if EXT == 1 // If command line
###         if (argc < 2 || argc > 4) // Wrong number of arguments

        addl      $-2, %ebx                                     #32.20
..LN24:
   .loc    1  20  is_stmt 1
..LN25:
   .loc    1  32  is_stmt 1
        cmpl      $2, %ebx                                      #32.20
..LN26:
        ja        ..B1.163      # Prob 9%                       #32.20
..LN27:
                                # LOE r13 r14d
..B1.3:                         # Preds ..B1.2
..LN28:
   .loc    1  39  is_stmt 1

###         {
###             printf("Please enter Size - Repeation(set to default by typing '0') - Kernel.\n");
###             return 0;
###         }
###         else // Set arrays size - repeation - kernel to benchmark
###         {
###             eSize = atoi(argv[1]);

        xorl      %esi, %esi                                    #39.21
..LN29:
        movl      $10, %edx                                     #39.21
..LN30:
        movq      8(%r13), %rdi                                 #39.21
..___tag_value_main.13:                                         #39.21
..LN31:
        call      strtol                                        #39.21
..___tag_value_main.14:                                         #
..LN32:
                                # LOE rax r13 r14d
..B1.171:                       # Preds ..B1.3
..LN33:
        movq      %rax, 24(%rsp)                                #39.21
..LN34:
                                # LOE r13 r14d
..B1.4:                         # Preds ..B1.171
..LN35:
   .loc    1  40  is_stmt 1

###             eIter  = atoi(argv[2]);

        xorl      %esi, %esi                                    #40.22
..LN36:
        movl      $10, %edx                                     #40.22
..LN37:
   .loc    1  39  is_stmt 1
        movq      24(%rsp), %r12                                #39.21
..LN38:
   .loc    1  40  is_stmt 1
        movq      16(%r13), %rdi                                #40.22
..LN39:
   .loc    1  39  is_stmt 1
..___tag_value_main.15:                                         #40.22
..LN40:
   .loc    1  40  is_stmt 1
        call      strtol                                        #40.22
..___tag_value_main.16:                                         #
..LN41:
                                # LOE rax r13 r12d r14d
..B1.5:                         # Preds ..B1.4
..LN42:
   .loc    1  41  is_stmt 1

###             eKernel = atoi(argv[3]);

        xorl      %esi, %esi                                    #41.23
..LN43:
        movl      $10, %edx                                     #41.23
..LN44:
        movq      24(%r13), %rdi                                #41.23
..LN45:
   .loc    1  40  is_stmt 1
        movl      %eax, %ebx                                    #40.22
..___tag_value_main.17:                                         #41.23
..LN46:
   .loc    1  41  is_stmt 1
        call      strtol                                        #41.23
..___tag_value_main.18:                                         #
..LN47:
                                # LOE rax ebx r12d r14d
..B1.6:                         # Preds ..B1.5
..LN48:
        movl      %eax, %r15d                                   #41.23
..LN49:
   .loc    1  49  is_stmt 1

###         }
###     #else // Set with preprocessors
###         eSize   = NSIZE;
###         eIter   = NITER;
###         eKernel = KERNEL;
###     #endif
### 
###     if (eIter == 0) // case user asked for default

        testl     %ebx, %ebx                                    #49.18
..LN50:
        jne       ..B1.10       # Prob 50%                      #49.18
..LN51:
                                # LOE ebx r12d r14d r15d
..B1.7:                         # Preds ..B1.6
..LN52:
   .loc    1  51  is_stmt 1

###     {
###         if (eSize < L1) // L1

        cmpl      $10000, %r12d                                 #51.21
..LN53:
        jge       ..B1.9        # Prob 50%                      #51.21
..LN54:
                                # LOE r12d r14d r15d
..B1.8:                         # Preds ..B1.7
..LN55:
   .loc    1  52  is_stmt 1

###             eIter = 1000000;

        movl      $1000000, %ebx                                #52.13
..LN56:
        jmp       ..B1.10       # Prob 100%                     #52.13
..LN57:
                                # LOE ebx r12d r14d r15d
..B1.9:                         # Preds ..B1.7
..LN58:
   .loc    1  56  is_stmt 1

###         else if (eSize < L23)  
###             eIter = 10000;
###         else             // Main Mem
###             eIter = 10;

        movl      $10000, %edx                                  #56.13
..LN59:
        movl      $10, %ebx                                     #56.13
..LN60:
        cmpl      $1000000, %r12d                               #56.13
..LN61:
        cmovl     %edx, %ebx                                    #56.13
..LN62:
                                # LOE ebx r12d r14d r15d
..B1.10:                        # Preds ..B1.8 ..B1.9 ..B1.6
..LN63:
   .loc    1  60  is_stmt 1

###     }
### 
###     // Print info about the kernel in benchmark
###     switch (eKernel) 

        cmpl      $1, %r15d                                     #60.13
..LN64:
        je        ..B1.160      # Prob 10%                      #60.13
..LN65:
                                # LOE ebx r12d r14d r15d
..B1.11:                        # Preds ..B1.10
..LN66:
        cmpl      $11, %r15d                                    #60.13
..LN67:
        je        ..B1.157      # Prob 11%                      #60.13
..LN68:
                                # LOE ebx r12d r14d r15d
..B1.12:                        # Preds ..B1.11
..LN69:
        cmpl      $2, %r15d                                     #60.13
..LN70:
        je        ..B1.154      # Prob 12%                      #60.13
..LN71:
                                # LOE ebx r12d r14d r15d
..B1.13:                        # Preds ..B1.12
..LN72:
        cmpl      $22, %r15d                                    #60.13
..LN73:
        je        ..B1.151      # Prob 14%                      #60.13
..LN74:
                                # LOE ebx r12d r14d r15d
..B1.14:                        # Preds ..B1.13
..LN75:
        cmpl      $222, %r15d                                   #60.13
..LN76:
        je        ..B1.148      # Prob 16%                      #60.13
..LN77:
                                # LOE ebx r12d r14d r15d
..B1.15:                        # Preds ..B1.14
..LN78:
        cmpl      $2222, %r15d                                  #60.13
..LN79:
        je        ..B1.145      # Prob 20%                      #60.13
..LN80:
                                # LOE ebx r12d r14d r15d
..B1.16:                        # Preds ..B1.15
..LN81:
        cmpl      $22222, %r15d                                 #60.13
..LN82:
        je        ..B1.25       # Prob 25%                      #60.13
..LN83:
                                # LOE ebx r12d r14d r15d
..B1.17:                        # Preds ..B1.16
..LN84:
        cmpl      $3, %r15d                                     #60.13
..LN85:
        jne       ..B1.21       # Prob 67%                      #60.13
..LN86:
                                # LOE ebx r12d r14d r15d
..B1.18:                        # Preds ..B1.17
..LN87:
   .loc    1  105  is_stmt 1

###     {
###         case KER_NA_STA:
###             printf("Kernel:                 NA_STA\n");
###             printf("# arrays alloc:         11\n");
###             eNarr = 11;
###         break;
### 
###         case KER_NA_STA_ALT:
###             printf("Kernel:                 NA_STA_ALT\n");
###             printf("# arrays alloc:         11\n");
###             eNarr = 11;
###         break;
### 
###         case KER_NA_CUR:
###             printf("Kernel:                 NA_CUR\n");
###             printf("# arrays alloc:         13\n");
###             eNarr = 13;
###         break; 
### 
###         case KER_NA_CUR_ALT:
###             printf("Kernel:                 NA_CUR_ALT\n");
###             printf("# arrays alloc:         13\n");
###             eNarr = 13;
###         break; 
### 
###         case KER_NA_CUR_SMP:
###             printf("Kernel:                 NA_CUR_SMP\n");
###             printf("# arrays alloc:         13\n");
###             eNarr = 13;
###         break; 
### 
###         case KER_NA_CUR_ALT_SMP:
###             printf("Kernel:                 NA_CUR_ALT_SMP\n");
###             printf("# arrays alloc:         13\n");
###             eNarr = 13;
###         break;
### 
###         case KER_NA_CUR_FNL:
###             printf("Kernel:                 NA_CUR_FNL\n");
###             printf("# arrays alloc:         13\n");
###             eNarr = 13;
###         break; 
### 
###         case KER_SY_CUR:
###             printf("Kernel:                 SY_CUR\n");

        movl      $.L_2__STRING.10, %edi                        #105.13
..LN88:
        xorl      %eax, %eax                                    #105.13
..___tag_value_main.19:                                         #105.13
..LN89:
        call      printf                                        #105.13
..___tag_value_main.20:                                         #
..LN90:
                                # LOE ebx r12d r15d
..B1.19:                        # Preds ..B1.18
..LN91:
   .loc    1  106  is_stmt 1

###             printf("# arrays alloc:         17\n");

        movl      $.L_2__STRING.11, %edi                        #106.13
..LN92:
        xorl      %eax, %eax                                    #106.13
..___tag_value_main.21:                                         #106.13
..LN93:
        call      printf                                        #106.13
..___tag_value_main.22:                                         #
..LN94:
                                # LOE ebx r12d r15d
..B1.20:                        # Preds ..B1.19
..LN95:
   .loc    1  107  is_stmt 1

###             eNarr = 17;

        movl      $17, %r14d                                    #107.13
..LN96:
        jmp       ..B1.28       # Prob 100%                     #107.13
..LN97:
                                # LOE ebx r12d r14d r15d
..B1.21:                        # Preds ..B1.17
..LN98:
   .loc    1  60  is_stmt 1
        cmpl      $33, %r15d                                    #60.13
..LN99:
        jne       ..B1.28       # Prob 50%                      #60.13
..LN100:
                                # LOE ebx r12d r14d r15d
..B1.22:                        # Preds ..B1.21
..LN101:
   .loc    1  111  is_stmt 1

###         break;  
### 
###         case KER_SY_CUR_ALT:
###             printf("Kernel:                 SY_CUR_ALT\n");

        movl      $.L_2__STRING.12, %edi                        #111.13
..LN102:
        xorl      %eax, %eax                                    #111.13
..___tag_value_main.23:                                         #111.13
..LN103:
        call      printf                                        #111.13
..___tag_value_main.24:                                         #
..LN104:
                                # LOE ebx r12d r15d
..B1.23:                        # Preds ..B1.22
..LN105:
   .loc    1  112  is_stmt 1

###             printf("# arrays alloc:         17\n");

        movl      $.L_2__STRING.11, %edi                        #112.13
..LN106:
        xorl      %eax, %eax                                    #112.13
..___tag_value_main.25:                                         #112.13
..LN107:
        call      printf                                        #112.13
..___tag_value_main.26:                                         #
..LN108:
                                # LOE ebx r12d r15d
..B1.24:                        # Preds ..B1.23
..LN109:
   .loc    1  113  is_stmt 1

###             eNarr = 17;

        movl      $17, %r14d                                    #113.13
..LN110:
        jmp       ..B1.28       # Prob 100%                     #113.13
..LN111:
                                # LOE ebx r12d r14d r15d
..B1.25:                        # Preds ..B1.16
..LN112:
   .loc    1  99  is_stmt 1
        movl      $.L_2__STRING.9, %edi                         #99.13
..LN113:
        xorl      %eax, %eax                                    #99.13
..___tag_value_main.27:                                         #99.13
..LN114:
        call      printf                                        #99.13
..___tag_value_main.28:                                         #
..LN115:
                                # LOE ebx r12d r15d
..B1.26:                        # Preds ..B1.154 ..B1.151 ..B1.148 ..B1.145 ..B1.25
                                #      
..LN116:
   .loc    1  100  is_stmt 1
        movl      $.L_2__STRING.5, %edi                         #100.13
..LN117:
        xorl      %eax, %eax                                    #100.13
..___tag_value_main.29:                                         #100.13
..LN118:
        call      printf                                        #100.13
..___tag_value_main.30:                                         #
..LN119:
                                # LOE ebx r12d r15d
..B1.27:                        # Preds ..B1.26
..LN120:
   .loc    1  101  is_stmt 1
        movl      $13, %r14d                                    #101.13
..LN121:
                                # LOE ebx r12d r14d r15d
..B1.28:                        # Preds ..B1.162 ..B1.159 ..B1.27 ..B1.20 ..B1.24
                                #       ..B1.21
..LN122:
   .loc    1  122  is_stmt 1

###         break;
### 
###         default:
###         break; 
###     }
### 
###     // Check if the arrays' size is not a multible of 32. This is important for alligned loads
###     if( (eSize%32) != 0)
###         reminder = (eSize%32);

        movl      %r12d, %r13d                                  #122.27
..LN123:
        andl      $-2147483617, %r13d                           #122.27
..LN124:
        jge       ..B1.168      # Prob 50%                      #122.27
..LN125:
                                # LOE ebx r12d r13d r14d r15d
..B1.169:                       # Preds ..B1.28
..LN126:
        subl      $1, %r13d                                     #122.27
..LN127:
        orl       $-32, %r13d                                   #122.27
..LN128:
        incl      %r13d                                         #122.27
..LN129:
                                # LOE ebx r12d r13d r14d r15d
..B1.168:                       # Preds ..B1.28 ..B1.169
..LN130:
   .loc    1  128  is_stmt 1

###     else
###         reminder = 0;
### 
### 	// Allocate one big chunk of memory
###     double * __restrict__ __attribute__((aligned(32))) oneBigArr;
###     posix_memalign((void**)&oneBigArr,64, (eSize + reminder) * eNarr * sizeof(double) );

        addl      %r12d, %r13d                                  #128.52
..LN131:
        movl      %r14d, %edx                                   #128.64
..LN132:
        movslq    %r13d, %r13                                   #
..LN133:
        lea       64(%rsp), %rdi                                #128.5
..LN134:
        imull     %r13d, %edx                                   #128.64
..LN135:
        movl      $64, %esi                                     #128.5
..LN136:
        movslq    %edx, %rdx                                    #128.64
..LN137:
        shlq      $3, %rdx                                      #128.72
..LN138:
        movq      %r13, 40(%rsp)                                #
..LN139:
        movq      %rdx, 32(%rsp)                                #128.72
..___tag_value_main.31:                                         #128.5
..LN140:
        call      posix_memalign                                #128.5
..___tag_value_main.32:                                         #
..LN141:
                                # LOE ebx r12d r13d r14d r15d
..B1.29:                        # Preds ..B1.168
..LN142:
   .loc    1  131  is_stmt 1

###     
###     // Allocate array of arrays equivelent to eNarr
###     double ** __restrict__ __attribute__((aligned(32))) arrOfArrs = (double **)malloc( eNarr * sizeof(double *) );

        movslq    %r14d, %rdi                                   #131.80
..LN143:
        shlq      $3, %rdi                                      #131.80
..___tag_value_main.33:                                         #131.80
..LN144:
        call      malloc                                        #131.80
..___tag_value_main.34:                                         #
..LN145:
                                # LOE rax ebx r12d r13d r14d r15d
..B1.174:                       # Preds ..B1.29
..LN146:
        movq      %rax, 16(%rsp)                                #131.80
..LN147:
                                # LOE ebx r12d r13d r14d r15d
..B1.30:                        # Preds ..B1.174
..LN148:
   .loc    1  138  is_stmt 1

###     
### 	// Generate random numbers between 0-100
###     #if RANDSEED == 1
###     srand(time(NULL));
###     printf("Random seed\n");
###     #else
###     srand(1);

        movl      $1, %edi                                      #138.5
..___tag_value_main.35:                                         #138.5
..LN149:
        call      srand                                         #138.5
..___tag_value_main.36:                                         #
..LN150:
                                # LOE ebx r12d r13d r14d r15d
..B1.31:                        # Preds ..B1.30
..LN151:
   .loc    1  139  is_stmt 1

###     printf("Constant seed\n");

        movl      $.L_2__STRING.13, %edi                        #139.5
..LN152:
        xorl      %eax, %eax                                    #139.5
..___tag_value_main.37:                                         #139.5
..LN153:
        call      printf                                        #139.5
..___tag_value_main.38:                                         #
..LN154:
                                # LOE ebx r12d r13d r14d r15d
..B1.32:                        # Preds ..B1.31
..LN155:
   .loc    1  141  is_stmt 1

###     #endif
###     for (i=0; i<eSize*eNarr;++i){

        movl      %r12d, %edx                                   #141.23
..LN156:
        xorl      %ecx, %ecx                                    #141.10
..LN157:
        imull     %r14d, %edx                                   #141.23
..LN158:
        testl     %edx, %edx                                    #141.23
..LN159:
        jle       ..B1.37       # Prob 16%                      #141.23
..LN160:
                                # LOE rcx ebx r12d r13d r14d r15d
..B1.33:                        # Preds ..B1.32
..LN161:
        movslq    %r14d, %r14                                   #141.5
..LN162:
        movslq    24(%rsp), %rdx                                #141.5
..LN163:
        imulq     %r14, %rdx                                    #141.23
..LN164:
        movl      %ebx, (%rsp)                                  #141.23
..LN165:
        movq      %rcx, %rbx                                    #141.23
..LN166:
        movl      %r12d, 8(%rsp)                                #141.23
..LN167:
        movq      %rdx, %r12                                    #141.23
..LN168:
                                # LOE rbx r12 r13d r14d r15d
..B1.34:                        # Preds ..B1.35 ..B1.33

###         oneBigArr[i] = (double)(rand())/RAND_MAX;

..___tag_value_main.39:                                         #142.33
..LN169:
   .loc    1  142  is_stmt 1
        call      rand                                          #142.33
..___tag_value_main.40:                                         #
..LN170:
                                # LOE rbx r12 eax r13d r14d r15d
..B1.35:                        # Preds ..B1.34
..LN171:
        vxorpd    %xmm0, %xmm0, %xmm0                           #142.33
..LN172:
        vcvtsi2sd %eax, %xmm0, %xmm0                            #142.33
..LN173:
        vdivsd    .L_2il0floatpacket.35(%rip), %xmm0, %xmm1     #142.41
..LN174:
        movq      64(%rsp), %rsi                                #142.9
..LN175:
        vmovsd    %xmm1, (%rsi,%rbx,8)                          #142.9
..LN176:
   .loc    1  141  is_stmt 1
        incq      %rbx                                          #141.31
..LN177:
        cmpq      %r12, %rbx                                    #141.23
..LN178:
        jl        ..B1.34       # Prob 82%                      #141.23
..LN179:
                                # LOE rbx r12 r13d r14d r15d
..B1.36:                        # Preds ..B1.35
..LN180:
        movl      (%rsp), %ebx                                  #
..LN181:
        movl      8(%rsp), %r12d                                #
..LN182:
                                # LOE ebx r12d r13d r14d r15d
..B1.37:                        # Preds ..B1.32 ..B1.36
..LN183:
   .loc    1  146  is_stmt 1

###     }
###     
###     // Reassign the one big array to smaller alligned arrays
###     for (i=0; i<eNarr;++i){

        testl     %r14d, %r14d                                  #146.17
..LN184:
        jle       ..B1.61       # Prob 0%                       #146.17
..LN185:
                                # LOE ebx r12d r13d r14d r15d
..B1.38:                        # Preds ..B1.37
..LN186:
   .loc    1  147  is_stmt 1

###         arrOfArrs[i] = &(oneBigArr[i * (eSize + reminder)]);

        movq      64(%rsp), %rcx                                #147.26
..LN187:
   .loc    1  146  is_stmt 1
        xorb      %dl, %dl                                      #146.5
..LN188:
        cmpl      $8, %r14d                                     #146.5
..LN189:
        jl        ..B1.142      # Prob 10%                      #146.5
..LN190:
                                # LOE rcx ebx r12d r13d r14d r15d dl
..B1.39:                        # Preds ..B1.38
..LN191:
        movq      16(%rsp), %rax                                #146.5
..LN192:
        andq      $31, %rax                                     #146.5
..LN193:
        testl     %eax, %eax                                    #146.5
..LN194:
        je        ..B1.42       # Prob 50%                      #146.5
..LN195:
                                # LOE rcx eax ebx r12d r13d r14d r15d dl
..B1.40:                        # Preds ..B1.39
..LN196:
        testb     $7, %al                                       #146.5
..LN197:
        jne       ..B1.142      # Prob 10%                      #146.5
..LN198:
                                # LOE rcx eax ebx r12d r13d r14d r15d dl
..B1.41:                        # Preds ..B1.40
..LN199:
        negl      %eax                                          #146.5
..LN200:
        addl      $32, %eax                                     #146.5
..LN201:
        shrl      $3, %eax                                      #146.5
..LN202:
                                # LOE rcx eax ebx r12d r13d r14d r15d dl
..B1.42:                        # Preds ..B1.41 ..B1.39
..LN203:
        lea       8(%rax), %edi                                 #146.5
..LN204:
        cmpl      %edi, %r14d                                   #146.5
..LN205:
        jl        ..B1.142      # Prob 10%                      #146.5
..LN206:
                                # LOE rcx eax ebx r12d r13d r14d r15d dl
..B1.43:                        # Preds ..B1.42
..LN207:
        movl      %r14d, %edi                                   #146.5
..LN208:
        xorl      %r10d, %r10d                                  #146.5
..LN209:
        subl      %eax, %edi                                    #146.5
..LN210:
        xorl      %r9d, %r9d                                    #
..LN211:
        andl      $7, %edi                                      #146.5
..LN212:
        movq      %rcx, %r8                                     #
..LN213:
        negl      %edi                                          #146.5
..LN214:
        addl      %r14d, %edi                                   #146.5
..LN215:
        testl     %eax, %eax                                    #146.5
..LN216:
        jbe       ..B1.47       # Prob 10%                      #146.5
..LN217:
                                # LOE rcx r8 r9 eax ebx edi r10d r12d r13d r14d r15d dl
..B1.44:                        # Preds ..B1.43
..LN218:
        movq      16(%rsp), %r11                                #
..LN219:
        movq      40(%rsp), %rsi                                #
..LN220:
                                # LOE rcx rsi r8 r9 r11 eax ebx edi r10d r12d r13d r14d r15d dl
..B1.45:                        # Preds ..B1.45 ..B1.44
..LN221:
        incl      %r10d                                         #146.5
..LN222:
   .loc    1  147  is_stmt 1
        movq      %r8, (%r11,%r9,8)                             #147.9
..LN223:
   .loc    1  146  is_stmt 1
        incq      %r9                                           #146.5
..LN224:
        lea       (%r8,%rsi,8), %r8                             #146.5
..LN225:
        cmpl      %eax, %r10d                                   #146.5
..LN226:
        jb        ..B1.45       # Prob 82%                      #146.5
..LN227:
                                # LOE rcx rsi r8 r9 r11 eax ebx edi r10d r12d r13d r14d r15d dl
..B1.47:                        # Preds ..B1.45 ..B1.43
..LN228:
   .loc    1  147  is_stmt 1
        movl      %eax, %r11d                                   #147.49
..LN229:
        lea       (,%r13,8), %r8d                               #147.49
..LN230:
        imull     %r13d, %r11d                                  #147.49
..LN231:
   .loc    1  146  is_stmt 1
        vmovd     %rcx, %xmm13                                  #146.5
..LN232:
   .loc    1  147  is_stmt 1
        vmovd     %r8d, %xmm1                                   #147.49
..LN233:
        vpshufd   $0, %xmm1, %xmm1                              #147.49
..LN234:
   .loc    1  146  is_stmt 1
        movl      %eax, %eax                                    #146.5
..LN235:
   .loc    1  147  is_stmt 1
        lea       (%r13,%r11), %r9d                             #147.49
..LN236:
        lea       (%r13,%r9), %r10d                             #147.49
..LN237:
        lea       (%r11,%r13,4), %r8d                           #147.49
..LN238:
        vmovd     %r11d, %xmm3                                  #147.49
..LN239:
        vmovd     %r9d, %xmm2                                   #147.49
..LN240:
        lea       (%r13,%r8), %r9d                              #147.49
..LN241:
        vmovd     %r10d, %xmm0                                  #147.49
..LN242:
        addl      %r13d, %r10d                                  #147.49
..LN243:
        vmovd     %r8d, %xmm7                                   #147.49
..LN244:
        vpunpcklqdq %xmm2, %xmm3, %xmm5                         #147.49
..LN245:
        vmovd     %r9d, %xmm8                                   #147.49
..LN246:
        vmovd     %r10d, %xmm4                                  #147.49
..LN247:
        lea       (%r13,%r9), %r10d                             #147.49
..LN248:
        vpunpcklqdq %xmm4, %xmm0, %xmm6                         #147.49
..LN249:
        vpunpcklqdq %xmm8, %xmm7, %xmm11                        #147.49
..LN250:
        vshufps   $136, %xmm6, %xmm5, %xmm3                     #147.49
..LN251:
        vmovd     %r10d, %xmm9                                  #147.49
..LN252:
        addl      %r13d, %r10d                                  #147.49
..LN253:
   .loc    1  146  is_stmt 1
        vpunpcklqdq %xmm13, %xmm13, %xmm0                       #146.5
..LN254:
        movslq    %edi, %r8                                     #146.5
..LN255:
        movq      16(%rsp), %r9                                 #146.5
..LN256:
   .loc    1  147  is_stmt 1
        vmovd     %r10d, %xmm10                                 #147.49
..LN257:
        vpunpcklqdq %xmm10, %xmm9, %xmm12                       #147.49
..LN258:
        vshufps   $136, %xmm12, %xmm11, %xmm2                   #147.49
        .align    16,0x90
..LN259:
                                # LOE rax rcx r8 r9 ebx edi r12d r13d r14d r15d dl xmm0 xmm1 xmm2 xmm3
..B1.48:                        # Preds ..B1.48 ..B1.47
..LN260:
        vpsrldq   $8, %xmm3, %xmm6                              #147.26
..LN261:
        vpsrldq   $8, %xmm2, %xmm10                             #147.26
..LN262:
        vpmovsxdq %xmm3, %xmm4                                  #147.26
..LN263:
        vpaddd    %xmm1, %xmm3, %xmm3                           #147.49
..LN264:
        vpmovsxdq %xmm6, %xmm6                                  #147.26
..LN265:
        vpsllq    $3, %xmm4, %xmm5                              #147.26
..LN266:
        vpmovsxdq %xmm2, %xmm8                                  #147.26
..LN267:
        vpsllq    $3, %xmm6, %xmm7                              #147.26
..LN268:
        vpmovsxdq %xmm10, %xmm10                                #147.26
..LN269:
        vpsllq    $3, %xmm8, %xmm9                              #147.26
..LN270:
        vpsllq    $3, %xmm10, %xmm11                            #147.26
..LN271:
        vpaddd    %xmm1, %xmm2, %xmm2                           #147.49
..LN272:
        vpaddq    %xmm5, %xmm0, %xmm12                          #147.26
..LN273:
        vpaddq    %xmm7, %xmm0, %xmm13                          #147.26
..LN274:
        vpaddq    %xmm9, %xmm0, %xmm14                          #147.26
..LN275:
        vpaddq    %xmm11, %xmm0, %xmm15                         #147.26
..LN276:
        vmovdqu   %xmm12, (%r9,%rax,8)                          #147.9
..LN277:
        vmovdqu   %xmm13, 16(%r9,%rax,8)                        #147.9
..LN278:
        vmovdqu   %xmm14, 32(%r9,%rax,8)                        #147.9
..LN279:
        vmovdqu   %xmm15, 48(%r9,%rax,8)                        #147.9
..LN280:
   .loc    1  146  is_stmt 1
        addq      $8, %rax                                      #146.5
..LN281:
        cmpq      %r8, %rax                                     #146.5
..LN282:
        jb        ..B1.48       # Prob 82%                      #146.5
..LN283:
                                # LOE rax rcx r8 r9 ebx edi r12d r13d r14d r15d dl xmm0 xmm1 xmm2 xmm3
..B1.50:                        # Preds ..B1.48 ..B1.142
..LN284:
        lea       1(%rdi), %r8d                                 #146.5
..LN285:
        cmpl      %r8d, %r14d                                   #146.5
..LN286:
        jb        ..B1.61       # Prob 50%                      #146.5
..LN287:
                                # LOE rcx ebx edi r12d r13d r14d r15d dl
..B1.51:                        # Preds ..B1.50
..LN288:
        subl      %edi, %r14d                                   #146.5
..LN289:
        cmpb      $1, %dl                                       #146.5
..LN290:
        jne       ..B1.53       # Prob 50%                      #146.5
..LN291:
                                # LOE rcx ebx edi r12d r13d r14d r15d
..B1.52:                        # Preds ..B1.53 ..B1.51
..LN292:
        xorl      %edx, %edx                                    #146.5
..LN293:
        jmp       ..B1.57       # Prob 100%                     #146.5
..LN294:
                                # LOE rdx rcx ebx edi r12d r13d r14d r15d
..B1.53:                        # Preds ..B1.51
..LN295:
        cmpl      $2, %r14d                                     #146.5
..LN296:
        jl        ..B1.52       # Prob 10%                      #146.5
..LN297:
                                # LOE rcx ebx edi r12d r13d r14d r15d
..B1.54:                        # Preds ..B1.53
..LN298:
   .loc    1  147  is_stmt 1
        movl      %edi, %r9d                                    #147.9
..LN299:
        lea       (%r13,%r13), %r8d                             #147.49
..LN300:
        imull     %r13d, %r9d                                   #147.9
..LN301:
   .loc    1  146  is_stmt 1
        movl      %r14d, %edx                                   #146.5
..LN302:
   .loc    1  147  is_stmt 1
..LN303:
   .loc    1  146  is_stmt 1
        vmovd     %rcx, %xmm5                                   #146.5
..LN304:
   .loc    1  147  is_stmt 1
        vpxor     %xmm4, %xmm4, %xmm4                           #147.49
..LN305:
        vmovd     %r8d, %xmm2                                   #147.49
..LN306:
        vpshufd   $0, %xmm2, %xmm2                              #147.49
..LN307:
        movslq    %edi, %rdi                                    #147.9
..LN308:
   .loc    1  146  is_stmt 1
        andl      $-2, %edx                                     #146.5
..LN309:
   .loc    1  147  is_stmt 1
        movq      16(%rsp), %r10                                #147.9
..LN310:
   .loc    1  146  is_stmt 1
        xorl      %r8d, %r8d                                    #146.5
..LN311:
        movslq    %edx, %rdx                                    #146.5
..LN312:
   .loc    1  147  is_stmt 1
        vmovd     %r9d, %xmm1                                   #147.49
..LN313:
        addl      %r13d, %r9d                                   #147.49
..LN314:
        lea       (%r10,%rdi,8), %rax                           #147.9
..LN315:
        vmovd     %r9d, %xmm0                                   #147.49
..LN316:
        vpunpckldq %xmm0, %xmm1, %xmm3                          #147.49
..LN317:
        vpunpcklqdq %xmm4, %xmm3, %xmm1                         #147.49
..LN318:
   .loc    1  146  is_stmt 1
        vpunpcklqdq %xmm5, %xmm5, %xmm0                         #146.5
..LN319:
                                # LOE rax rdx rcx r8 ebx edi r12d r13d r14d r15d xmm0 xmm1 xmm2
..B1.55:                        # Preds ..B1.55 ..B1.54
..LN320:
   .loc    1  147  is_stmt 1
        vpmovsxdq %xmm1, %xmm3                                  #147.26
..LN321:
        vpaddd    %xmm2, %xmm1, %xmm1                           #147.49
..LN322:
        vpsllq    $3, %xmm3, %xmm4                              #147.26
..LN323:
        vpaddq    %xmm4, %xmm0, %xmm5                           #147.26
..LN324:
        vmovdqu   %xmm5, (%rax,%r8,8)                           #147.9
..LN325:
   .loc    1  146  is_stmt 1
        addq      $2, %r8                                       #146.5
..LN326:
        cmpq      %rdx, %r8                                     #146.5
..LN327:
        jb        ..B1.55       # Prob 82%                      #146.5
..LN328:
                                # LOE rax rdx rcx r8 ebx edi r12d r13d r14d r15d xmm0 xmm1 xmm2
..B1.57:                        # Preds ..B1.55 ..B1.52
..LN329:
        movl      %edx, %eax                                    #146.5
..LN330:
        movl      %r13d, %r8d                                   #
..LN331:
        imull     %eax, %r8d                                    #
..LN332:
        cmpl      %r14d, %eax                                   #146.5
..LN333:
        jae       ..B1.61       # Prob 10%                      #146.5
..LN334:
                                # LOE rdx rcx eax ebx edi r8d r12d r13d r14d r15d
..B1.58:                        # Preds ..B1.57
..LN335:
   .loc    1  147  is_stmt 1
        imull     %edi, %r13d                                   #147.49
..LN336:
        addl      %r13d, %r8d                                   #
..LN337:
        movslq    %r8d, %r8                                     #
..LN338:
        movslq    %edi, %rdi                                    #147.9
..LN339:
        lea       (%rcx,%r8,8), %r8                             #
..LN340:
        movq      16(%rsp), %rcx                                #147.9
..LN341:
        lea       (%rcx,%rdi,8), %rcx                           #147.9
..LN342:
        movq      40(%rsp), %rdi                                #147.9
..LN343:
                                # LOE rdx rcx rdi r8 eax ebx r12d r14d r15d
..B1.59:                        # Preds ..B1.59 ..B1.58
..LN344:
   .loc    1  146  is_stmt 1
        incl      %eax                                          #146.5
..LN345:
   .loc    1  147  is_stmt 1
        movq      %r8, (%rcx,%rdx,8)                            #147.9
..LN346:
   .loc    1  146  is_stmt 1
        incq      %rdx                                          #146.5
..LN347:
        lea       (%r8,%rdi,8), %r8                             #146.5
..LN348:
        cmpl      %r14d, %eax                                   #146.5
..LN349:
        jb        ..B1.59       # Prob 82%                      #146.5
..LN350:
                                # LOE rdx rcx rdi r8 eax ebx r12d r14d r15d
..B1.61:                        # Preds ..B1.59 ..B1.37 ..B1.57 ..B1.50
..LN351:
   .loc    1  152  is_stmt 1

###     }
### 
###     // Print info about the App
###     // Print total mem allocated
###     printf("Size of Mem Alloc:      %u Bytes\n", (eSize + reminder) * eNarr * sizeof(double));

        movl      $.L_2__STRING.14, %edi                        #152.5
..LN352:
        xorl      %eax, %eax                                    #152.5
..LN353:
        movq      32(%rsp), %rsi                                #152.5
..___tag_value_main.41:                                         #152.5
..LN354:
        call      printf                                        #152.5
..___tag_value_main.42:                                         #
..LN355:
                                # LOE ebx r12d r15d
..B1.62:                        # Preds ..B1.61
..LN356:
   .loc    1  154  is_stmt 1

###     // Experiment repeated
###     printf("Experiment repeated:    %u times\n", eIter);

        movl      $.L_2__STRING.15, %edi                        #154.5
..LN357:
        movl      %ebx, %esi                                    #154.5
..LN358:
        xorl      %eax, %eax                                    #154.5
..___tag_value_main.43:                                         #154.5
..LN359:
        call      printf                                        #154.5
..___tag_value_main.44:                                         #
..LN360:
                                # LOE ebx r12d r15d
..B1.63:                        # Preds ..B1.62
..LN361:
   .loc    1  163  is_stmt 1

###     #if LIKWID
###     printf("LIKWID API is enabled\n");
###         #if LIKEXT
###         printf("LIKWID is measing the external loop\n");
###         #else
###         printf("LIKWID is measing the internal loop\n");
###         #endif
###     #else
###     printf("LIKWID API is disabled\n");

        movl      $.L_2__STRING.16, %edi                        #163.5
..LN362:
        xorl      %eax, %eax                                    #163.5
..___tag_value_main.45:                                         #163.5
..LN363:
        call      printf                                        #163.5
..___tag_value_main.46:                                         #
..LN364:
                                # LOE ebx r12d r15d
..B1.64:                        # Preds ..B1.63
..LN365:
   .loc    1  173  is_stmt 1

###     #endif
###     #if OMP
###     printf("OMP API is enabled\n");
###     #pragma omp parallel
###     {
###     #pragma omp single
###     printf("Number of threads:      %u\n", omp_get_num_threads());
###     }
###     #else
###     printf("OMP API is disabled\n");

        movl      $.L_2__STRING.17, %edi                        #173.5
..LN366:
        xorl      %eax, %eax                                    #173.5
..___tag_value_main.47:                                         #173.5
..LN367:
        call      printf                                        #173.5
..___tag_value_main.48:                                         #
..LN368:
                                # LOE ebx r12d r15d
..B1.65:                        # Preds ..B1.64
..LN369:
   .loc    1  178  is_stmt 1

###     #endif
###     #if IACA
###     printf("IACA API is enabled\n");
###     #else
###     printf("IACA API is disabled\n");

        movl      $.L_2__STRING.18, %edi                        #178.5
..LN370:
        xorl      %eax, %eax                                    #178.5
..___tag_value_main.49:                                         #178.5
..LN371:
        call      printf                                        #178.5
..___tag_value_main.50:                                         #
..LN372:
                                # LOE ebx r12d r15d
..B1.66:                        # Preds ..B1.65
..LN373:
   .loc    1  183  is_stmt 1

###     #endif
###     #if EXTMATH
###     printf("Alternative DIV and EXP are enabled\n");
###     #else
###     printf("Alternative DIV and EXP are are disabled\n");

        movl      $.L_2__STRING.19, %edi                        #183.5
..LN374:
        xorl      %eax, %eax                                    #183.5
..___tag_value_main.51:                                         #183.5
..LN375:
        call      printf                                        #183.5
..___tag_value_main.52:                                         #
..LN376:
                                # LOE ebx r12d r15d
..B1.67:                        # Preds ..B1.66
..LN377:
   .loc    1  186  is_stmt 1

###     #endif
###     #if EXT
###     printf("Program recieve command line parameters\n");

        movl      $.L_2__STRING.20, %edi                        #186.5
..LN378:
        xorl      %eax, %eax                                    #186.5
..___tag_value_main.53:                                         #186.5
..LN379:
        call      printf                                        #186.5
..___tag_value_main.54:                                         #
..LN380:
                                # LOE ebx r12d r15d
..B1.68:                        # Preds ..B1.67
..LN381:
   .loc    1  194  is_stmt 1

###     #else
###     printf("Program is configured in the Makefile\n");
###     #endif
### 
### // Kernels Benchmarking Starts Here  //
### 
###     // Start timers
###     timing(&wct_start, &cput_start);

        lea       (%rsp), %rdi                                  #194.5
..LN382:
        lea       8(%rsp), %rsi                                 #194.5
..___tag_value_main.55:                                         #194.5
..LN383:
        call      timing                                        #194.5
..___tag_value_main.56:                                         #
..LN384:
                                # LOE ebx r12d r15d
..B1.69:                        # Preds ..B1.68
..LN385:
   .loc    1  196  is_stmt 1

### 
###     switch(eKernel)

        cmpl      $1, %r15d                                     #196.12
..LN386:
        je        ..B1.134      # Prob 11%                      #196.12
..LN387:
                                # LOE ebx r12d r15d
..B1.70:                        # Preds ..B1.69
..LN388:
        cmpl      $11, %r15d                                    #196.12
..LN389:
        je        ..B1.127      # Prob 12%                      #196.12
..LN390:
                                # LOE ebx r12d r15d
..B1.71:                        # Preds ..B1.70
..LN391:
        cmpl      $2, %r15d                                     #196.12
..LN392:
        je        ..B1.120      # Prob 14%                      #196.12
..LN393:
                                # LOE ebx r12d r15d
..B1.72:                        # Preds ..B1.71
..LN394:
        cmpl      $22, %r15d                                    #196.12
..LN395:
        je        ..B1.113      # Prob 16%                      #196.12
..LN396:
                                # LOE ebx r12d r15d
..B1.73:                        # Preds ..B1.72
..LN397:
        cmpl      $222, %r15d                                   #196.12
..LN398:
        je        ..B1.106      # Prob 20%                      #196.12
..LN399:
                                # LOE ebx r12d r15d
..B1.74:                        # Preds ..B1.73
..LN400:
        cmpl      $2222, %r15d                                  #196.12
..LN401:
        je        ..B1.89       # Prob 25%                      #196.12
..LN402:
                                # LOE ebx r12d r15d
..B1.75:                        # Preds ..B1.74
..LN403:
        cmpl      $22222, %r15d                                 #196.12
..LN404:
        jne       ..B1.82       # Prob 67%                      #196.12
..LN405:
                                # LOE ebx r12d r15d
..B1.76:                        # Preds ..B1.75
..LN406:
   .loc    1  301  is_stmt 1

###     {
###         case KER_NA_STA:
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###                 dummy = NA_STA(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###         break;
### 
###         case KER_NA_STA_ALT:
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###                 dummy = NA_STA_ALT(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###         break;
### 
### 		case KER_NA_CUR:
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###             	dummy = NA_CUR(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###         break;  
### 
###         case KER_NA_CUR_ALT:
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStartRegion("NA_CUR_ALT_OUT");
###             #endif
###             #endif
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###                 dummy = NA_CUR_ALT(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStopRegion("NA_CUR_ALT_OUT"); 
###             #endif
###             #endif   
###         break;
### 
###         case KER_NA_CUR_SMP:
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStartRegion("NA_CUR_SMP_OUT");
###             #endif
###             #endif
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###                 dummy = NA_CUR_SMP(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStopRegion("NA_CUR_SMP_OUT"); 
###             #endif
###             #endif   
###         break;
### 
###         case KER_NA_CUR_ALT_SMP:
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStartRegion("NA_CUR_ALT_SMP_OUT");
###             #endif
###             #endif
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){
###                 dummy = NA_CUR_ALT_SMP(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;
###             }
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStopRegion("NA_CUR_ALT_SMP_OUT"); 
###             #endif
###             #endif   
###         break;
### 
###         case KER_NA_CUR_FNL:
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStartRegion("NA_CUR_FNL");
###             #endif
###             #endif
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){

        xorl      %r14d, %r14d                                  #301.17
..LN407:
        testl     %ebx, %ebx                                    #301.24
..LN408:
        jle       ..B1.95       # Prob 10%                      #301.24
..LN409:
                                # LOE ebx r12d r14d
..B1.77:                        # Preds ..B1.76

###                 dummy = NA_CUR_FNL(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;

..LN410:
   .loc    1  306  is_stmt 1
        movl      24(%rsp), %r13d                               #306.30
..LN411:
        movq      16(%rsp), %r15                                #306.30
..LN412:
        vxorpd    %xmm0, %xmm0, %xmm0                           #306.30
..LN413:
                                # LOE r13 r15 ebx r12d r14d
..B1.78:                        # Preds ..B1.80 ..B1.77
..LN414:
   .loc    1  302  is_stmt 1
        pushq     %r13                                          #302.25
..LN415:
        pushq     96(%r15)                                      #302.25
..LN416:
        pushq     88(%r15)                                      #302.25
..LN417:
        pushq     80(%r15)                                      #302.25
..LN418:
        pushq     72(%r15)                                      #302.25
..LN419:
        pushq     64(%r15)                                      #302.25
..LN420:
        pushq     56(%r15)                                      #302.25
..LN421:
        pushq     48(%r15)                                      #302.25
..LN422:
        movq      (%r15), %rdi                                  #302.25
..LN423:
        movq      8(%r15), %rsi                                 #302.25
..LN424:
        movq      16(%r15), %rdx                                #302.25
..LN425:
        movq      24(%r15), %rcx                                #302.25
..LN426:
        movq      32(%r15), %r8                                 #302.25
..LN427:
        movq      40(%r15), %r9                                 #302.25
..___tag_value_main.57:                                         #302.25
..LN428:
        call      NA_CUR_FNL                                    #302.25
..___tag_value_main.58:                                         #
..LN429:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.176:                       # Preds ..B1.78
..LN430:
        vmovapd   %xmm0, %xmm1                                  #302.25
..LN431:
        addq      $64, %rsp                                     #302.25
..LN432:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.79:                        # Preds ..B1.176
..LN433:
   .loc    1  306  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #306.30
..LN434:
        vucomisd  %xmm0, %xmm1                                  #306.30
..LN435:
        jp        ..B1.80       # Prob 0%                       #306.30
..LN436:
        je        ..B1.95       # Prob 20%                      #306.30
..LN437:
                                # LOE r13 r15 ebx r12d r14d
..B1.80:                        # Preds ..B1.79
..LN438:
   .loc    1  301  is_stmt 1
        incl      %r14d                                         #301.33
..LN439:
        cmpl      %ebx, %r14d                                   #301.24
..LN440:
        jl        ..B1.78       # Prob 82%                      #301.24
..LN441:
        jmp       ..B1.95       # Prob 100%                     #301.24
..LN442:
                                # LOE r13 r15 ebx r12d r14d
..B1.82:                        # Preds ..B1.75
..LN443:
   .loc    1  196  is_stmt 1
        cmpl      $3, %r15d                                     #196.12
..LN444:
        jne       ..B1.95       # Prob 50%                      #196.12
..LN445:
                                # LOE ebx r12d
..B1.83:                        # Preds ..B1.82
..LN446:
   .loc    1  318  is_stmt 1

###                     
###             }
###             #if LIKWID
###             #if LIKEXT
###             likwid_markerStopRegion("NA_CUR_FNL"); 
###             #endif
###             #endif   
###         break;
### 
###         case KER_SY_CUR:
###             // Repeat the execution of kernel
###             for(j=0; j<eIter; ++j){

        xorl      %r14d, %r14d                                  #318.17
..LN447:
        testl     %ebx, %ebx                                    #318.24
..LN448:
        jle       ..B1.95       # Prob 10%                      #318.24
..LN449:
                                # LOE ebx r12d r14d
..B1.84:                        # Preds ..B1.83

###                 dummy = SY_CUR(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
###                     arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
###                     arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], arrOfArrs[13], 
###                     arrOfArrs[14], arrOfArrs[15], arrOfArrs[16], eSize);
###                 // Dummy check to prevent compiler from removing the repeatation loop
###                 if (dummy == 0.0) break;

..LN450:
   .loc    1  324  is_stmt 1
        movl      24(%rsp), %r13d                               #324.30
..LN451:
        movq      16(%rsp), %r15                                #324.30
..LN452:
        vxorpd    %xmm0, %xmm0, %xmm0                           #324.30
..LN453:
                                # LOE r13 r15 ebx r12d r14d
..B1.85:                        # Preds ..B1.87 ..B1.84
..LN454:
   .loc    1  319  is_stmt 1
        pushq     %r13                                          #319.25
..LN455:
        pushq     128(%r15)                                     #319.25
..LN456:
        pushq     120(%r15)                                     #319.25
..LN457:
        pushq     112(%r15)                                     #319.25
..LN458:
        pushq     104(%r15)                                     #319.25
..LN459:
        pushq     96(%r15)                                      #319.25
..LN460:
        pushq     88(%r15)                                      #319.25
..LN461:
        pushq     80(%r15)                                      #319.25
..LN462:
        pushq     72(%r15)                                      #319.25
..LN463:
        pushq     64(%r15)                                      #319.25
..LN464:
        pushq     56(%r15)                                      #319.25
..LN465:
        pushq     48(%r15)                                      #319.25
..LN466:
        movq      (%r15), %rdi                                  #319.25
..LN467:
        movq      8(%r15), %rsi                                 #319.25
..LN468:
        movq      16(%r15), %rdx                                #319.25
..LN469:
        movq      24(%r15), %rcx                                #319.25
..LN470:
        movq      32(%r15), %r8                                 #319.25
..LN471:
        movq      40(%r15), %r9                                 #319.25
..___tag_value_main.59:                                         #319.25
..LN472:
        call      SY_CUR                                        #319.25
..___tag_value_main.60:                                         #
..LN473:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.177:                       # Preds ..B1.85
..LN474:
        vmovapd   %xmm0, %xmm1                                  #319.25
..LN475:
        addq      $96, %rsp                                     #319.25
..LN476:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.86:                        # Preds ..B1.177
..LN477:
   .loc    1  324  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #324.30
..LN478:
        vucomisd  %xmm0, %xmm1                                  #324.30
..LN479:
        jp        ..B1.87       # Prob 0%                       #324.30
..LN480:
        je        ..B1.95       # Prob 20%                      #324.30
..LN481:
                                # LOE r13 r15 ebx r12d r14d
..B1.87:                        # Preds ..B1.86
..LN482:
   .loc    1  318  is_stmt 1
        incl      %r14d                                         #318.33
..LN483:
        cmpl      %ebx, %r14d                                   #318.24
..LN484:
        jl        ..B1.85       # Prob 82%                      #318.24
..LN485:
        jmp       ..B1.95       # Prob 100%                     #318.24
..LN486:
                                # LOE r13 r15 ebx r12d r14d
..B1.89:                        # Preds ..B1.74
..LN487:
   .loc    1  280  is_stmt 1
        xorl      %r14d, %r14d                                  #280.17
..LN488:
        testl     %ebx, %ebx                                    #280.24
..LN489:
        jle       ..B1.95       # Prob 10%                      #280.24
..LN490:
                                # LOE ebx r12d r14d
..B1.90:                        # Preds ..B1.89
..LN491:
   .loc    1  285  is_stmt 1
        movl      24(%rsp), %r13d                               #285.30
..LN492:
        movq      16(%rsp), %r15                                #285.30
..LN493:
        vxorpd    %xmm0, %xmm0, %xmm0                           #285.30
..LN494:
                                # LOE r13 r15 ebx r12d r14d
..B1.91:                        # Preds ..B1.93 ..B1.90
..LN495:
   .loc    1  281  is_stmt 1
        pushq     %r13                                          #281.25
..LN496:
        pushq     96(%r15)                                      #281.25
..LN497:
        pushq     88(%r15)                                      #281.25
..LN498:
        pushq     80(%r15)                                      #281.25
..LN499:
        pushq     72(%r15)                                      #281.25
..LN500:
        pushq     64(%r15)                                      #281.25
..LN501:
        pushq     56(%r15)                                      #281.25
..LN502:
        pushq     48(%r15)                                      #281.25
..LN503:
        movq      (%r15), %rdi                                  #281.25
..LN504:
        movq      8(%r15), %rsi                                 #281.25
..LN505:
        movq      16(%r15), %rdx                                #281.25
..LN506:
        movq      24(%r15), %rcx                                #281.25
..LN507:
        movq      32(%r15), %r8                                 #281.25
..LN508:
        movq      40(%r15), %r9                                 #281.25
..___tag_value_main.61:                                         #281.25
..LN509:
        call      NA_CUR_ALT_SMP                                #281.25
..___tag_value_main.62:                                         #
..LN510:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.178:                       # Preds ..B1.91
..LN511:
        vmovapd   %xmm0, %xmm1                                  #281.25
..LN512:
        addq      $64, %rsp                                     #281.25
..LN513:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.92:                        # Preds ..B1.178
..LN514:
   .loc    1  285  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #285.30
..LN515:
        vucomisd  %xmm0, %xmm1                                  #285.30
..LN516:
        jp        ..B1.93       # Prob 0%                       #285.30
..LN517:
        je        ..B1.95       # Prob 20%                      #285.30
..LN518:
                                # LOE r13 r15 ebx r12d r14d
..B1.93:                        # Preds ..B1.92
..LN519:
   .loc    1  280  is_stmt 1
        incl      %r14d                                         #280.33
..LN520:
        cmpl      %ebx, %r14d                                   #280.24
..LN521:
        jl        ..B1.91       # Prob 82%                      #280.24
..LN522:
                                # LOE r13 r15 ebx r12d r14d
..B1.95:                        # Preds ..B1.138 ..B1.137 ..B1.131 ..B1.130 ..B1.124
                                #       ..B1.123 ..B1.117 ..B1.116 ..B1.110 ..B1.109
                                #       ..B1.86 ..B1.92 ..B1.79 ..B1.93 ..B1.87
                                #       ..B1.80 ..B1.134 ..B1.127 ..B1.120 ..B1.113
                                #       ..B1.82 ..B1.83 ..B1.76 ..B1.106 ..B1.89
                                #      
..LN523:
   .loc    1  330  is_stmt 1

###             }
###         break;   
### 
###     }
###     // Stop timers
###     timing(&wct_end, &cput_end);

        lea       24(%rsp), %rdi                                #330.5
..LN524:
        lea       32(%rsp), %rsi                                #330.5
..___tag_value_main.63:                                         #330.5
..LN525:
        call      timing                                        #330.5
..___tag_value_main.64:                                         #
..LN526:
                                # LOE ebx r12d
..B1.96:                        # Preds ..B1.95
..LN527:
   .loc    1  338  is_stmt 1

### 
### // Kernels Benchmarking Ends Here  //
### 
### 
### 
### 
###     // Print total time of App and Cy/CL
###     printf("Elapsed total time:     %.16lf seconds\n", (wct_end-wct_start));

        vmovsd    24(%rsp), %xmm0                               #338.5
..LN528:
        movl      $.L_2__STRING.21, %edi                        #338.5
..LN529:
        movl      $1, %eax                                      #338.5
..LN530:
        vsubsd    (%rsp), %xmm0, %xmm0                          #338.5
..___tag_value_main.65:                                         #338.5
..LN531:
        call      printf                                        #338.5
..___tag_value_main.66:                                         #
..LN532:
                                # LOE ebx r12d
..B1.97:                        # Preds ..B1.96
..LN533:
   .loc    1  339  is_stmt 1

###     printf("Time per 1 experiment:  %.16lf seconds\n", (wct_end-wct_start)/(double)eIter);

        vxorpd    %xmm2, %xmm2, %xmm2                           #339.84
..LN534:
        movl      $.L_2__STRING.22, %edi                        #339.5
..LN535:
        vcvtsi2sd %ebx, %xmm2, %xmm2                            #339.84
..LN536:
        vmovsd    24(%rsp), %xmm0                               #339.5
..LN537:
        movl      $1, %eax                                      #339.5
..LN538:
        vmovsd    %xmm2, 40(%rsp)                               #339.84
..LN539:
        vsubsd    (%rsp), %xmm0, %xmm1                          #339.5
..LN540:
        vdivsd    %xmm2, %xmm1, %xmm0                           #339.5
..___tag_value_main.67:                                         #339.5
..LN541:
        call      printf                                        #339.5
..___tag_value_main.68:                                         #
..LN542:
                                # LOE r12d
..B1.98:                        # Preds ..B1.97
..LN543:
   .loc    1  340  is_stmt 1

###     printf("Cycles/CL:              %.16lf\n", 8.*2.7*(wct_end-wct_start)*(1000000000./(double)eIter/(double)eSize)  );

        vmovsd    .L_2il0floatpacket.37(%rip), %xmm2            #340.5
..LN544:
        vxorpd    %xmm4, %xmm4, %xmm4                           #340.5
..LN545:
        vdivsd    40(%rsp), %xmm2, %xmm3                        #340.5
..LN546:
        vcvtsi2sd %r12d, %xmm4, %xmm4                           #340.5
..LN547:
        vdivsd    %xmm4, %xmm3, %xmm6                           #340.5
..LN548:
        vmovsd    24(%rsp), %xmm0                               #340.5
..LN549:
        movl      $.L_2__STRING.23, %edi                        #340.5
..LN550:
        movl      $1, %eax                                      #340.5
..LN551:
        vsubsd    (%rsp), %xmm0, %xmm1                          #340.5
..LN552:
        vmulsd    .L_2il0floatpacket.36(%rip), %xmm1, %xmm5     #340.5
..LN553:
        vmulsd    %xmm6, %xmm5, %xmm0                           #340.5
..___tag_value_main.69:                                         #340.5
..LN554:
        call      printf                                        #340.5
..___tag_value_main.70:                                         #
..LN555:
                                # LOE
..B1.99:                        # Preds ..B1.98
..LN556:
   .loc    1  355  is_stmt 1

### 
### 
###     // If printfile, put results to a file
###     #if PRTF == 1
###     printf("Results printed to a file\n");
###     FILE * fp;
###     fp = fopen("results.txt", "w");
###     for (i=0; i<eSize*eNarr; ++i){
###         fprintf(fp, "%.16lf\n",oneBigArr[i]);
###     }
###     fclose(fp);
###     #endif
### 
###     // Free memory
###     free(oneBigArr);

        movq      64(%rsp), %rdi                                #355.5
..___tag_value_main.71:                                         #355.5
..LN557:
        call      free                                          #355.5
..___tag_value_main.72:                                         #
..LN558:
                                # LOE
..B1.100:                       # Preds ..B1.99
..LN559:
   .loc    1  356  is_stmt 1

###     free(arrOfArrs);

        movq      16(%rsp), %rdi                                #356.5
..___tag_value_main.73:                                         #356.5
..LN560:
        call      free                                          #356.5
..___tag_value_main.74:                                         #
..LN561:
                                # LOE
..B1.101:                       # Preds ..B1.100
..LN562:
   .loc    1  363  is_stmt 1

### 
###     // Close likwid markers
###     #if LIKWID
###         likwid_markerClose();   
###     #endif
### 
###     return 0;

        movl      $.2.5_2_kmpc_loc_struct_pack.26, %edi         #363.12
..LN563:
        xorl      %eax, %eax                                    #363.12
..___tag_value_main.75:                                         #363.12
..LN564:
        call      __kmpc_end                                    #363.12
..___tag_value_main.76:                                         #
..LN565:
                                # LOE
..B1.102:                       # Preds ..B1.101
..LN566:
        xorl      %eax, %eax                                    #363.12
..LN567:
        addq      $88, %rsp                                     #363.12
..___tag_value_main.77:                                         #363.12
..LN568:
        popq      %rbx                                          #363.12
..___tag_value_main.78:                                         #363.12
..LN569:
        popq      %r15                                          #363.12
..___tag_value_main.79:                                         #363.12
..LN570:
        popq      %r14                                          #363.12
..___tag_value_main.80:                                         #363.12
..LN571:
        popq      %r13                                          #363.12
..___tag_value_main.81:                                         #363.12
..LN572:
        popq      %r12                                          #363.12
..LN573:
        movq      %rbp, %rsp                                    #363.12
..LN574:
        popq      %rbp                                          #363.12
..___tag_value_main.82:                                         #
..LN575:
        ret                                                     #363.12
..___tag_value_main.84:                                         #
..LN576:
                                # LOE
..B1.106:                       # Preds ..B1.73                 # Infreq
..LN577:
   .loc    1  259  is_stmt 1
        xorl      %r14d, %r14d                                  #259.17
..LN578:
        testl     %ebx, %ebx                                    #259.24
..LN579:
        jle       ..B1.95       # Prob 10%                      #259.24
..LN580:
                                # LOE ebx r12d r14d
..B1.107:                       # Preds ..B1.106                # Infreq
..LN581:
   .loc    1  264  is_stmt 1
        movl      24(%rsp), %r13d                               #264.30
..LN582:
        movq      16(%rsp), %r15                                #264.30
..LN583:
        vxorpd    %xmm0, %xmm0, %xmm0                           #264.30
..LN584:
                                # LOE r13 r15 ebx r12d r14d
..B1.108:                       # Preds ..B1.110 ..B1.107       # Infreq
..LN585:
   .loc    1  260  is_stmt 1
        pushq     %r13                                          #260.25
..LN586:
        pushq     96(%r15)                                      #260.25
..LN587:
        pushq     88(%r15)                                      #260.25
..LN588:
        pushq     80(%r15)                                      #260.25
..LN589:
        pushq     72(%r15)                                      #260.25
..LN590:
        pushq     64(%r15)                                      #260.25
..LN591:
        pushq     56(%r15)                                      #260.25
..LN592:
        pushq     48(%r15)                                      #260.25
..LN593:
        movq      (%r15), %rdi                                  #260.25
..LN594:
        movq      8(%r15), %rsi                                 #260.25
..LN595:
        movq      16(%r15), %rdx                                #260.25
..LN596:
        movq      24(%r15), %rcx                                #260.25
..LN597:
        movq      32(%r15), %r8                                 #260.25
..LN598:
        movq      40(%r15), %r9                                 #260.25
..___tag_value_main.91:                                         #260.25
..LN599:
        call      NA_CUR_SMP                                    #260.25
..___tag_value_main.92:                                         #
..LN600:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.179:                       # Preds ..B1.108                # Infreq
..LN601:
        vmovapd   %xmm0, %xmm1                                  #260.25
..LN602:
        addq      $64, %rsp                                     #260.25
..LN603:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.109:                       # Preds ..B1.179                # Infreq
..LN604:
   .loc    1  264  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #264.30
..LN605:
        vucomisd  %xmm0, %xmm1                                  #264.30
..LN606:
        jp        ..B1.110      # Prob 0%                       #264.30
..LN607:
        je        ..B1.95       # Prob 20%                      #264.30
..LN608:
                                # LOE r13 r15 ebx r12d r14d
..B1.110:                       # Preds ..B1.109                # Infreq
..LN609:
   .loc    1  259  is_stmt 1
        incl      %r14d                                         #259.33
..LN610:
        cmpl      %ebx, %r14d                                   #259.24
..LN611:
        jl        ..B1.108      # Prob 82%                      #259.24
..LN612:
        jmp       ..B1.95       # Prob 100%                     #259.24
..LN613:
                                # LOE r13 r15 ebx r12d r14d
..B1.113:                       # Preds ..B1.72                 # Infreq
..LN614:
   .loc    1  238  is_stmt 1
        xorl      %r14d, %r14d                                  #238.17
..LN615:
        testl     %ebx, %ebx                                    #238.24
..LN616:
        jle       ..B1.95       # Prob 10%                      #238.24
..LN617:
                                # LOE ebx r12d r14d
..B1.114:                       # Preds ..B1.113                # Infreq
..LN618:
   .loc    1  243  is_stmt 1
        movl      24(%rsp), %r13d                               #243.30
..LN619:
        movq      16(%rsp), %r15                                #243.30
..LN620:
        vxorpd    %xmm0, %xmm0, %xmm0                           #243.30
..LN621:
                                # LOE r13 r15 ebx r12d r14d
..B1.115:                       # Preds ..B1.117 ..B1.114       # Infreq
..LN622:
   .loc    1  239  is_stmt 1
        pushq     %r13                                          #239.25
..LN623:
        pushq     96(%r15)                                      #239.25
..LN624:
        pushq     88(%r15)                                      #239.25
..LN625:
        pushq     80(%r15)                                      #239.25
..LN626:
        pushq     72(%r15)                                      #239.25
..LN627:
        pushq     64(%r15)                                      #239.25
..LN628:
        pushq     56(%r15)                                      #239.25
..LN629:
        pushq     48(%r15)                                      #239.25
..LN630:
        movq      (%r15), %rdi                                  #239.25
..LN631:
        movq      8(%r15), %rsi                                 #239.25
..LN632:
        movq      16(%r15), %rdx                                #239.25
..LN633:
        movq      24(%r15), %rcx                                #239.25
..LN634:
        movq      32(%r15), %r8                                 #239.25
..LN635:
        movq      40(%r15), %r9                                 #239.25
..___tag_value_main.93:                                         #239.25
..LN636:
        call      NA_CUR_ALT                                    #239.25
..___tag_value_main.94:                                         #
..LN637:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.180:                       # Preds ..B1.115                # Infreq
..LN638:
        vmovapd   %xmm0, %xmm1                                  #239.25
..LN639:
        addq      $64, %rsp                                     #239.25
..LN640:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.116:                       # Preds ..B1.180                # Infreq
..LN641:
   .loc    1  243  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #243.30
..LN642:
        vucomisd  %xmm0, %xmm1                                  #243.30
..LN643:
        jp        ..B1.117      # Prob 0%                       #243.30
..LN644:
        je        ..B1.95       # Prob 20%                      #243.30
..LN645:
                                # LOE r13 r15 ebx r12d r14d
..B1.117:                       # Preds ..B1.116                # Infreq
..LN646:
   .loc    1  238  is_stmt 1
        incl      %r14d                                         #238.33
..LN647:
        cmpl      %ebx, %r14d                                   #238.24
..LN648:
        jl        ..B1.115      # Prob 82%                      #238.24
..LN649:
        jmp       ..B1.95       # Prob 100%                     #238.24
..LN650:
                                # LOE r13 r15 ebx r12d r14d
..B1.120:                       # Preds ..B1.71                 # Infreq
..LN651:
   .loc    1  222  is_stmt 1
        xorl      %r14d, %r14d                                  #222.17
..LN652:
        testl     %ebx, %ebx                                    #222.24
..LN653:
        jle       ..B1.95       # Prob 10%                      #222.24
..LN654:
                                # LOE ebx r12d r14d
..B1.121:                       # Preds ..B1.120                # Infreq
..LN655:
   .loc    1  227  is_stmt 1
        movl      24(%rsp), %r13d                               #227.30
..LN656:
        movq      16(%rsp), %r15                                #227.30
..LN657:
        vxorpd    %xmm0, %xmm0, %xmm0                           #227.30
..LN658:
                                # LOE r13 r15 ebx r12d r14d
..B1.122:                       # Preds ..B1.124 ..B1.121       # Infreq
..LN659:
   .loc    1  223  is_stmt 1
        pushq     %r13                                          #223.22
..LN660:
        pushq     96(%r15)                                      #223.22
..LN661:
        pushq     88(%r15)                                      #223.22
..LN662:
        pushq     80(%r15)                                      #223.22
..LN663:
        pushq     72(%r15)                                      #223.22
..LN664:
        pushq     64(%r15)                                      #223.22
..LN665:
        pushq     56(%r15)                                      #223.22
..LN666:
        pushq     48(%r15)                                      #223.22
..LN667:
        movq      (%r15), %rdi                                  #223.22
..LN668:
        movq      8(%r15), %rsi                                 #223.22
..LN669:
        movq      16(%r15), %rdx                                #223.22
..LN670:
        movq      24(%r15), %rcx                                #223.22
..LN671:
        movq      32(%r15), %r8                                 #223.22
..LN672:
        movq      40(%r15), %r9                                 #223.22
..___tag_value_main.95:                                         #223.22
..LN673:
        call      NA_CUR                                        #223.22
..___tag_value_main.96:                                         #
..LN674:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.181:                       # Preds ..B1.122                # Infreq
..LN675:
        vmovapd   %xmm0, %xmm1                                  #223.22
..LN676:
        addq      $64, %rsp                                     #223.22
..LN677:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.123:                       # Preds ..B1.181                # Infreq
..LN678:
   .loc    1  227  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #227.30
..LN679:
        vucomisd  %xmm0, %xmm1                                  #227.30
..LN680:
        jp        ..B1.124      # Prob 0%                       #227.30
..LN681:
        je        ..B1.95       # Prob 20%                      #227.30
..LN682:
                                # LOE r13 r15 ebx r12d r14d
..B1.124:                       # Preds ..B1.123                # Infreq
..LN683:
   .loc    1  222  is_stmt 1
        incl      %r14d                                         #222.33
..LN684:
        cmpl      %ebx, %r14d                                   #222.24
..LN685:
        jl        ..B1.122      # Prob 82%                      #222.24
..LN686:
        jmp       ..B1.95       # Prob 100%                     #222.24
..LN687:
                                # LOE r13 r15 ebx r12d r14d
..B1.127:                       # Preds ..B1.70                 # Infreq
..LN688:
   .loc    1  211  is_stmt 1
        xorl      %r14d, %r14d                                  #211.17
..LN689:
        testl     %ebx, %ebx                                    #211.24
..LN690:
        jle       ..B1.95       # Prob 10%                      #211.24
..LN691:
                                # LOE ebx r12d r14d
..B1.128:                       # Preds ..B1.127                # Infreq
..LN692:
   .loc    1  216  is_stmt 1
        movl      24(%rsp), %r13d                               #216.30
..LN693:
        movq      16(%rsp), %r15                                #216.30
..LN694:
        vxorpd    %xmm0, %xmm0, %xmm0                           #216.30
..LN695:
                                # LOE r13 r15 ebx r12d r14d
..B1.129:                       # Preds ..B1.131 ..B1.128       # Infreq
..LN696:
   .loc    1  212  is_stmt 1
        pushq     %r13                                          #212.25
..LN697:
        pushq     80(%r15)                                      #212.25
..LN698:
        pushq     72(%r15)                                      #212.25
..LN699:
        pushq     64(%r15)                                      #212.25
..LN700:
        pushq     56(%r15)                                      #212.25
..LN701:
        pushq     48(%r15)                                      #212.25
..LN702:
        movq      (%r15), %rdi                                  #212.25
..LN703:
        movq      8(%r15), %rsi                                 #212.25
..LN704:
        movq      16(%r15), %rdx                                #212.25
..LN705:
        movq      24(%r15), %rcx                                #212.25
..LN706:
        movq      32(%r15), %r8                                 #212.25
..LN707:
        movq      40(%r15), %r9                                 #212.25
..___tag_value_main.97:                                         #212.25
..LN708:
        call      NA_STA_ALT                                    #212.25
..___tag_value_main.98:                                         #
..LN709:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.182:                       # Preds ..B1.129                # Infreq
..LN710:
        vmovapd   %xmm0, %xmm1                                  #212.25
..LN711:
        addq      $48, %rsp                                     #212.25
..LN712:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.130:                       # Preds ..B1.182                # Infreq
..LN713:
   .loc    1  216  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #216.30
..LN714:
        vucomisd  %xmm0, %xmm1                                  #216.30
..LN715:
        jp        ..B1.131      # Prob 0%                       #216.30
..LN716:
        je        ..B1.95       # Prob 20%                      #216.30
..LN717:
                                # LOE r13 r15 ebx r12d r14d
..B1.131:                       # Preds ..B1.130                # Infreq
..LN718:
   .loc    1  211  is_stmt 1
        incl      %r14d                                         #211.33
..LN719:
        cmpl      %ebx, %r14d                                   #211.24
..LN720:
        jl        ..B1.129      # Prob 82%                      #211.24
..LN721:
        jmp       ..B1.95       # Prob 100%                     #211.24
..LN722:
                                # LOE r13 r15 ebx r12d r14d
..B1.134:                       # Preds ..B1.69                 # Infreq
..LN723:
   .loc    1  200  is_stmt 1
        xorl      %r14d, %r14d                                  #200.17
..LN724:
        testl     %ebx, %ebx                                    #200.24
..LN725:
        jle       ..B1.95       # Prob 10%                      #200.24
..LN726:
                                # LOE ebx r12d r14d
..B1.135:                       # Preds ..B1.134                # Infreq
..LN727:
   .loc    1  205  is_stmt 1
        movl      24(%rsp), %r13d                               #205.30
..LN728:
        movq      16(%rsp), %r15                                #205.30
..LN729:
        vxorpd    %xmm0, %xmm0, %xmm0                           #205.30
..LN730:
                                # LOE r13 r15 ebx r12d r14d
..B1.136:                       # Preds ..B1.138 ..B1.135       # Infreq
..LN731:
   .loc    1  201  is_stmt 1
        pushq     %r13                                          #201.25
..LN732:
        pushq     80(%r15)                                      #201.25
..LN733:
        pushq     72(%r15)                                      #201.25
..LN734:
        pushq     64(%r15)                                      #201.25
..LN735:
        pushq     56(%r15)                                      #201.25
..LN736:
        pushq     48(%r15)                                      #201.25
..LN737:
        movq      (%r15), %rdi                                  #201.25
..LN738:
        movq      8(%r15), %rsi                                 #201.25
..LN739:
        movq      16(%r15), %rdx                                #201.25
..LN740:
        movq      24(%r15), %rcx                                #201.25
..LN741:
        movq      32(%r15), %r8                                 #201.25
..LN742:
        movq      40(%r15), %r9                                 #201.25
..___tag_value_main.99:                                         #201.25
..LN743:
        call      NA_STA                                        #201.25
..___tag_value_main.100:                                        #
..LN744:
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.183:                       # Preds ..B1.136                # Infreq
..LN745:
        vmovapd   %xmm0, %xmm1                                  #201.25
..LN746:
        addq      $48, %rsp                                     #201.25
..LN747:
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.137:                       # Preds ..B1.183                # Infreq
..LN748:
   .loc    1  205  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #205.30
..LN749:
        vucomisd  %xmm0, %xmm1                                  #205.30
..LN750:
        jp        ..B1.138      # Prob 0%                       #205.30
..LN751:
        je        ..B1.95       # Prob 20%                      #205.30
..LN752:
                                # LOE r13 r15 ebx r12d r14d
..B1.138:                       # Preds ..B1.137                # Infreq
..LN753:
   .loc    1  200  is_stmt 1
        incl      %r14d                                         #200.33
..LN754:
        cmpl      %ebx, %r14d                                   #200.24
..LN755:
        jl        ..B1.136      # Prob 82%                      #200.24
..LN756:
        jmp       ..B1.95       # Prob 100%                     #200.24
..LN757:
                                # LOE r13 r15 ebx r12d r14d
..B1.142:                       # Preds ..B1.38 ..B1.40 ..B1.42 # Infreq
..LN758:
   .loc    1  146  is_stmt 1
        movb      $1, %dl                                       #146.5
..LN759:
        xorl      %edi, %edi                                    #146.5
..LN760:
        jmp       ..B1.50       # Prob 100%                     #146.5
..LN761:
                                # LOE rcx ebx edi r12d r13d r14d r15d dl
..B1.145:                       # Preds ..B1.15                 # Infreq
..LN762:
   .loc    1  93  is_stmt 1
        movl      $.L_2__STRING.8, %edi                         #93.13
..LN763:
        xorl      %eax, %eax                                    #93.13
..___tag_value_main.101:                                        #93.13
..LN764:
        call      printf                                        #93.13
..___tag_value_main.102:                                        #
..LN765:
        jmp       ..B1.26       # Prob 100%                     #93.13
..LN766:
                                # LOE ebx r12d r15d
..B1.148:                       # Preds ..B1.14                 # Infreq
..LN767:
   .loc    1  87  is_stmt 1
        movl      $.L_2__STRING.7, %edi                         #87.13
..LN768:
        xorl      %eax, %eax                                    #87.13
..___tag_value_main.103:                                        #87.13
..LN769:
        call      printf                                        #87.13
..___tag_value_main.104:                                        #
..LN770:
        jmp       ..B1.26       # Prob 100%                     #87.13
..LN771:
                                # LOE ebx r12d r15d
..B1.151:                       # Preds ..B1.13                 # Infreq
..LN772:
   .loc    1  81  is_stmt 1
        movl      $.L_2__STRING.6, %edi                         #81.13
..LN773:
        xorl      %eax, %eax                                    #81.13
..___tag_value_main.105:                                        #81.13
..LN774:
        call      printf                                        #81.13
..___tag_value_main.106:                                        #
..LN775:
        jmp       ..B1.26       # Prob 100%                     #81.13
..LN776:
                                # LOE ebx r12d r15d
..B1.154:                       # Preds ..B1.12                 # Infreq
..LN777:
   .loc    1  75  is_stmt 1
        movl      $.L_2__STRING.4, %edi                         #75.13
..LN778:
        xorl      %eax, %eax                                    #75.13
..___tag_value_main.107:                                        #75.13
..LN779:
        call      printf                                        #75.13
..___tag_value_main.108:                                        #
..LN780:
        jmp       ..B1.26       # Prob 100%                     #75.13
..LN781:
                                # LOE ebx r12d r15d
..B1.157:                       # Preds ..B1.11                 # Infreq
..LN782:
   .loc    1  69  is_stmt 1
        movl      $.L_2__STRING.3, %edi                         #69.13
..LN783:
        xorl      %eax, %eax                                    #69.13
..___tag_value_main.109:                                        #69.13
..LN784:
        call      printf                                        #69.13
..___tag_value_main.110:                                        #
..LN785:
                                # LOE ebx r12d r15d
..B1.158:                       # Preds ..B1.157                # Infreq
..LN786:
   .loc    1  70  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #70.13
..LN787:
        xorl      %eax, %eax                                    #70.13
..___tag_value_main.111:                                        #70.13
..LN788:
        call      printf                                        #70.13
..___tag_value_main.112:                                        #
..LN789:
                                # LOE ebx r12d r15d
..B1.159:                       # Preds ..B1.158                # Infreq
..LN790:
   .loc    1  71  is_stmt 1
        movl      $11, %r14d                                    #71.13
..LN791:
        jmp       ..B1.28       # Prob 100%                     #71.13
..LN792:
                                # LOE ebx r12d r14d r15d
..B1.160:                       # Preds ..B1.10                 # Infreq
..LN793:
   .loc    1  63  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #63.13
..LN794:
        xorl      %eax, %eax                                    #63.13
..___tag_value_main.113:                                        #63.13
..LN795:
        call      printf                                        #63.13
..___tag_value_main.114:                                        #
..LN796:
                                # LOE ebx r12d r15d
..B1.161:                       # Preds ..B1.160                # Infreq
..LN797:
   .loc    1  64  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #64.13
..LN798:
        xorl      %eax, %eax                                    #64.13
..___tag_value_main.115:                                        #64.13
..LN799:
        call      printf                                        #64.13
..___tag_value_main.116:                                        #
..LN800:
                                # LOE ebx r12d r15d
..B1.162:                       # Preds ..B1.161                # Infreq
..LN801:
   .loc    1  65  is_stmt 1
        movl      $11, %r14d                                    #65.13
..LN802:
        jmp       ..B1.28       # Prob 100%                     #65.13
..LN803:
                                # LOE ebx r12d r14d r15d
..B1.163:                       # Preds ..B1.2                  # Infreq
..LN804:
   .loc    1  34  is_stmt 1
        movl      $.L_2__STRING.0, %edi                         #34.13
..LN805:
        xorl      %eax, %eax                                    #34.13
..___tag_value_main.117:                                        #34.13
..LN806:
        call      printf                                        #34.13
..___tag_value_main.118:                                        #
..LN807:
                                # LOE
..B1.164:                       # Preds ..B1.163                # Infreq
..LN808:
   .loc    1  35  is_stmt 1
        movl      $.2.5_2_kmpc_loc_struct_pack.18, %edi         #35.20
..LN809:
        xorl      %eax, %eax                                    #35.20
..___tag_value_main.119:                                        #35.20
..LN810:
        call      __kmpc_end                                    #35.20
..___tag_value_main.120:                                        #
..LN811:
                                # LOE
..B1.165:                       # Preds ..B1.164                # Infreq
..LN812:
        xorl      %eax, %eax                                    #35.20
..LN813:
        addq      $88, %rsp                                     #35.20
..___tag_value_main.121:                                        #35.20
..LN814:
        popq      %rbx                                          #35.20
..___tag_value_main.122:                                        #35.20
..LN815:
        popq      %r15                                          #35.20
..___tag_value_main.123:                                        #35.20
..LN816:
        popq      %r14                                          #35.20
..___tag_value_main.124:                                        #35.20
..LN817:
        popq      %r13                                          #35.20
..___tag_value_main.125:                                        #35.20
..LN818:
        popq      %r12                                          #35.20
..LN819:
        movq      %rbp, %rsp                                    #35.20
..LN820:
        popq      %rbp                                          #35.20
..___tag_value_main.126:                                        #
..LN821:
        ret                                                     #35.20
        .align    16,0x90
..___tag_value_main.128:                                        #
..LN822:
                                # LOE
..LN823:
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.824:
.LNmain:
	.data
	.align 4
	.align 4
.2.5_2_kmpc_loc_struct_pack.7:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.6
	.align 4
.2.5_2__kmpc_loc_pack.6:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	54
	.byte	59
	.byte	54
	.byte	59
	.byte	59
	.space 1, 0x00 	# pad
	.align 4
.2.5_2_kmpc_loc_struct_pack.26:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.25
	.align 4
.2.5_2__kmpc_loc_pack.25:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	51
	.byte	54
	.byte	51
	.byte	59
	.byte	51
	.byte	54
	.byte	51
	.byte	59
	.byte	59
	.space 1, 0x00 	# pad
	.align 4
.2.5_2_kmpc_loc_struct_pack.18:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.17
	.align 4
.2.5_2__kmpc_loc_pack.17:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.data
# -- End  main
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.35:
	.long	0xffc00000,0x41dfffff
	.type	.L_2il0floatpacket.35,@object
	.size	.L_2il0floatpacket.35,8
	.align 8
.L_2il0floatpacket.36:
	.long	0x9999999a,0x40359999
	.type	.L_2il0floatpacket.36,@object
	.size	.L_2il0floatpacket.36,8
	.align 8
.L_2il0floatpacket.37:
	.long	0x00000000,0x41cdcd65
	.type	.L_2il0floatpacket.37,@object
	.size	.L_2il0floatpacket.37,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.12:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130322259
	.long	1096766037
	.long	676940
	.type	.L_2__STRING.12,@object
	.size	.L_2__STRING.12,36
	.align 4
.L_2__STRING.11:
	.long	1918967843
	.long	1937334642
	.long	1819042080
	.long	540697455
	.long	538976288
	.long	538976288
	.long	669489
	.type	.L_2__STRING.11,@object
	.size	.L_2__STRING.11,28
	.align 4
.L_2__STRING.10:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130322259
	.long	676437
	.type	.L_2__STRING.10,@object
	.size	.L_2__STRING.10,32
	.align 4
.L_2__STRING.9:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130316110
	.long	1180652117
	.long	674894
	.type	.L_2__STRING.9,@object
	.size	.L_2__STRING.9,36
	.align 4
.L_2__STRING.5:
	.long	1918967843
	.long	1937334642
	.long	1819042080
	.long	540697455
	.long	538976288
	.long	538976288
	.long	668465
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,28
	.align 4
.L_2__STRING.8:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130316110
	.long	1096766037
	.long	1398756428
	.long	675917
	.type	.L_2__STRING.8,@object
	.size	.L_2__STRING.8,40
	.align 4
.L_2__STRING.7:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130316110
	.long	1398755925
	.long	675917
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,36
	.align 4
.L_2__STRING.6:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130316110
	.long	1096766037
	.long	676940
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,36
	.align 4
.L_2__STRING.4:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1130316110
	.long	676437
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,32
	.align 4
.L_2__STRING.3:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1398751566
	.long	1096761684
	.long	676940
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,36
	.align 4
.L_2__STRING.2:
	.long	1918967843
	.long	1937334642
	.long	1819042080
	.long	540697455
	.long	538976288
	.long	538976288
	.long	667953
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,28
	.align 4
.L_2__STRING.1:
	.long	1852990795
	.long	540699749
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1398751566
	.long	672084
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,32
	.align 4
.L_2__STRING.13:
	.long	1936617283
	.long	1953390964
	.long	1701147424
	.word	2660
	.byte	0
	.type	.L_2__STRING.13,@object
	.size	.L_2__STRING.13,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.14:
	.long	1702521171
	.long	543584032
	.long	544040269
	.long	1869376577
	.long	538983011
	.long	538976288
	.long	1109423397
	.long	1936028793
	.word	10
	.type	.L_2__STRING.14,@object
	.size	.L_2__STRING.14,34
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.15:
	.long	1701869637
	.long	1701669234
	.long	1914729582
	.long	1634037861
	.long	979658100
	.long	538976288
	.long	1948284197
	.long	1936026985
	.word	10
	.type	.L_2__STRING.15,@object
	.size	.L_2__STRING.15,34
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.16:
	.long	1464551756
	.long	1092633673
	.long	1763723600
	.long	1768169587
	.long	1818386803
	.long	681061
	.type	.L_2__STRING.16,@object
	.size	.L_2__STRING.16,24
	.align 4
.L_2__STRING.17:
	.long	542133583
	.long	541675585
	.long	1679848297
	.long	1650553705
	.long	174351724
	.byte	0
	.type	.L_2__STRING.17,@object
	.size	.L_2__STRING.17,21
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.18:
	.long	1094926665
	.long	1229996320
	.long	544434464
	.long	1634953572
	.long	1684368482
	.word	10
	.type	.L_2__STRING.18,@object
	.size	.L_2__STRING.18,22
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.19:
	.long	1702128705
	.long	1952542322
	.long	543520361
	.long	542525764
	.long	543452769
	.long	542136389
	.long	543519329
	.long	543519329
	.long	1634953572
	.long	1684368482
	.word	10
	.type	.L_2__STRING.19,@object
	.size	.L_2__STRING.19,42
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.20:
	.long	1735357008
	.long	544039282
	.long	1768121714
	.long	543520357
	.long	1835888483
	.long	543452769
	.long	1701734764
	.long	1918988320
	.long	1952804193
	.long	175338085
	.byte	0
	.type	.L_2__STRING.20,@object
	.size	.L_2__STRING.20,41
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.21:
	.long	1885432901
	.long	543450483
	.long	1635020660
	.long	1769218156
	.long	540697965
	.long	538976288
	.long	909192741
	.long	1931503212
	.long	1852793701
	.long	684900
	.type	.L_2__STRING.21,@object
	.size	.L_2__STRING.21,40
	.align 4
.L_2__STRING.22:
	.long	1701669204
	.long	1919250464
	.long	1696608544
	.long	1919250552
	.long	1852140905
	.long	538983028
	.long	909192741
	.long	1931503212
	.long	1852793701
	.long	684900
	.type	.L_2__STRING.22,@object
	.size	.L_2__STRING.22,40
	.align 4
.L_2__STRING.23:
	.long	1818458435
	.long	1127183205
	.long	538982988
	.long	538976288
	.long	538976288
	.long	538976288
	.long	909192741
	.long	681580
	.type	.L_2__STRING.23,@object
	.size	.L_2__STRING.23,32
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
.L_2__STRING.0:
	.long	1634036816
	.long	1696621939
	.long	1919251566
	.long	2053722912
	.long	539828325
	.long	1701864786
	.long	1869182049
	.long	1702045806
	.long	1869881460
	.long	1717920800
	.long	1953264993
	.long	544825888
	.long	1768978804
	.long	656435054
	.long	539567920
	.long	1699422253
	.long	1818586738
	.word	2606
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,71
	.data
	.section .note.GNU-stack, ""
# End
