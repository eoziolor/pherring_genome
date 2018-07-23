#!/bin/bash -l

#SBATCH -J runarks1
#SBATCH -o runarks1-%j.o
#SBATCH -e runarks1-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=2-00:00
#SBATCH --mem=60000
#SBATCH --no-requeue
#SBATCH -p high

source /home/eoziolor/.bashrc

#files
my_arks=/home/eoziolor/program/arks/Examples/arks-make
my_fasta=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome.hap.fasta.gz
my_reads=/home/eoziolor/phgenome/raw/NewFastq/outs/UNFINISHEEEEDDDDDDDDDDDDDDDD

#code

$my_arks arks-tigmint \
draft=$my_fasta \
reads=$my_reads \
t=16 \
threads=16 \

