#!/bin/bash

#SBATCH -J fastagen
#SBATCH -o /home/eoziolor/phgenome/scripts/fasta/phg_fasta_%j.o
#SBATCH -e /home/eoziolor/phgenome/scripts/fasta/phg_fasta_%j.o
#SBATCH --time=7-00:00
#SBATCH --mem=60000

my_super=/home/eoziolor/program/supernova-2.0.0/supernova
my_out=/home/eoziolor/phgenome/data/assembly3/outs/assembly
my_fasta=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome

$my_super mkoutput \
--asmdir=$my_out \
--outprefix=$my_fasta \
--style=megabubbles \
--headers=full
