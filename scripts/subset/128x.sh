#!/bin/bash

#SBATCH -J sub128x
#SBATCH -o /home/eoziolor/phgenome/scripts/subset/sub128x_%j.o
#SBATCH -e /home/eoziolor/phgenome/scripts/subset/sub128x_%j.o
#SBATCH --time=7-00:00
#SBATCH --mem=60000

#files
r1=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R1_001.fastq.gz
r2=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R2_001.fastq.gz

x128=/home/eoziolor/phgenome/data/raw/sub128x/sub128x.fasta.gz

cat $r1 $r2 > $x128

