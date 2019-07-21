#!/bin/bash -l

#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

#SBATCH --time=00:01:00


#SBATCH --job-name=PS4_ex2d
#SBATCH --output=ex2d.out
#SBATCH --error=ex2d.err

#SBATCH --partition=intq

export OMP_NUM_THREADS=2


### openmp executable
./PS4_ex2d.exec

