#!/bin/bash -l

#SBATCH -J runarks10
#SBATCH -o runarks10-%j.o
#SBATCH -e runarks10-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/tigarks/arks10/

#files
my_fasta=arks9
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.9 \
c=5 \
e=60000 \
r=0.05 \
l=5 \
z=250 \
k=30 \
threads=16
