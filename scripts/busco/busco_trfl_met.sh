#!/bin/bash -l

#SBATCH -J arks_busco_flnc_met
#SBATCH -o arks_busco_flnc_met-%j.o
#SBATCH -e arks_busco_flnc_met-%j.o
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
my_genome=/home/eoziolor/phgenome/data/transcriptome/flnc_new.fasta
my_out=arks_busco_flnc_met


python $my_run \
-i $my_genome \
-o $my_out \
-l $my_lineage \
-m transcriptome \
-c 16 \
-sp zebrafish
