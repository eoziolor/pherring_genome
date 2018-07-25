#!/bin/bash -l

#SBATCH -J runarks
#SBATCH -o runarks-%j.o
#SBATCH -e runarks-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=2-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/arks/

#files
my_fasta=phgenome.hap
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-6000 \
a=0.9 \
o=3 \
threads=16 
