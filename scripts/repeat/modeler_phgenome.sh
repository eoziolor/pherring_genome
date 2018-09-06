#!/bin/bash -l

#SBATCH -J ph_model
#SBATCH -o ph_model-%j.o
#SBATCH -e ph_model-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=2-00:00
#SBATCH --no-requeue
#SBATCH -p high
#SBATCH -D /home/eoziolor/phgenome/data/repeat/

source ~/.bashrc

my_model=/home/eoziolor/program/RepeatModeler-open-1.0.11/RepeatModeler
my_db=/home/eoziolor/phgenome/data/repeat/cpallasii
my_olddir=/home/eoziolor/phgenome/data/repeat/RM_27835.WedSep51440122018/

$my_model \
-engine ncbi \
-pa 15 \
-recoverDir $my_olddir \
-database $my_db
