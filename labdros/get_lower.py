import string
import sys

seqri=sys.argv[1]
table=str.maketrans('','', string.ascii_uppercase)

ids=[]
seqs=[]

with open(seqri, 'r+') as fasta:
    for line in fasta:
        if line.startswith('>'):
            ids.append(line.strip())
        else:
            seqs.append(line.translate(table).strip().upper())
    conj=zip(ids,seqs)

for c in conj:
	if c[1] != '':
		print(c[0]+'\n'+c[1])