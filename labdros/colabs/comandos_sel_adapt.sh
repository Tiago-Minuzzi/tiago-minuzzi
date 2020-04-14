# Selecionar linhas com o adaptador
grep CACTCTT 161_161_mos5_mhit_filter_scov.tsv > 161_161_mos5_adapter.tsv
# Selecionar linhas sem o adaptador
grep -v CACTCTT 161_161_mos5_mhit_filter_scov.tsv > 161_161_mos5_no_adapter.tsv
#pegar ids
cut -f1 161_161_mos5_adapter.tsv > ids1.txt 
cut -f2 161_161_mos5_adapter.tsv > ids2.txt 
cat ids1.txt ids2.txt | sort | uniq > ids_adapter.txt && rm ids1.txt ids2.txt
# Pegar sequencias com adaptador
grep -A1 -f ids_adapter.txt 161_mos5_trimmanual.fa | sed '/^--$/d' > 161_mos5_adapter_seqs.fa
