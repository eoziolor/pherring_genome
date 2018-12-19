#!/bin/bash

#SBATCH -J salsa_self
#SBATCH -o salsa_self_%j.o
#SBATCH -e salsa_self_%j.o
#SBATCH --mem=60000
#SBATCH -t 6-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

module load python

genome=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid_2.fasta
fai=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid_2.fasta.fai
hic=/home/eoziolor/phgenome/data/hic/final/selfmap_herring_2.bed
salsa=/home/eoziolor/program/SALSA/run_pipeline.py
output=/home/eoziolor/phgenome/data/salsa/selfmap_genome/pherring_hic_self

python $salsa \
-a $genome \
-l $fai \
-b $hic \
-e GATC \
-o $output
