#!/usr/bin/env python3
import subprocess
import string
import sys
# Input files
ri_fasta=sys.argv[1]
wo_fasta="lin_out.fasta"
# Tool to remove uppercase
table=str.maketrans('','', string.ascii_uppercase)
# Open input fasta and create ouput fasta
with open(ri_fasta, "r") as f, open(wo_fasta, "w") as output:
    for line in f:
        if line[:1] == ">":
            output.write('\n' + line)
        else:
            output.write(line.strip())
    # Remove blank lines
    subprocess.call(["sed -i '/^$/d' lin_out.fasta"], shell=True)
# Open output file
with open(wo_fasta, "r") as output:
    ids=[]
    seqs=[]
    for line in output:
        if line.startswith('>'):
            ids.append(line.strip())
        else:
            seqs.append(line.translate(table).strip().upper())
    # Join lists
    masked=zip(ids,seqs)
    # Print only masked substrings of sequences
    for m in masked:
        if m[1] != '':
            print(m[0]+'\n'+m[1])