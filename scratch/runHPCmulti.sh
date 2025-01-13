#!/bin/bash
for n in $(seq 1 5)
do
        printf "Run Number : %s\n" $n

        srun -N 1 -n 1 --cpus-per-task=16 --exact --nodelist node[02] ./runHost.sh $1 &
        srun -N 4 -n 4 --cpus-per-task=16 --exact --nodelist node[03-06] ./runNode.sh &
        wait
done
