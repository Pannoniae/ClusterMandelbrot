#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH -D /users/40536446/scripts
#SBATCH -o Seq4096.out
#SBATCH --exclusive

for n in $(seq 1 5)
do
        printf "Sequential Run Number : %s\n" $n
        java -jar ../mandelbrot/Seq4096.jar
done
