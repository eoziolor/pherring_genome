#!/bin/bash -l

#SBATCH -J seq_consensus
#SBATCH -e seq_consensus-%j.o
#SBATCH -o seq_consensus-%j.o
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -t 06-00:00
#SBATCH --mem=60000
#SBATCH -p high
#SBATCH --no-requeue

module load bio3

#program
my_sam=/home/eoziolor/program/samtools-1.9/samtools

#files
my_gen=/home/eoziolor/phgenome/data/genome/phgenome_masked_nocomma.fasta
my_align=/home/eoziolor/phgenome/data/align/aligned_ss.bam
my_out=/home/eoziolor/phgenome/data/align/consensus_ss.fq.gz

#code
$my_sam mpileup -C50 -uf $my_gen $my_align |\
bcftools call -c - |\
vcfutils.pl vcf2fq -d 10 -D 100 |\
gzip > $my_out
