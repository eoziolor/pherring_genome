#!/bin/bash -l

#SBATCH -J runarks5
#SBATCH -o runarks5-%j.o
#SBATCH -e runarks5-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/arks/arks5/

#files
my_fasta=arks4
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.9 \
o=3 \
c=3 \
e=20000 \
r=0.1 \
l=3 \
z=250 \
threads=16 
