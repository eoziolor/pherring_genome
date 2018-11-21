#!/bin/bash

#SBATCH -J salsa_arima
#SBATCH -o salsa_arima_%j.o
#SBATCH -e salsa_arima_%j.o
#SBATCH --mem=60000
#SBATCH -t 6-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

module load python

genome=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid_2.fasta
fai=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid_2.fasta.fai
hic=/home/eoziolor/phgenome/data/hic_arima/final/selfmap_herring_arima_2.bed
salsa=/home/eoziolor/program/SALSA/run_pipeline.py
output=/home/eoziolor/phgenome/data/salsa/arima_genome/

python $salsa \
-a $genome \
-l $fai \
-b $hic \
-e GATC \
-o $output
