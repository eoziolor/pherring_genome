#!/bin/bash -l

#SBATCH -J combo_trimalign
#SBATCH -e combo_trimalign-%j.o
#SBATCH -o combo_trimalign-%j.o
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -t 06-00:00
#SBATCH --mem=60000
#SBATCH -p high
#SBATCH --no-requeue

module load bio3

#Directory and file assignment for each file and program
my_dir=/home/eoziolor/phgenome/data/raw
fq1=$my_dir/PH-Sitka-93_S1_L008_R1_001.fastq.gz
fq2=$my_dir/PH-Sitka-93_S1_L008_R2_001.fastq.gz
my_bwa=/home/eoziolor/program/bwa-0.7.17/bwa
my_sbl=/home/eoziolor/program/samblaster/samblaster
my_sam=/home/eoziolor/program/samtools-1.9/samtools
my_out=/home/eoziolor/phgenome/align/
my_gen=/home/eoziolor/phgenome/data/genome/phgenome_masked.fasta
rg=$(echo \@RG\\tID:pws-og\\tPL:Illumina\\tPU:x\\tLB:combined\\tSM:pws-og)
outroot=aligned_pws_og.bam

#Code
paste <(zcat $fq1 | paste - - - -) \
      <(zcat $fq2 | paste - - - -) |\
tr '\t' '\n' |\
cutadapt -j 22 --interleaved -a CTGTCTCTTATA -A CTGTCTCTTATA -u 10 -U 10 -q 30 --trim-n --minimum-length 36 - |\
$my_bwa mem $my_gen -p -R $rg -t 22 - |\
$my_sam view -S -h -u - | \
$my_sam sort -T $my_out/$outroot > $my_out/$outroot

