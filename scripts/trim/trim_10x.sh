#!/bin/bash -l
#SBATCH -J pytrimmer
#SBATCH -o pytrimmer-%j.o
#SBATCH -e pytrimmer-%j.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=2-00:00
#SBATCH --mem=60000

#programs and files
prog=/home/eoziolor/program/proc10xG/process_10xReads.py
file1=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R1_001.fastq.gz
file2=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R2_001.fastq.gz
output=/home/eoziolor/phgenome/data/trim/PH-Sitka-93_S1_L008_RA_001.fastq.gz

$prog \
-1 $file1 \
-2 $file2 \
-t 7 \
-o stdout | \
gzip > $output
