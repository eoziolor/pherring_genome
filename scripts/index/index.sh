#!/bin/bash

#SBATCH -J index_genome
#SBATCH -o index_%j.o
#SBATCH -e index_%j.o
#SBATCH --mem=60000
#SBATCH -D /home/eoziolor/phgenome/data/assembly3/fasta/
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1

my_bwa=/home/eoziolor/program/bwa-0.7.16a/bwa
my_genome=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome.fasta.bgz

$my_bwa index $my_genome
