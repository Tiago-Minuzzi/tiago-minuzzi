import sys

# Input file
seqri=sys.argv[1]
# List of adapters
adapters = [
"cactctttccctacacgacgtcttccgatctaattctggaccatagtgcaatgt",
"cactctttccctacacgacgctcttccgacctcattcccaccctcttccg",
"cactctttccctacacgacgctcttccgatttcattcttcccc",
"cactctttccctacacgcgctcttccgatctaattcggcgg",
"cactctttccctacacgacgctcttccggatctaattca",
"cactctttccctacacgcgctcttccgatctaattcgg",
"cactctttccctacacgacgctcttccggatctagctt",
"cactctttccctacacgacgctcttccggatctaattc",
"cactctttccctacacgacgctcttccgattttatttc",
"cactctttccctacacgacgctcttccgacctcattcc",
"cactctttccctacacgacgctcttccgaatctaatta",
"cactctttccctacacgcgctcttccgatctaattcg",
"cactctttccctacacgacgctcttccggatctaatt",
"cactctttccctacacgacgctcttccgatttcattc",
"cactctttccctacacgacgctcttccgaatctaatt",
"cactctttccctacacgacgctttccgatctaattc",
"cactctttccctacacgacgctcttccgatttagct",
"cactctttccctacacgacgctcttccgatccaatt",
"cactctttccctacacgacgctcttccgaatctagc",
"cactctttccctacacgcgctcttccgatctagct",
"cactctttccctacacgacgctcttccgatttagc",
"cactctttccctacacgacgctcttccgaatctag",
"cactctttccctacacgacgctcttccggttcta",
"cactctttccctacacgacgctcttccggatcta",
"cactctttccctacacgacgctcttccgaatcta",
"cactctttccctaccgacgctcttccgatcta",
"cactctttccctacacgcgctcttccgatcta",
"cactctttccctacacgacgctttccgatcta",
"cactctttccctacacgacgctcttccgatc",
"cactctttccctacacgacgctcttccg",
"cactctttccctacacgacg"
]
# Create list to store ids and sequences
ids=[]
seqs=[]
# Sequences in input fasta must be linearized
with open(seqri, 'r+') as fasta:
    for line in fasta.readlines():
        if line.startswith('>'):
            ids.append(line.strip())
        else:
            seqs.append(line.strip())
    conj=zip(ids,seqs)
# Remove adapters
for valor in conj:
    pv=valor[0]
    nv=valor[1]
    for adapter in adapters:
        if adapter in valor[1]:            
            nv=nv.replace(adapter,"")
        else:
            nv=nv
    print(pv+"\n"+nv)
