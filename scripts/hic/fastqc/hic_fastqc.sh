#!/bin/bash -l

#SBATCH -J fastqc-hic
#SBATCH -o fastqc-hic-%j.o
#SBATCH -e fastqc-hic-%j.o
#SBATCH -n 16
#SBATCH --mem=60G
#SBATCH -t 1-00:00
#SBATCH -p high
#SBATCH --no-requeue

module load bio3

cd /home/eoziolor/phgenome/data/hic/raw/

fastqc -t 16 *.fq.gz
