#!/bin/bash

#SBATCH -J hic_map
#SBATCH -o hic_map_%j.o
#SBATCH -e hic_map_%j.o
#SBATCH --mem=60000
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p high
#SBATCH --no-requeue

SRA="herring_hic"
LABEL="herring_genome"
BWA="/home/eoziolor/program/bwa-0.7.17/bwa"
SAMTOOLS="/home/eoziolor/program/samtools-1.9/samtools"
IN_DIR="/home/eoziolor/phgenome/data/hic/raw/"
REF="/home/eoziolor/phgenome/genome/phgenome_arks_shortid.fasta"
FAIDX="$REF.fai"
RAW_DIR="/home/eoziolor/phgenome/hic/align/"
FILT_DIR="/home/eoziolor/phgenome/hic/align/filter/"
FILTER="/home/eoziolor/phgenome/scripts/hic/filter_five_end.pl"
COMBINER="/home/eoziolor/phgenome/scripts/hic/two_read_bam_combiner.pl"
STATS="/home/eoziolor/phgenome/scripts/hic/get_stats.pl"
PICARD="/home/eoziolor/program/picard.jar"
TMP_DIR="/home/eoziolor/phgenome/data/hic/temp/"
PAIR_DIR="/home/eoziolor/phgenome/data/hic/pair/"
REP_DIR="/home/eoziolor/phgenome/data/hic/dedup/"
MERGE_DIR="/home/eoziolor/phgenome/data/hic/merged/"
MAPQ_FILTER=10

echo "### Step 0: Check output directories exist & create them as needed"
[ -d $RAW_DIR ] || mkdir -p $RAW_DIR
[ -d $FILT_DIR ] || mkdir -p $FILT_DIR
[ -d $TMP_DIR ] || mkdir -p $TMP_DIR
[ -d $PAIR_DIR ] || mkdir -p $PAIR_DIR
[ -d $REP_DIR ] || mkdir -p $REP_DIR
[ -d $MERGE_DIR ] || mkdir -p $MERGE_DIR


