#!/bin/bash -l

#SBATCH -J bamcreate
#SBATCH -o bamcreate-%j.o
#SBATCH -e bamcreate-%j.o
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=60000
#SBATCH --time=2-00:00
#SBATCH --no-requeue
#SBATCH -p high

module load python3
source ~/.bashrc

cd /home/eoziolor/phgenome/data/tigarks/arks1/

#files
my_fasta=supernova
my_reads=barcoded

#code
bwa mem -t16 -pC supernova.fa barcoded.fq.gz |\
samtools view -u -F4 |\
samtools sort -@16 -tBX \
-o supernova.barcoded.sortbx.bam
