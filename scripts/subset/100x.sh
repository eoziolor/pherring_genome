#!/bin/bash

#SBATCH -J sub100x
#SBATCH -o /home/eoziolor/phgenome/scripts/subset/sub100x_%j.o
#SBATCH -e /home/eoziolor/phgenome/scripts/subset/sub100x_%j.o
#SBATCH --time=7-00:00
#SBATCH --mem=60000

#files
r1=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R1_001.fastq.gz
r2=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R2_001.fastq.gz

x100=/home/eoziolor/phgenome/data/raw/sub100x/sub100x.fasta.gz

r1sub=/home/eoziolor/phgenome/data/raw/sub100x/r1sub.fastq.gz
r2sub=/home/eoziolor/phgenome/data/raw/sub100x/r2sub.fastq.gz

zcat $r1 | head -n 1236000000 | gzip > $r1sub
zcat $r2 | head -n 1236000000 | gzip > $r2sub

cat $r1sub $r2sub > $x100

