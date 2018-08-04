#!/bin/bash -l

#SBATCH -J runarks10b
#SBATCH -o runarks10b-%j.o
#SBATCH -e runarks10b-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/altarks/arks10b/

#files
my_fasta=arks9b
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.5 \
c=3 \
e=50000 \
r=0.1 \
l=3 \
z=250 \
k=30 \
threads=16
