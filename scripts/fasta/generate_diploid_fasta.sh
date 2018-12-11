#!/bin/bash

#SBATCH -J diploid_fastagen
#SBATCH -o diploid_fastagen_%j.o
#SBATCH -e diploid_fastagen_%j.o
#SBATCH --time=6-00:00
#SBATCH --mem=60000
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue


my_super=/home/eoziolor/program/supernova-2.0.0/supernova
my_out=/home/eoziolor/phgenome/data/assembly3/outs/assembly
my_fasta=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome_diploid

$my_super mkoutput \
--asmdir=$my_out \
--outprefix=$my_fasta \
--style=pseudohap2 \
--minsize=1000 \
--headers=short
