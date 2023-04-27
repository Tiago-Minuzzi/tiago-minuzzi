#descobrir versao do R
R.Version()

##Instalar pacotes bioconductor
#versao antiga (< 3.5.0)
source("http://bioconductor.org/biocLite.R")
biocLite("IRanges")

source("http://bioconductor.org/biocLite.R")
biocLite("GenomicFeatures")

source("http://bioconductor.org/biocLite.R")
biocLite("airway")

source("http://bioconductor.org/biocLite.R")
biocLite("DESeq2")

source("http://bioconductor.org/biocLite.R")
biocLite("genefilter")


#versao nova (>= 3.5.0)
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("IRanges", version = "3.8", force=T)

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("GenomicFeatures", version = "3.8")

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("airway", version = "3.12")

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("DESeq2", version = "3.8")

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("genefilter", version = "3.8")

##Instalar pacotes fora do bioconductor
install.packages("RColorBrewer")
install.packages("pheatmap")
install.packages("ggplot2")
install.packages("gplots")

library("airway")
library("gplots")
library("GenomicFeatures")
library("DESeq2")
library("pheatmap")
library("RColorBrewer")
library("ggplot2")
library("genefilter")

## ------------------------------------------------------------------------

data("airway")
se <- airway
se
head(assay(se), 3)
colSums(assay(se)) #somar reads quantificadas por amostra
rowRanges(se)
str(metadata(rowRanges(se)))
colData(se)
se$cell
se$dex
se$dex <- relevel(se$dex, "untrt")
se$dex


## Inicio expessao diferencial
countdata <- assay(se)
head(countdata, 3)
coldata <- colData(se)

#Colocar count table em formato deseq2
ddsMat <- DESeqDataSetFromMatrix(countData = countdata, colData = coldata, design = ~ cell + dex )
nrow(ddsMat)

#Remover genes com baixissima expressao
dds <- ddsMat[  rowSums(counts(ddsMat))> 5, ]
nrow(dds)

#Normalizacao
dds <- DESeq(dds)

#Expressao diferencial
res <- results(dds, alpha=.05, lfcThreshold=1)
mcols(res, use.names=TRUE)
summary(res)

#Expressao diferencial com o contraste referente ao tipo celular
results(dds, contrast=c("cell", "N061011", "N61311"))

table(res$padj < .05)

#selecao genes com valor de p-ajustado < 0.01
resSig <- subset(res, padj < 0.01)
resSig[ order(resSig$log2FoldChange, decreasing=TRUE), ]
write.csv(res, "DEGs_untr_trt.csv")

## Transformacao rlog. Os valores de expressao muito baixos sao reduzidas em relacao as medias dos genes para todas as amostras
rld <- rlog(dds, blind=FALSE)
head(assay(rld), 3)

## Heatmap genes diferencialmente expressos
breaks <- seq(-10.5,10, by=0.01) #criar sequencia de valores a cada 0.01
mycol <- colorpanel(n=length(breaks)-1,low="blue",mid="white",high="red") #criar sequencia de cores dados os valores criadaos

mat <- assay(rld)[ rownames(resSig), ]
df <- as.data.frame(colData(rld)[,c("cell","dex")])

jpeg("heatmap_DEGs.jpeg", width = 6, height = 6, units = 'in', res = 500, pointsize = 12)
pheatmap(mat, annotation_col=df, scale="row", clustering_distance_rows="correlation", show_rownames=F, color=mycol)
dev.off()

#fazer volcano plot
#volcano plot
values <- cbind(res[,2],res[,6])
up <- values[values[,1]> 1 & values[,2]<0.05, ]
down <- values[values[,1]< -1 & values[,2]<0.05, ]

png("my_volcano.png")
plot( values[,1], -log10(values[,2]), xlab="log2(foldchange)",ylab="-log10(q-value)",col="black",pch=16,cex=1.5, xlim=c(-8,8),main="Case vs. Control" )
if (length(up)>1){
  points(up[,1], -log10(up[,2]),pch=16,cex=1.5,col="dark red")
  }
if (length(down)>1){
  points(down[,1], -log10(down[,2]),pch=16,cex=1.5,col="dark green")
  }
abline(h=-log10(0.05),col="black",lty=2)
abline(v=log2(2), col="black",lty=2)
abline(v=-log2(2), col="black",lty=2)
dev.off()


#descobrir quais sao os 20 genes mais variaveis
topVarGenes <- head(order(rowVars(assay(rld)),decreasing=TRUE),20)
topVarGenes

assay(rld)[topVarGenes,]
