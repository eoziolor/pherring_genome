#!/bin/bash -l

#SBATCH -J convert_fasta_agp
#SBATCH -e convert_fasta_agp-%j.o
#SBATCH -o convert_fasta_agp-%j.o
#SBATCH -t 6-00:00
#SBATCH -n 23
#SBATCH --mem=60000
#SBATCH -p high
#SBATCH --no-requeue

source ~/.bashrc

#files
my_ref=/home/eoziolor/phgenome/data/assembly3/fasta/phgenome.hap.fa
my_out=/home/eoziolor/phgenome/data/hic_juice/align
my_agp="ph_supernova.agp"
my_assembly="ph_supernova.assembly"

#program
my_conv=/home/eoziolor/program/juicebox_scripts/juicebox_scripts/makeAgpFromFasta.py
my_conv2=/home/eoziolor/program/juicebox_scripts/juicebox_scripts/agp2assembly.py

#python $my_conv $my_ref $my_out/$my_agp &&

python $my_conv2 $my_out/$my_agp $my_out/$my_assembly
