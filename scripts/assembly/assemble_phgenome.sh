#!/bin/bash -l

#SBATCH -J phgenome_assembly
#SBATCH -D /home/eoziolor/phgenome/data/raw/
#SBATCH -o /home/eoziolor/phgenome/scripts/assembly/ph_assembly-%j.o
#SBATCH -e /home/eoziolor/phgenome/scripts/assembly/ph_assembly-%j.o
#SBATCH -N 4
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=7-00:00

#files
my_supernova=/home/eoziolor/program/supernova/supernova-1.2.2/supernova
my_dir=/home/eoziolor/phgenome/data/raw/

#code
$my_supernova run \
--id phgenome1 \
--fastqs $my_dir \
--localcores 92 \
--localmem 240000
