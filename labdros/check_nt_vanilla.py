#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# By Tiago Minuzzi
# Recupera as sequências desejadas a partir de uma lista de IDs
# Uso: python3 check_nt_vanilla.py input.fasta > output.fasta
import sys

# Input file
seqri = sys.argv[1]
# Creates dictionary
seqs_by_ids = {}
# Nucleotides list
nts = ['A','C','G','T']
# Desire length
seqLen = 6

# Read file and add to dictionary
with open(seqri, 'r+') as read_file:
    for line in read_file.readlines():
        if line.startswith('>'):
            current_key = line[1:].strip()
            # Adiciona os IDs ao dicionário. dict[key] = value
            seqs_by_ids[current_key] = ''
        else:
            # Adiciona as sequências ao dicionário.
            seqs_by_ids[current_key] += line.upper().strip()

# Check if at least one of each nucleotide is in sequence and length
for i,s in seqs_by_ids.items():
    if all(nt in s for nt in nts):
        if len(s) > seqLen:
            print(f'>{i}')
            print(s)
