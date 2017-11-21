#!/bin/bash -l

#SBATCH -J ph_fastqc
#SBATCH -e ph_fastqc-%j.o
#SBATCH -o ph_fastqc-%J.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -t 02:00:00
#SBATCH --mem=60000

module load fastqc

#folder
my_dir=/home/eoziolor/phgenome/data/trim/

#code
fastqc $my_dir/* \
-o $my_dir
