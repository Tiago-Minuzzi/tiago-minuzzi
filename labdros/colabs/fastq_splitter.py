# Created by Tiago Minuzzi. January 2020

from fastqandfurious import fastqandfurious
from fastqandfurious.fastqandfurious import entryfunc
import sys

bufsize = 20000
with open(sys.argv[1], "rb") as fh:
    it = fastqandfurious.readfastq_iter(fh, bufsize, entryfunc)
    for record in it:
        id = str(record[0].decode('UTF-8'))
        seq = str(record[1].decode('UTF-8'))
        qual = str(record[2].decode('UTF-8'))
        if len(seq) >= 150:
            s1, s2 = seq[:len(seq)//2], seq[len(seq)//2:]
            q1, q2 = qual[:len(qual)//2], qual[len(qual)//2:]
            # print(f"@{id}\n{seq}\n+\n{qual}")
            print(f"@{id+'.1'}\n{s1}\n+\n{q1}")
            print(f"@{id+'.2'}\n{s2}\n+\n{q2}")
        else:
            print(f"@{id}\n{seq}\n+\n{qual}")
