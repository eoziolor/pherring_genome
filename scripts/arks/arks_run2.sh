#!/bin/bash -l

#SBATCH -J runarks2
#SBATCH -o runarks2-%j.o
#SBATCH -e runarks2-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/arks/arks2/

#files
my_fasta=arks1
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.3 \
o=3 \
threads=16
