#!/bin/bash -l

#SBATCH -J phgenome_assembly
#SBATCH -A millermrgrp
#SBATCH -D /home/eoziolor/phgenome/data/raw/
#SBATCH -o /home/eoziolor/phgenome/scripts/assembly/ph_assembly-%j.o
#SBATCH -e /home/eoziolor/phgenome/scripts/assembly/ph_assembly-%j.o
#SBATCH -p bigmemh
#SBATCH -t 5
#SBATCH -n 28
#SBATCH --mem=450G
#SBATCH --time=7-00:00

#files
my_supernova=/home/eoziolor/program/supernova/supernova-1.2.2/supernova
my_dir=/home/eoziolor/phgenome/data/raw/

#code
$my_supernova run \
--id phgenome1 \
--fastqs $my_dir \
--localcores=28
