// Salaheldin Saleh. me@s-saleh.com

#include "kernels.h"
#include "timing.h"

int main (int argc, char** argv){

    // Init likwid
    #if LIKWID
        likwid_markerInit(); 
        #if OMP
            #pragma omp parallel
            likwid_markerThreadInit();
        #endif
    #endif

    // Timers
    double wct_start,wct_end,cput_start,cput_end, dummy;

    int i,        // Arrays counter
    j,            // Index for repeating the experiment  
    z,            // Outer loop blocking 
    eSize,        // Evaluated size (command line - Preprocessor)
    eIter,        // Evaluated Repeation (command line - Preprocessor)
    eKernel,      // Evaluated Kernel (command line - Preprocessor)
    eNarr,        // Evaluated eNarr (command line - Preprocessor)
    reminder;     // Used for adding extra elements in the arrays So that we always start from a 32 aligned element  


    // Evaluate Size and repeatation (command line - Preprocessor)
    #if EXT == 1 // If command line
        if (argc < 2 || argc > 4) // Wrong number of arguments
        {
            printf("Please enter Size - Repeation(set to default by typing '0') - Kernel.\n");
            return 0;
        }
        else // Set arrays size - repeation - kernel to benchmark
        {
            eSize = atoi(argv[1]);
            eIter  = atoi(argv[2]);
            eKernel = atoi(argv[3]);
        }
    #else // Set with preprocessors
        eSize   = NSIZE;
        eIter   = NITER;
        eKernel = KERNEL;
    #endif

    if (eIter == 0) // case user asked for default
    {
        if (eSize < L1) // L1
            eIter = 1000000;
        else if (eSize < L23)  
            eIter = 10000;
        else             // Main Mem
            eIter = 10;
    }

    // Print info about the kernel in benchmark
    switch (eKernel) 
    {
        case KER_NA_STA:
            printf("Kernel:                 NA_STA\n");
            printf("# arrays alloc:         11\n");
            eNarr = 11;
        break;

        case KER_NA_STA_ALT:
            printf("Kernel:                 NA_STA_ALT\n");
            printf("# arrays alloc:         11\n");
            eNarr = 11;
        break;

        case KER_NA_CUR:
            printf("Kernel:                 NA_CUR\n");
            printf("# arrays alloc:         13\n");
            eNarr = 13;
        break; 

        case KER_NA_CUR_ALT:
            printf("Kernel:                 NA_CUR_ALT\n");
            printf("# arrays alloc:         13\n");
            eNarr = 13;
        break; 

        case KER_NA_CUR_SMP:
            printf("Kernel:                 NA_CUR_SMP\n");
            printf("# arrays alloc:         13\n");
            eNarr = 13;
        break; 

        case KER_NA_CUR_ALT_SMP:
            printf("Kernel:                 NA_CUR_ALT_SMP\n");
            printf("# arrays alloc:         13\n");
            eNarr = 13;
        break;

        case KER_NA_CUR_FNL:
            printf("Kernel:                 NA_CUR_FNL\n");
            printf("# arrays alloc:         13\n");
            eNarr = 13;
        break; 

        case KER_SY_CUR:
            printf("Kernel:                 SY_CUR\n");
            printf("# arrays alloc:         17\n");
            eNarr = 17;
        break;  

        case KER_SY_CUR_ALT:
            printf("Kernel:                 SY_CUR_ALT\n");
            printf("# arrays alloc:         17\n");
            eNarr = 17;
        break;

        default:
        break; 
    }

    // Check if the arrays' size is not a multible of 32. This is important for alligned loads
    if( (eSize%64) != 0)
        reminder = (eSize%64);
    else
        reminder = 0;

	// Allocate one big chunk of memory
    double * __restrict__ __attribute__((aligned(64))) oneBigArr;
    posix_memalign((void**)&oneBigArr, 64, (eSize + reminder) * eNarr * sizeof(double) );
    
    // Allocate array of arrays equivelent to eNarr
    double ** __restrict__ __attribute__((aligned(64))) arrOfArrs = (double **)malloc( eNarr * sizeof(double *) );
    
	// Generate random numbers between 0-100
    #if RANDSEED == 1
    srand(time(NULL));
    printf("Random seed\n");
    #else
    srand(1);
    printf("Constant seed\n");
    #endif
    for (i=0; i<(eSize+reminder)*eNarr;++i){
        oneBigArr[i] = (double)(rand())/RAND_MAX;
    }
    
    // Reassign the one big array to smaller alligned arrays
    for (i=0; i<eNarr;++i){
        arrOfArrs[i] = &(oneBigArr[i * (eSize + reminder)]);
    }

    // Print info about the App
    // Print total mem allocated
    printf("Size of Mem Alloc:      %u Bytes\n", (eSize + reminder) * eNarr * sizeof(double));
    // Experiment repeated
    printf("Experiment repeated:    %u times\n", eIter);
    #if LIKWID
    printf("LIKWID API is enabled\n");
        #if LIKEXT
        printf("LIKWID is measing the external loop\n");
        #else
        printf("LIKWID is measing the internal loop\n");
        #endif
    #else
    printf("LIKWID API is disabled\n");
    #endif
    #if OMP
    printf("OMP API is enabled\n");
    #pragma omp parallel
    {
    #pragma omp single
    printf("Number of threads:      %u\n", omp_get_num_threads());
    }
    #else
    printf("OMP API is disabled\n");
    #endif
    #if IACA
    printf("IACA API is enabled\n");
    #else
    printf("IACA API is disabled\n");
    #endif
    #if EXTMATH
    printf("Alternative DIV and EXP are enabled\n");
    #else
    printf("Alternative DIV and EXP are disabled\n");
    #endif
    #if EXT
    printf("Program recieve command line parameters\n");
    #else
    printf("Program is configured in the Makefile\n");
    #endif

// Kernels Benchmarking Starts Here  //

    // Start timers
    timing(&wct_start, &cput_start);

    switch(eKernel)
    {
        case KER_NA_STA:
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_STA(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
        break;

        case KER_NA_STA_ALT:
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_STA_ALT(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
        break;

		case KER_NA_CUR:
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
            	dummy = NA_CUR(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
        break;  

        case KER_NA_CUR_ALT:
            #if LIKWID
            #if LIKEXT
            likwid_markerStartRegion("NA_CUR_ALT_OUT");
            #endif
            #endif
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_CUR_ALT(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
            #if LIKWID
            #if LIKEXT
            likwid_markerStopRegion("NA_CUR_ALT_OUT"); 
            #endif
            #endif   
        break;

        case KER_NA_CUR_SMP:
            #if LIKWID
            #if LIKEXT
            likwid_markerStartRegion("NA_CUR_SMP_OUT");
            #endif
            #endif
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_CUR_SMP(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
            #if LIKWID
            #if LIKEXT
            likwid_markerStopRegion("NA_CUR_SMP_OUT"); 
            #endif
            #endif   
        break;

        case KER_NA_CUR_ALT_SMP:
            #if LIKWID
            #if LIKEXT
            likwid_markerStartRegion("NA_CUR_ALT_SMP_OUT");
            #endif
            #endif
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_CUR_ALT_SMP(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
            #if LIKWID
            #if LIKEXT
            likwid_markerStopRegion("NA_CUR_ALT_SMP_OUT"); 
            #endif
            #endif   
        break;

        case KER_NA_CUR_FNL:
            #if LIKWID
            #if LIKEXT
            likwid_markerStartRegion("NA_CUR_FNL");
            #endif
            #endif
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = NA_CUR_FNL(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
                    
            }
            #if LIKWID
            #if LIKEXT
            likwid_markerStopRegion("NA_CUR_FNL"); 
            #endif
            #endif   
        break;

        case KER_SY_CUR:
            // Repeat the execution of kernel
            for(j=0; j<eIter; ++j){
                dummy = SY_CUR(arrOfArrs[0], arrOfArrs[1], arrOfArrs[2], arrOfArrs[3], 
                    arrOfArrs[4], arrOfArrs[5], arrOfArrs[6], arrOfArrs[7], arrOfArrs[8], 
                    arrOfArrs[9], arrOfArrs[10], arrOfArrs[11], arrOfArrs[12], arrOfArrs[13], 
                    arrOfArrs[14], arrOfArrs[15], arrOfArrs[16], eSize);
                // Dummy check to prevent compiler from removing the repeatation loop
                if (dummy == 0.0) break;
            }
        break;   

    }
    // Stop timers
    timing(&wct_end, &cput_end);

// Kernels Benchmarking Ends Here  //




    // Print total time of App and Cy/CL
    printf("Elapsed total time:     %.16lf seconds\n", (wct_end-wct_start));
    printf("Time per 1 experiment:  %.16lf seconds\n", (wct_end-wct_start)/(double)eIter);
    #if INTEL
    printf("Cycles/CL:              %.16lf\n", 8.*2.6*(wct_end-wct_start)*(1000000000./(double)eIter/(double)eSize)  );
    #else
    printf("Cycles/CL:              %.16lf\n", 8.*1.6*(wct_end-wct_start)*(1000000000./(double)eIter/(double)eSize)  );
    #endif
    printf("MScIt/sec:              %.16lf\n", (double)eSize/(wct_end-wct_start)/1000000.*(double)eIter  );


    // If printfile, put results to a file
    #if PRTF  
    printf("Results printed to a file\n");
    FILE * fp;
    fp = fopen("results.txt", "w");
    for (i=0; i<(eSize+reminder)*eNarr; ++i){
        //fprintf(fp, "%.16lf\n",oneBigArr[i]);
        printf("%.16lf\n",oneBigArr[i]);
    }
    fclose(fp);
    #endif

    // Free memory
    free(oneBigArr);
    free(arrOfArrs);

    // Close likwid markers
    #if LIKWID
        likwid_markerClose();   
    #endif

    return 0;
}
