#!/bin/bash
#SBATCH -D /users/40536446/scripts
#SBATCH -o job-%j.output
#SBATCH --mail-user="40536446@napier.ac.uk"
#SBATCH --mail-type ALL
#SBATCH --ntasks=5
#SBATCH --nodes=5
#SBATCH --nodelist node[02-06]
#SBATCH --cpus-per-task=16
#SBATCH --time=45
##./runHPCmulti.sh hpc2n4w2048
##./runHPCmulti.sh hpc2n6w2048
##./runHPCmulti.sh hpc2n8w2048
##./runHPCmulti.sh hpc2n10w2048
./runHPCmulti.sh hpc2n12w2048
