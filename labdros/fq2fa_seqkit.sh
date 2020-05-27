#!/usr/bin/env bash
# Run seqkit fq2fa in multiple files
for ARQ in ./*.fq;do
	~/softwares/seqkit fq2fa $ARQ -o `echo $ARQ | sed 's/\(.*\.\)fq/\1fasta/'`
done
