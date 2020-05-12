#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Usage:
# python joinseq_3.1 input.fasta output.fasta

import sys

# Input file
infasta = open(sys.argv[1], 'r')
# Output file
with open(sys.argv[2], 'w') as nf:
# Linearize sequences
	x = y = 0
	for line in infasta:
		if '>' in line:
			line = line.replace(' ', '_')
			if x > 0:
				nf.writelines('\n')
			nf.writelines('%s\n'%line.strip())
			y+=1
		else:
			nf.writelines('%s'%line.strip())
		x+=1
# print number of sequences
print "nº of sequences: %s"%y
