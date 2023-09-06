#!/bin/bash
#SBATCH --job-name=study1
#SBATCH --time=01:30:00
#SBATCH --account=def-fabricel
#SBATCH --ntasks=85
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1200M
#SBATCH --mail-user=fournier.patrick@uqam.ca
#SBATCH --mail-type=ALL

srun hostname -s > hostfile
sleep 5

module load julia/1.9.1

julia study1_sh.jl \
      --machine-file ./hostfile \
      --project=../../.

rm hostfile
