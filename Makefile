# Salaheldin Saleh. me@s-saleh.com
# iaca -64 -arch SNB -o .txt -analysis THROUGHPUT .o
# make clean; make SIZE=4473924 KERNEL=2
# make clean; make SIZE=262  KEREL=2 
# make clean; make SIZE=112  KEREL=22 
#likwid - omp - Mem - Kernel - 

# Set Preprocessors
#(if Intel processor:1 - if bgq:0)
INTEL=0
#(LIKWID 0: off - 1: on)
#(LIKEXT markers on the repeation loop 0: no - 1: yes)
LIKWID = 0
LIKEXT = 0
#(IACA 0: off - 1: on)
IACA   = 0
#(OMP 0: off - 1: on)
OMP    = 1
#(RANDSEED 0: off - 1: on)
RANDSEED=0
# Print results to a file (0: off - 1: on)
PRTF	=0
# Use our implementation for MATH (exp and div) (0: no - 1: yes)
EXTMATH	=0
#(1: use command line - 2: use preprocessors)
EXT	   = 1 	
# Arrays memory size	
NSIZE  = 260
# Repeat kernels (0: use defaults which are defined inside the program)
NITER  = 0
# Select Kernel (1 - 2 - 3 - 11 - 22 - 33)
KERNEL = 22

# Set Compiler
CC=icc
XC=bgxlc_r

# Preprocessors as flags
DEFS = -DNSIZE=$(NSIZE) -DNITER=$(NITER) -DKERNEL=$(KERNEL) -DIACA=$(IACA) -DOMP=$(OMP) -DLIKWID=$(LIKWID) -DEXT=$(EXT) \
-DLIKEXT=$(LIKEXT) -DRANDSEED=$(RANDSEED) -DPRTF=$(PRTF) -DEXTMATH=$(EXTMATH) -DINTEL=$(INTEL) -DBGMATH=$(BGMATH)
# Compilation flags
CMPF = -restrict -fno-alias -O3 -xAVX -opt-streaming-stores never -openmp -nolib-inline -I/apps/likwid/3.1.1/include 
CMPFBGQ = -O5 -qarch=qp -qtune=qp -qsmp=omp -qassert=refalign #-qlistfmt=html=inlines  #-qinline  -Q -qhot=simd #-qinline=limit=10000
# Inline functions in te same file
INLF = -finline-functions -finline-limit=1000 
# Vectorization Report
VECF = -vec-report3
LNKF = -lrt -lm
LINKBGQ = -lmass_simd #-lmass -lmassv 
ASMF = -finline-functions -finline-limit=1000  -fsource-asm
# Make sure to load likwid module
LIKL=-L/usr/local/lib # -L/apps/likwid/3.1.1/lib -llikwid 

# Object files dir
objdir=objdir
objdirbgq=objdirbgq
# Assembly files dir
asmdir=asmdir
# Source files dir
srcdir=srcdir


SOURCES := $(wildcard $(srcdir)/*.c)
OBJ     := $(patsubst $(srcdir)/%.c,$(objdir)/%.o, $(SOURCES))
OBJBGQ     := $(patsubst $(srcdir)/%.c,$(objdirbgq)/%.o, $(SOURCES))
ASM     := $(patsubst $(srcdir)/%.c,$(asmdir)/%.s, $(SOURCES))

all: dir output
asm: dir assemb
bgq: dirbgq outputbgq	

dir: $(objdir) $(asmdir) $(srcdir)
dirbgq: $(objdirbgq) $(asmdir) $(srcdir)

$(objdir):
	@mkdir -p $@
$(objdirbgq):
	@mkdir -p $@
$(asmdir):
	@mkdir -p $@
$(srcdir):
	@mkdir -p $@

output: $(OBJ)
	$(CC) $(CMPF) $^ $(LNKF)  -o $@ $(LIKL)
outputbgq: $(OBJBGQ)
	$(XC) $(CMPFBGQ) $^ -o  $@ $(LINKBGQ) 

$(objdir)/%.o: $(srcdir)/%.c
	$(CC) $(CMPF) $(INLF) -c $^ $(DEFS) $(VECF) -o $@
$(objdirbgq)/%.o: $(srcdir)/%.c
	$(XC) $(CMPFBGQ) -c $^ $(DEFS) -o $@

assemb: $(ASM)

$(asmdir)/%.s: $(srcdir)/%.c
	$(CC) $(CMPF) $(ASMF) -S $^ $(DEFS) $(VECF) -o $@


.PHONY: clean cleanbgq cleanasm cleanall all asm

clean:
	rm -rf $(objdir)/*.o  output 
cleanbgq:
	rm -rf $(objdirbgq)/*.o outputbgq
cleanasm:
	rm -rf $(asmdir)/*.s
cleanall:
	 rm -rf $(asmdir)/*.s $(objdir)/*.o $(objdirbgq)/*.o output outputbgq
