# Edit blastn output

grep "# 1 hits found" -A1 $1 | sed '/^--$/d;/^#/d'

sed '/# 1 hits found/,+1 d;/^# /d'

sed '1i qid\tsid\tpiden\tlen\tqlen\tslen\tevalue\tbitscore\tqcovhsp\tqseq\tsseq'
