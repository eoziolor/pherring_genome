#!/bin/bash -l

#SBATCH -J busco_all_met
#SBATCH -o busco_all_met-%j.o
#SBATCH -e busco_all_met-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=1-00:00
#SBATCH --no-requeue
#SBATCH -p high
#SBATCH -D /home/eoziolor/phgenome/data/transcriptome/

module load busco
module load python3
module load bio3
export AUGUSTUS_CONFIG_PATH=/home/eoziolor/phgenome/data/busco/config/

my_run=/share/apps/busco-v2/BUSCO.py
my_lineage=/home/eoziolor/phgenome/data/busco/metazoa_odb9
my_genome=/home/eoziolor/phgenome/data/transcriptome/all.hq.new.fasta
my_out=busco_all_met


python $my_run \
-i $my_genome \
-o $my_out \
-l $my_lineage \
-m transcriptome \
-c 16 \
-sp zebrafish
