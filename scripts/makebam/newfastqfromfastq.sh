#!/bin/bash -l
#SBATCH -J fastqbasic
#SBATCH -o fastqbasic-%j.o
#SBATCH -e fastqbasic-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=2-00:00
#SBATCH --mem=60000
#SBATCH --no-requeue
#SBATCH -p high

#programs and files
long=/home/eoziolor/program/longranger-2.2.2/longranger
path=/home/eoziolor/phgenome/data/raw/
id=NewFastq

cd /home/eoziolor/phgenome/data/raw/
#code
$long basic \
--id=$id \
--fastqs=$path
