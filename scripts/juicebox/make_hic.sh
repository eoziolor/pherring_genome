#!/bin/bash -l

#SBATCH -J create-hic
#SBATCH -e create-hic-%j.o
#SBATCH -o create-hic-%j.o
#SBATCH -t 6-00:00
#SBATCH -n 23
#SBATCH --mem=60000
#SBATCH -p high
#SBATCH --no-requeue

source ~/.bashrc

#program
my_run=/home/eoziolor/program/3d-dna/visualize/run-assembly-visualizer.sh

#files
my_dir=/home/eoziolor/phgenome/data/hic_juice/align/
my_ass="ph_supernova.assembly"
my_links="ph_super_ordered.links"
#my_out="ph_supernova.hic"

cd $my_dir

$my_run -p false $my_ass $my_links
