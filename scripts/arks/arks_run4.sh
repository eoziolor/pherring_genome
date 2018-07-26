#!/bin/bash -l

#SBATCH -J runarks4
#SBATCH -o runarks4-%j.o
#SBATCH -e runarks4-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/arks/arks4/

#files
my_fasta=arks3
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.9 \
o=3 \
c=3 \
e=10000 \
r=0.1 \
l=3 \
z=250 \
threads=16 
