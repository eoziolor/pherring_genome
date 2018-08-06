#!/bin/bash -l

#SBATCH -J runarks15b
#SBATCH -o runarks15b-%j.o
#SBATCH -e runarks15b-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

cd /home/eoziolor/phgenome/data/altarks/arks15b/

#files
my_fasta=arks14b
my_reads=barcoded

#code
arks-make2 arks \
draft=$my_fasta \
reads=$my_reads \
m=50-10000 \
a=0.5 \
c=3 \
e=30000 \
r=0.1 \
l=3 \
z=250 \
k=60 \
threads=16 
