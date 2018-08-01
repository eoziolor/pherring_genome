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

cd /home/eoziolor/phgenome/data/tigarks/arks2/

#files
my_fasta=arks1
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.5 \
c=5 \
e=15000 \
r=0.05 \
l=5 \
z=250 \
k=30 \
threads=16
