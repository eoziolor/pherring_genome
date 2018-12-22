#!/bin/bash -l

#SBATCH -J assemble-3ddna
#SBATCH -e assemble-3ddna-%j.o
#SBATCH -o assemble-3ddna-%j.o
#SBATCH -t 6-00:00
#SBATCH -n 23
#SBATCH --mem=60000
#SBATCH -p high
#SBATCH --no-requeue

source ~/.bashrc

my_ref=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome.hap.fa
my_mnd=/home/eoziolor/phgenome/data/hic_juice/align/ph_super_ordered.links
my_out=/home/eoziolor/phgenome/data/hic_juice/assembly/

cd $my_out

run-asm-pipeline.sh \
-i 1000 \
$my_ref $my_mnd
