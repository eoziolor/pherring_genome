#!/bin/bash -l
#SBATCH -J md5check
#SBATCH -o md5sum-%j.o
#SBATCH -e md5sum-%j.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=0-01:00
#SBATCH --mem=60000

md5sum /home/eoziolor/phgenome/data/raw/*.fastq.gz > /home/eoziolor/phgenome/data/raw/md5post.txt
