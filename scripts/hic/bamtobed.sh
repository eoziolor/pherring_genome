#!/bin/bash

#SBATCH -J convert_bamtobed
#SBATCH -o convert_bamtobed_%j.o
#SBATCH -e convert_bamtobed_%j.o
#SBATCH --mem=60000
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

HIC=/home/eoziolor/phgenome/data/hic/dedup/herring_genome.bam
BEDTOOLS=/home/eoziolor/program/bedtools2/bin/bamToBed
MED=/home/eoziolor/phgenome/data/hic/dedup/herring_genome.bed
OUT=/home/eoziolor/phgenome/data/hic/final/selfmap_herring.bam

$BEDTOOLS -i $HIC > $MED
sort -k 4 $MED > $OUT
