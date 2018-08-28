#!/bin/bash -l

#SBATCH -J arks_busco
#SBATCH -o arks_busco-%j.o
#SBATCH -e arks_busco-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=2-00:00
#SBATCH --no-requeue
#SBATCH -p high
#SBATCH -D /home/eoziolor/phgenome/data/busco/

module load busco
module load python3
export AUGUSTUS_CONFIG_PATH=/home/eoziolor/phgenome/data/busco/config/

my_run=/share/apps/busco-v2/BUSCO.py
my_lineage=/home/eoziolor/phgenome/data/busco/actinopterygii_odb9
my_genome=/home/eoziolor/phgenome/data/genome/phgenome_arks.fasta
my_out=arks_busco_actino


python $my_run \
-i $my_genome \
-o $my_out \
-l $my_lineage \
-m genome \
-c 16 \
-sp zebrafish
