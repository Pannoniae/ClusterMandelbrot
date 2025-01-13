#!/bin/bash
#SBATCH --ntasks=4
#SBATCH --nodes=4
#SBATCH --nodelist node[02-05]
#SBATCH --cpus-per-task=28
for n in $(seq 1 5)
do
        printf "Run Number : %s\n" $n

        srun -N 1 -n 1 --cpus-per-task=28 --exact --nodelist node[02] ./runHost.sh $1 &
        srun -N 3 -n 3 --cpus-per-task=28 --exact --nodelist node[03-05] ./runNode.sh &
        wait
done
