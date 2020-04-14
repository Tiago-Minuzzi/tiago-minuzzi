##Input count table
counttable = read.csv("Count_gte.txt", header = TRUE, row.names = 1, sep = "\t")
head(counttable)

##The dim must has only columns representing the samples
dim(counttable)

##colData creation
condition = c("control","control","diox","diox","formald","formald","tol","tol")
colData = data.frame(row.names=colnames(counttable), treatment=factor(condition, levels=c("control","diox","formald","tol")))
colData                     

##Differential expression analysis
# instalar DESEQ2
source('http://bioconductor.org/biocLite.R')
biocLite('DESeq2')
# carregar as bibliotecas
library('DESeq2')

dataset <- DESeqDataSetFromMatrix(countData = counttable, colData = colData, design = ~treatment)
dataset
dds = DESeq(dataset)
head(dds)
result = results(dds, contrast=c("treatment","diox","control"))
write.table(result, file="bowtie2_DIOX.csv", sep = ",")
result2 = results(dds, contrast=c("treatment","formald","control"))
write.table(result2, file="bowtie2_FORMALD.csv", sep = ",")
result3 = results(dds, contrast=c("treatment","tol","control"))
write.table(result3, file="bowtie2_TOL.csv", sep = ",")
