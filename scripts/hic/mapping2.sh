#!/bin/bash

#SBATCH -J hic_map
#SBATCH -o hic_map_%j.o
#SBATCH -e hic_map_%j.o
#SBATCH --mem=60000
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH -n 23
#SBATCH -p high
#SBATCH --no-requeue

SRA="herring_hic"
LABEL="herring_genome"
BWA="/home/eoziolor/program/bwa-0.7.17/bwa"
SAMTOOLS="/home/eoziolor/program/samtools-1.9/samtools"
IN_DIR="/home/eoziolor/phgenome/data/hic/raw/"
REF="/home/eoziolor/phgenome/data/genome/phgenome_arks_shortid.fasta"
FAIDX="$REF.fai"
RAW_DIR="/home/eoziolor/phgenome/data/hic/align/"
FILT_DIR="/home/eoziolor/phgenome/data/hic/align/filter/"
FILTER="/home/eoziolor/phgenome/scripts/hic/filter_five_end.pl"
COMBINER="/home/eoziolor/phgenome/scripts/hic/two_read_bam_combiner.pl"
STATS="/home/eoziolor/phgenome/scripts/hic/get_stats.pl"
PICARD="/home/eoziolor/program/picard.jar"
TMP_DIR="/home/eoziolor/phgenome/data/hic/temp/"
PAIR_DIR="/home/eoziolor/phgenome/data/hic/pair/"
REP_DIR="/home/eoziolor/phgenome/data/hic/dedup/"
MERGE_DIR="/home/eoziolor/phgenome/data/hic/merged/"
MAPQ_FILTER=30

echo "### Step 0: Check output directories exist & create them as needed"
#[ -d $RAW_DIR ] || mkdir -p $RAW_DIR
#[ -d $FILT_DIR ] || mkdir -p $FILT_DIR
#[ -d $TMP_DIR ] || mkdir -p $TMP_DIR
#[ -d $PAIR_DIR ] || mkdir -p $PAIR_DIR
#[ -d $REP_DIR ] || mkdir -p $REP_DIR
#[ -d $MERGE_DIR ] || mkdir -p $MERGE_DIR

echo "### Step 1.A: FASTQ to BAM (1st)"
#$BWA mem -t 23 -B 8 $REF $IN_DIR/$SRA\_1.fastq.gz | $SAMTOOLS view -Sb - > $RAW_DIR/$SRA\_1.bam

echo "### Step 1.B: FASTQ to BAM (2nd)"
#$BWA mem -t 23 -B 8 $REF $IN_DIR/$SRA\_2.fastq.gz | $SAMTOOLS view -Sb - > $RAW_DIR/$SRA\_2.bam

echo "### Step 2.A: Filter 5' end (1st)"
#$SAMTOOLS view -h $RAW_DIR/$SRA\_1.bam | perl $FILTER | $SAMTOOLS view -Sb - > $FILT_DIR/$SRA\_1.bam

echo "### Step 2.B: Filter 5' end (2nd)"
#$SAMTOOLS view -h $RAW_DIR/$SRA\_2.bam | perl $FILTER | $SAMTOOLS view -Sb - > $FILT_DIR/$SRA\_2.bam

echo "### Step 3A: Pair reads & mapping quality filter"
#perl $COMBINER $FILT_DIR/$SRA\_1.bam $FILT_DIR/$SRA\_2.bam $SAMTOOLS $MAPQ_FILTER | $SAMTOOLS view -bS -t $FAIDX - | $SAMTOOLS sort -o $TMP_DIR/$SRA.bam -

echo "### Step 3.B: Add read group"
#java -Xmx20g -jar $PICARD AddOrReplaceReadGroups INPUT=$TMP_DIR/$SRA.bam OUTPUT=$PAIR_DIR/$SRA.bam ID=$SRA LB=$SRA SM=$LABEL PL=ILLUMINA PU=none

###############################################################################################################################################################
###                                           How to Accommodate Technical Replicates                                                                       ###
### This pipeline is currently built for processing a single sample with one read1 and read2 fastq file.                                                    ###
### Technical replicates (eg. one library split across multiple lanes) should be merged before running the MarkDuplicates command.                          ###
### If this step is run, the names and locations of input files to subsequent steps will need to be modified in order for subsequent steps to run correctly.###          
### The code below is an example of how to merge technical replicates.                                                                                      ###
###############################################################################################################################################################
#	REP_NUM=X #number of the technical replicate set e.g. 1
#	REP_LABEL=$LABEL\_rep$REP_NUM
#	INPUTS_TECH_REPS=('bash' 'array' 'of' 'bams' 'from' 'replicates') #BAM files you want combined as technical replicates
#   example bash array - INPUTS_TECH_REPS=('INPUT=A.L1.bam' 'INPUT=A.L2.bam' 'INPUT=A.L3.bam')
#	java -Xms4G -Xmx4G -jar $PICARD MergeSamFiles $INPUTS_TECH_REPS OUTPUT=$TMP_DIR/$REP_LABEL.bam USE_THREADING=TRUE ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=LENIENT

echo "### Step 4: Mark duplicates"
java -Xms12G -XX:-UseGCOverheadLimit -Xmx12G -jar $PICARD MarkDuplicates INPUT=$PAIR_DIR/$SRA.bam OUTPUT=$REP_DIR/$LABEL.bam METRICS_FILE=$REP_DIR/metrics.$LABEL.txt TMP_DIR=$TMP_DIR ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=LENIENT REMOVE_DUPLICATES=TRUE

$SAMTOOLS index $REP_DIR/$LABEL.bam 

perl $STATS $REP_DIR/$LABEL.bam > $REP_DIR/$LABEL.bam.stats

echo "Finished Mapping Pipeline through Duplicate Removal"
