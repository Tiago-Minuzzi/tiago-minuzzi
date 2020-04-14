# instalar DESEQ2
source('http://bioconductor.org/biocLite.R')
biocLite('DESeq2')
# carregar as bibliotecas
library('DESeq2')
library('RColorBrewer')
# counts para dataframe
sampleNames <- c('1C', '1C_dup', '50', '4_50', '1_100', '2_100')
filePath = '/media/labdros/labdros2tb/Daniela/Chip1_TEcount_out.txt'
countData = read.table(file = filePath, header = FALSE, row.names = 1, sep = '\t')
dim(countData)  #view number of rows and columns
# dataframe com tratamentos
condition <- c('Control', 'Control', '50', '50', '100', '100')  #vector of column names for the data frame
colData <- data.frame(row.names=colnames(countData), condition=factor(condition, levels=c('Control','50','100')))
colData
## rodar DESEQ2
# rodar dataframe no deseq
dataset <- DESeqDataSetFromMatrix(countData = countData,
                                  colData = colData,
                                  design = ~condition)
#comparar os tratamentos
dds <- DESeq(dataset)
# result 50
result_50 <- results(dds, contrast=c('condition','Control','50'))
result_50 <- result[complete.cases(result_50),]  #remove any rows with NA
head(result_50)
# ver resumo dos resultados
summary(result_50)
# result 100
result_100 <- results(dds, contrast=c('condition','Control','100'))
result_100 <- result[complete.cases(result_100),]  #remove any rows with NA
head(result_100)
# ver resumo dos resultados
summary(result_100)
# top50 up e down pelo valor de p 50
n = 50
resOrdered <- result_50[order(result_50$padj),]
topResults <- rbind( resOrdered[ resOrdered[,'log2FoldChange'] > 0, ][1:n,], 
                     resOrdered[ resOrdered[,'log2FoldChange'] < 0, ][n:1,] )
topResults[c(1:5,(2*n-4):(2*n)), c('baseMean','log2FoldChange','padj')]
# top50 up e down pelo valor de p 100
n = 50
resOrdered <- result_50[order(result_100$padj),]
topResults <- rbind( resOrdered[ resOrdered[,'log2FoldChange'] > 0, ][1:n,], 
                     resOrdered[ resOrdered[,'log2FoldChange'] < 0, ][n:1,] )
topResults[c(1:5,(2*n-4):(2*n)), c('baseMean','log2FoldChange','padj')]
#Plot log fold change vs. mean expression for all genes, with genes where p < 0.1 colored red:
plotMA(result_50, main='DESeq2: D. melanogaster Control vs. 50', ylim=c(-2,2))
#Plot log fold change vs. mean expression for all genes, with genes where p < 0.1 colored red:
plotMA(result_100, main='DESeq2: D. melanogaster Control vs. 100', ylim=c(-2,2))
#PCA
rld <- rlogTransformation(dds, blind=TRUE)
plotPCA(rld)
#Plot counts for a single gene. Below is the plot for the gene with the lowest p-value:
plotCounts(dds, gene=which.min(result$padj), intgroup='condition', pch = 19)
#Display top genes’ normalized counts in a heatmap:
hmcol <- brewer.pal(11,'RdBu')
nCounts <- counts(dds, normalized=TRUE)
heatmap(as.matrix(nCounts[ row.names(topResults), ]), Rowv = NA, col = hmcol, mar = c(8,2))
#DONE :)