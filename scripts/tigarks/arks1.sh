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

#source ~/.bashrc
export PATH=/home/eoziolor/program/tigmint/bin:$PATH
export PATH=/home/eoziolor/program/arks/Examples:$PATH
export PATH=/home/eoziolor/program/arks/Arks:$PATH
export PATH=/home/eoziolor/program/links_v1.8.6:$PATH

module load bio3

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
