#!/bin/bash

#SBATCH -J hic_juice_filter
#SBATCH -o hic_juice_filter_%j.o
#SBATCH -e hic_juice_filter_%j.o
#SBATCH --mem=60000
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

#files and programs
BWA="/home/eoziolor/program/bwa-0.7.17/bwa"
SAMTOOLS="/home/eoziolor/program/samtools-1.9/samtools"
SAMBLASTER="/home/eoziolor/program/samblaster/samblaster"
hic1="/home/eoziolor/phgenome/data/hic_juice/ph_hic_R1.fq.gz"
hic2="/home/eoziolor/phgenome/data/hic_juice/ph_hic_R2.fq.gz"
REF="/home/eoziolor/phgenome/data/genome/phgenome_ncbi.fasta"
align_dir="/home/eoziolor/phgenome/data/hic_juice/align"
my_out="ph_hic_aligned.bam"
my_mat="/home/eoziolor/program/matlock/bin/matlock"
my_qc_file="ph_filt_qc"
my_filt="ph_hic_filtered.bam"
my_qc="/home/eoziolor/program/bam_to_mate_hist/bam_to_mate_hist.py"


#alignment and deduplication
#$BWA mem -t 22 -5SP $REF $hic1 $hic2 | $SAMBLASTER | samtools view -S -h -b -F 2316 > $align_dir/$my_out &&

#filtering of aligned reads
#$my_mat bamfilt -i $align_dir/$my_out -o $align_dir/$my_filt 

#QC of aligned reads
$my_qc -b $align_dir/$my_filt -r -o $my_qc_file
