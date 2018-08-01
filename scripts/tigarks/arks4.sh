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

cd /home/eoziolor/phgenome/data/tigarks/arks4/

#files
my_fasta=arks3
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.5 \
c=5 \
e=25000 \
r=0.05 \
l=5 \
z=250 \
k=30 \
threads=16 
