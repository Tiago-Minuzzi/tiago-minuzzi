#!/usr/bin/env python
# -*- coding: utf-8 -*-

print 'Hello, good friend!' + '\n'
print '-> If your file is in the same directory as the script, just type the name of the file.'
print "-> If it is not, type the full path to your file."
print '-> e.g.: file.txt or /home/user/file.txt' + '\n'

f = raw_input('Type file name or path: ')
file = open(f, 'r')


newfile = raw_input('Type new file name or path: ')
nf = open(newfile, 'w')

x = y = 0
for line in file:
	
	if '>' in line:
		line = line.replace(' ', '_')
		if x > 0:
			nf.writelines('\n')
		nf.writelines('%s\n'%line.strip())
		y+=1
	
	else:
		nf.writelines('%s'%line.strip())

	x+=1
nf.close()

print "nº de linhas: %s"%y
