#!/bin/bash

#SBATCH -J arks_index
#SBATCH -o arks_index_%j.o
#SBATCH -e arks_index_%j.o
#SBATCH --mem=60000
#SBATCH -D /home/eoziolor/phgenome/data/genome/
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1

my_bwa=/home/eoziolor/program/bwa-0.7.16a/bwa
my_genome=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid.fasta

$my_bwa index $my_genome
