#!/bin/bash -l

#SBATCH -J run_maker
#SBATCH -o run_maker-%j.o
#SBATCH -e run_maker-%j.o
#SBATCH -N 1
#SBATCH -n 23
#SBATCH --time=6-00:00
#SBATCH --mem=60000
#SBATCH --no-requeue
#SBATCH -p high

cd /home/eoziolor/phgenome/data/maker

export TMP=/home/eoziolor/phgenome/data/maker/tmp

module load maker

maker -q
