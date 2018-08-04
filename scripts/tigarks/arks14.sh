#!/bin/bash -l

#SBATCH -J runarks14
#SBATCH -o runarks14-%j.o
#SBATCH -e runarks14-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/tigarks/arks14/

#files
my_fasta=arks13
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.9 \
c=3 \
e=30000 \
r=0.1 \
l=3 \
z=250 \
k=30 \
threads=16 
