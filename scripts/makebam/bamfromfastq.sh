#!/bin/bash -l
#SBATCH -J longbasic
#SBATCH -o longbasic-%j.o
#SBATCH -e longbasic-%j.o
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --time=1-00:00
#SBATCH --mem=60000

#programs and files
long=/home/eoziolor/program/longranger-2.2.2/longranger
path=/home/eoziolor/phgenome/data/raw/
id=PH-Sitka-93_S1_L008

cd /home/eoziolor/phgenome/data/raw/
#code
$long basic \
--id=$id \
--fastqs=$path \
--bam
