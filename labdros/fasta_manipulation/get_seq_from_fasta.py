#!/usr/bin/python
# -*- coding: utf-8 -*-
# By Tiago Minuzzi
# Recupera as sequências desejadas a partir de uma lista de IDs
# Uso: ./argv_get_seq_from_fasta seqs.fasta id_list.txt

# Cria um dicionário
seqs_by_ids = {}
# Recebe input do terminal
seqri = raw_input('Sequences file: ')
idri = raw_input('ID file: ')
# Lê arquivos desejados
with open(seqri, 'r') as read_file:
    for line in read_file.readlines():
        if line.startswith('>'):
            current_key = line[1:].strip()
            # Adiciona os IDs ao dicionário. dict[key] = value
            seqs_by_ids[current_key] = ''
        else:
            # Adiciona as sequências ao dicionário.
            seqs_by_ids[current_key] += line.strip()

# Lê arquivo de IDs como um conjunto (set())
ids = set([line.strip() for line in open(idri).readlines()])
for id in ids:
    if id in seqs_by_ids:
        print '>'+id # printa os IDs
        # O '{}'.format() é outra forma de formatar strings
        # tal qual o '%s'%('value')
        print('{}'.format(seqs_by_ids[id])) # printa as sequências
