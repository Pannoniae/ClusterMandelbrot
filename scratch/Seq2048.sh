#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH -D /users/40536446/scripts
#SBATCH -o Seq2048.out
#SBATCH --exclusive

for n in $(seq 1 5)
do
        printf "Sequential Run Number : %s\n" $n
        java -jar ../mandelbrot/Seq2048.jar
done
