cd /gpfs/bbp.cscs.ch/home/ssaleh/cframework/neuron
#950000
export BG_THREADLAYOUT=2
echo "BG_THREADLAYOUT=2 ./outputbgq 950000 1 1 "
for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
        export OMP_NUM_THREADS=${CS}
        `srun -N 1 ./outputbgq 950000  1 1 > ./test.txt`

        PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
        echo "${CS} ${PERF}"
        # echo "${CS} ${PERF}"  >>  ./curr-C-scale-bgq-breadth.txt
done
echo "------------------------------------"

# export BG_THREADLAYOUT=2
# echo "BG_THREADLAYOUT=2 ./outputbgq 950000 1 1 "
# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq 950000 1 1 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "${CS} ${PERF}"
#         # echo "${CS} ${PERF}"  >>  ./curr-C-scale-bgq-breadth.txt
# done
# echo "------------------------------------"

# export BG_THREADLAYOUT=1
# echo "BG_THREADLAYOUT=1 ./outputbgq 950000 1 11 "
# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq 950000 1 11 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "${CS} ${PERF}"
#         # echo "${CS} ${PERF}"  >>  ./curr-C-scale-bgq-breadth.txt
# done
# echo "------------------------------------"

# export BG_THREADLAYOUT=2
# echo "BG_THREADLAYOUT=12 ./outputbgq 950000 1 11 "
# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq 950000 1 11 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "${CS} ${PERF}"
#         # echo "${CS} ${PERF}"  >>  ./curr-C-scale-bgq-breadth.txt
# done
# echo "------------------------------------"


# export BG_THREADLAYOUT=2

# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq 950000 1 2 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "MScIt/sec: ${PERF}"
#         echo "${CS} ${PERF}"  >>  ./cur-scale-bgq-depth-standC.txt
# done

# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq 950000 1 1 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "MScIt/sec: ${PERF}"
#         echo "${CS} ${PERF}"  >>  ./stat-scale-bgq-depth-standardC.txt
# done

# for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64; do
#         export OMP_NUM_THREADS=${CS}
#         `srun -N 1 ./outputbgq-altC 950000 1 1 > ./test.txt`

#         PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
#         echo "MScIt/sec: ${PERF}"
#         echo "${CS} ${PERF}"  >>  ./stat-scale-bgq-depth-altC.txt
# done