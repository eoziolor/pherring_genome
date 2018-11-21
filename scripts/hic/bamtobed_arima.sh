#!/bin/bash

#SBATCH -J convert_bamtobed_arima
#SBATCH -o convert_bamtobed_arima_%j.o
#SBATCH -e convert_bamtobed_arima_%j.o
#SBATCH --mem=60000
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

HIC=/home/eoziolor/phgenome/data/hic_arima/dedup/herring_genome_arima.bam
BEDTOOLS=/home/eoziolor/program/bedtools2/bin/bamToBed
MED=/home/eoziolor/phgenome/data/hic_arima/dedup/herring_genome_arima.bed
OUT=/home/eoziolor/phgenome/data/hic_arima/final/selfmap_herring_arima.bam

$BEDTOOLS -i $HIC > $MED
sort -k 4 $MED > $OUT
