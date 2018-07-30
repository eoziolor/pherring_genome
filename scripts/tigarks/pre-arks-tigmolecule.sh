#!/bin/bash -l

#SBATCH -J molecule
#SBATCH -o molecule-%j.o
#SBATCH -e molecule-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high

module load bio3

cd /home/eoziolor/phgenome/data/tigarks/arks1/

#files
my_bam=supernova.barcoded.sortbx.bam
my_reads=barcoded
my_tigm=/home/eoziolor/program/tigmint/bin/tigmint-molecule

#code
$my_tigm $my_bam | sort -k1,1 -k2,2n -k3,3n >supernova.reads.molecule.bed

