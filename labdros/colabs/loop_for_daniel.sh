#!/bin/bash


fasta="/home/labdros/Área de Trabalho/daniel/fasta"
fqdir="/home/labdros/Área de Trabalho/daniel"
indexes="/home/labdros/Área de Trabalho/daniel/indexes"
OUTPUT="/home/labdros/Área de Trabalho/daniel/output"

ref="/home/labdros/Área de Trabalho/daniel/lambda_virus.fa"

# BOWTIE2
bowtie2-build "$ref" "$indexes"/teste_lambda
# Loop to read paired-end files
for R1 in "$fqdir"/*_R1.fastq; do
    R2=${R1/_R1/_R2}
    if [[ -f $R2 ]] ; then
        bowtie2 -x "$indexes"/teste_lambda -1 "$R1" -2 "$R2" -S "${R1/_*/}"_output.sam
        mv *.sam "$OUTPUT"
    else
        echo "$R2 not found" >&2
    fi
done

# SAMTOOLS
echo -e "Samtools running..."
# Sam to Bam
for SAMF in "$OUTPUT/"*_output.sam; do
	samtools view -bS "$SAMF" > "${SAMF/_*/}"_output.bam
done
# Get singletons
for BAMF in "$OUTPUT/"*_output.bam; do
	samtools flagstat "$BAMF" > "${BAMF/_*/}"_flagstat.txt

	samtools view -b -h -f 8 -F 4 "$BAMF" > "${BAMF/_*/}"_singletons_output.bam
done
# Bam to FastQ
for BAM2 in "$OUTPUT/"*_singletons_output.bam; do
	samtools bam2fq "$BAM2" > "${BAM2/_*/}"_singletons.fastq
done
# Echo message if fastq files exists
if [[ -f "${BAM2/_*/}"_singletons.fastq ]]; then
	echo -e "singletons.fastq successfully created"
fi

# SEQTK
for FQ in "$OUTPUT/"*_singletons.fastq; do
	seqtk seq -a "$FQ" > "${FQ/_*/}"_singletons.fasta
done

`cd "$OUTPUT" && mv *.fasta "$fasta"`