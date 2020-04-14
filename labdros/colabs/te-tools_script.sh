#!/bin/bash
# Edited by Tiago Minuzzi. January, 2020.
# Master paths
DANIP="/media/labdros/labdros1tb/Daniela"
TETOOLS="/home/labdros/software/tetools-master"
# Essential files
ROSETTE="$DANIP/rosette.txt"
TE_FASTA="$DANIP/flybase_6.30.fasta"
# FastQ File paths
FQ_01="$DANIP/Chip1/split2/1C_split2.fq"
FQ_02="$DANIP/Chip1/split2/1C_split2_dup.fq"
FQ_03="$DANIP/Chip1/split2/1_50_split2.fq"
FQ_04="$DANIP/Chip1/split2/4_50_split2.fq"
FQ_05="$DANIP/Chip1/split2/1_100_split2.fq"
FQ_06="$DANIP/Chip1/split2/2_100_split2.fq"
# TE output
COUNT_FILE="Chip1_TEcount_out.txt"
HTML_FILE="$DANIP/Chip1/result_diff.html"
DIFF_OUTDIR="$DANIP/Chip1/"

# TE count
python3 $TETOOLS/TEcount.py -bowtie2 -rosette $ROSETTE -column 1 -TE_fasta $TE_FASTA -count $COUNT_FILE -RNA $FQ_01 $FQ_02 $FQ_03 $FQ_04 $FQ_05 $FQ_06
# TE diff
Rscript $TETOOLS/TEdiff.R --args --FDR_level=0.05 --count_coulumn=1 --count_file=\"$COUNT_FILE\" --experiment_formula=\"Treatment:Replicate\" --sample_names=\"Control:Rep1,Control:Rep2,50:Rep1,50:Rep2,100:Rep1,100:Rep2\" --outdir=\"$DIFF_OUTDIR\" --htmlfile=\"$HTML_FILE\"

echo "Done! :)"
