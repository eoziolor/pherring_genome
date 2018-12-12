#!/bin/bash -l

#SBATCH -J boot_psmc
#SBATCH --array=1-100
#SBATCH -e boot_psmc%A-%a.o
#SBATCH -o boot_psmc%A-%a.o
#SBATCH -t 01-00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH -p med
#SBATCH --no-requeue

cd ~/phgenome/data/psmc/bootstrap/

#files and programs
crap=$(echo $SLURM_ARRAY_TASK_ID)
my_psmc=/home/eoziolor/program/psmc/psmc
my_dir=/home/eoziolor/phgenome/data/psmc/bootstrap

#code
$my_psmc -N25 -t15 -r5 -b -p "4+25*2+4+6" \
-o $my_dir/round-$crap.psmc $my_dir/diploid.psmcfa
