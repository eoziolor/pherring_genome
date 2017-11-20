#!/bin/bash -l

#SBATCH -J phgenome_trim
#SBATCH -o phgenome_trim-%j.output
#SBATCH -e phgenome_trim-%j.output
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=60000

module load java

#programs and files
my_trim=/home/eoziolor/program/Trimmomatic-0.36/trimmomatic-0.36.jar
my_forward=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R1_001.fastq.gz
my_reverse=/home/eoziolor/phgenome/data/raw/PH-Sitka-93_S1_L008_R2_001.fastq.gz
out_forward_paired=/home/eoziolor/phgenome/data/trim/PH_forward_paired.fastq.gz
out_reverse_paired=/home/eoziolor/phgenome/data/trim/PH_reverse_paired.fastq.gz
out_forward_unpaired=/home/eoziolor/phgenome/data/trim/PH_forward_unpaired.fastq.gz
out_reverse_unpaired=/home/eoziolor/phgenome/data/trim/PH_reverse_unpaired.fastq.gz
my_adapters=/home/eoziolor/program/Trimmomatic-0.36/adapters/ph_adapters

#code

java -jar $my_trim PE \
-phred33 \
$my_forward \
$my_reverse \
$out_forward_paired \
$out_forward_unpaired \
$out_reverse_paired \
$out_reverse_unpaired \
ILLUMINACLIP:$my_adapters.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 HEADCROP:9
