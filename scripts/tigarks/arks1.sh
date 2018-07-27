#!/bin/bash -l

#SBATCH -J runarks1
#SBATCH -o runarks1-%j.o
#SBATCH -e runarks1-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=2-00:00
#SBATCH --no-requeue
#SBATCH -p high

module load python3
source ~/.bashrc

cd /home/eoziolor/phgenome/data/tigarks/arks1/

#files
my_fasta=supernova
my_reads=barcoded

#code
arks-make2 arks-tigmint \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.5 \
c=5 \
e=10000 \
r=0.05 \
l=5 \
z=250 \
k=42 \
threads=16 \
t=16
