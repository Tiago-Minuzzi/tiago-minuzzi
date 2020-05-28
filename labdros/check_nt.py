#!/usr/bin/env python3
# Created by Tiago Minuzzi
# Nucleotide checking
# Usage python3 check_nt.py input.fasta > output.fasta

from Bio import SeqIO
import sys
nts = ['A','C','G','T']
with open(sys.argv[1], 'r+') as fasta:
    for seq_record in SeqIO.parse(fasta, 'fasta'):
    	seq_record.seq=seq_record.seq.upper()
    	if all(nt in seq_record.seq for nt in nts):
	    	print(f'>{seq_record.id}')
	    	print(f'{seq_record.seq}')
