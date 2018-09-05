#!/bin/bash -l

#SBATCH -J ph_masker
#SBATCH -o ph_masker-%j.o
#SBATCH -e ph_masker-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

source ~/.bashrc

my_masker=/home/eoziolor/program/RepeatMasker/RepeatMasker
my_genome=/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid.fasta
my_out=/home/eoziolor/phgenome/data/genome/

$my_masker \
-s \
-species "Clupea pallasii" \
-nolow \
-div $my_out \
$my_genome
