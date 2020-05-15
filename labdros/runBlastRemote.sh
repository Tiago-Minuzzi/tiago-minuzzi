blastn -query $1 -db nt -max_target_seqs 5 -max_hsps 5 -outfmt "7 qseqid qlen stitle sacc slen length qcovhsp evalue bitscore" -out $2.csv -remote
