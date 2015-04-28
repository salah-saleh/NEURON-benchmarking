cd /gpfs/bbp.cscs.ch/home/ssaleh/cframework/neuron


echo "Ker: 1 - std"
for CS in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
        export OMP_NUM_THREADS=${CS}
        `srun -N 1 ./outputbgq 9500000 1 1 > ./test.txt`

        PERF=`cat ./test.txt |grep -e"MScIt/sec"|awk '{print $2}'`
        echo "${CS} ${PERF}"
        echo "${CS} ${PERF}"  >>  ./curr-C-scale-bgq-breadth.txt
done
echo "--------------------------------"



# size=32
# while [  $size -lt 400 ]; do
# 	`likwid-pin -c 0 ./output ${size} 0 222 > ./temp.txt`
# 	CY=`cat ./temp.txt |grep -e"Cycles/CL"|awk '{print $2}'`
# 	echo size $size
# 	echo CY   $CY
# 	echo "${size} ${CY}"  >> ./na-cur-smp-4subloops-L1.txt
# 	let size+=4
# done


# while [  $size -lt 300000 ]; do
# 	`./output ${size} 1000 > ./temp.txt`
# 	CY=`cat ./temp.txt |grep -e"Cycles/CL"|awk '{print $2}'`
# 	echo size $size
# 	echo CY   $CY
# 	echo "${size} ${CY}"  >> ./na-cur-alt.txt
# 	let size+=32
# done

# size=4000000
# while [  $size -lt 4000128 ]; do
# 	`likwid-pin -c 0 ./output ${size} 0 22222 > ./temp.txt`
# 	CY=`cat ./temp.txt |grep -e"Cycles/CL"|awk '{print $2}'`
# 	echo size $size
# 	echo CY   $CY
# 	echo "${size} ${CY}"  >> ./results/na-cur-fnl-main-mem.txt
# 	let size+=4
# done