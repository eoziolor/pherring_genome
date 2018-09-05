#!/bin/bash -l

#SBATCH -J ph_db
#SBATCH -o ph_db-%j.o
#SBATCH -e ph_db-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high
#SBATCH -D /home/eoziolor/phgenome/data/repeat/

source ~/.bashrc

my_db=/home/eoziolor/program/RepeatModeler-open-1.0.11/BuildDatabase
my_phgenome=/home/eoziolor/phgenome/data/genome/phgenome_arks_masked.fasta

$my_db \
-name cpallasii \
-engine ncbi \
$my_phgenome
