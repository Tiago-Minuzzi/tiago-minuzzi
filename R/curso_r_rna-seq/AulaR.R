##########################################################################################
####################################### Introducao ao R ##################################
##########################################################################################
#verificar diretorio de trabalho.
getwd() 

#cricao de um vetor com expressao do gene A em 20 amostras
geneA <- c(84.334,90.455,34.989,43.222,23,25.424,0.568,0.349,45.984,62.847,17.233,12.085,72.692,4.297,36.592,49.849,96.765,19.364,28.428,1.376)

#observar o vetor geneA
geneA

#verificar modo/tipo do vetor geneA
mode(geneA)

#verificar tamanho do vetor geneA
length(geneA)

#verificar estrutura do vetor geneA
str(geneA)

#verificar a classe do vetor geneA
class(geneA)

#observar 6 primeiros elementos do vetor geneA
head(geneA,2)

#ordenar o vetor geneA 
sort( geneA , decreasing = F )

#ordenar o vetor geneA - DESAFIO
order(geneA)

#arrendondar valores do geneA
round(geneA,2)

#selecionar quinto elemento do vetor geneA
geneA[5]

#selecionar do segundo ao decimo elemento do vetor geneA
geneA[2:10]

#selecionar o segundo e o quinto elemento do vetor geneA criado
geneA[c(2,5)]

#acessar quais variaveis estao salvas no ambiente R
ls()

#nomear o vetor gene A
names(geneA) <- paste(rep("amostra",20),seq(1,20,1))

#selecionar valor de expressão do geneA na amostra 5
geneA["amostra 5"]

#verificar o vetor geneA
geneA

#criar um vetor com os valores de zscore do geneA
geneAzscore <- ( geneA - mean(geneA) ) / sd(geneA)

geneAzscore

#verificar o tamanho do vetor geneAzscore - DESAFIO
length(geneAzscore)

#criar um vetor com os valores de geneA em log2
geneAlog2 <- log2(geneA)
geneAlog2

#verificar o tamanho do vetor geneAlog2
length(geneAlog2)

#criar data frame com numero de observacaoes de uma coluna maior do que das demais colunas
tabelaEXP <- data.frame(Exp = geneA, Zscore= geneAzscore, log2Exp = geneAlog2 )
tabelaEXP

#nomear elementos do data frame
rownames(tabelaEXP) <- names(geneA)

#investigar objeto tabelaEXP
head(tabelaEXP,2)
str(tabelaEXP)
mode(tabelaEXP)
length(tabelaEXP) #DESAFIO

#selecionar a coluna Zscore do data frame tabelaEXP,
tabelaEXP$Zscore

#selecionar a coluna Zscore e log2Expressao do data frame tabelaEXP,
tabelaEXP[ , c("Zscore","log2Exp") ]
tabelaEXP[,c(2,3)]

#selecionar 
tabelaEXP[3,2]

#selecionar 
tabelaEXP[2,3]

#criar novo data.frame com informacoes das amostras - DESAFIO
tabelaAMOSTRA <- data.frame( Grupo = c( rep("grupo 1",10),rep("grupo 2",10) ) , Genero = c( rep("feminino",5),rep("masculino",5),rep("feminino",5),rep("masculino",5) ) )
tabelaAMOSTRA
head(tabelaAMOSTRA)

#nomear elementos do data frame tabelaAMOSTRA 
rownames(tabelaAMOSTRA) <- names(geneA)  # muda o indice das linhas com o nome desejado
head(tabelaAMOSTRA)

#juntar (merge) duas tabelas com informacoes de genes e amostras, por exemplo
tabela_exp_amostra <- merge(tabelaEXP,tabelaAMOSTRA, by= "row.names", all=T, sort=F)

#investigar objeto tabela unida
head(tabela_exp_amostra)
str(tabela_exp_amostra)
length(tabela_exp_amostra)
class(tabela_exp_amostra)
dim(tabela_exp_amostra)

#transformar o data frame tabela_exp_amostra em matrix
matrixGenes <- as.matrix(tabela_exp_amostra)
matrixGenes
mode(matrixGenes)
dim(matrixGenes)
is.matrix(matrixGenes)  #is.vector, is.data.frame, is.list, is.array, is.character, is.numeric, is.logical

#Observar nomes das linhas e colunas do objeto data
colnames(matrixGenes)
rownames(matrixGenes) <- names(geneA)

head(matrixGenes)

#Selecionar colunas da matrix matrixGenes diferente de Row.names e Genero
matrixGenes2 <- matrixGenes[,!colnames(matrixGenes) %in% c( "Row.names", "Genero")]
matrixGenes2

#Selecao das amostras com o valor de expressao do geneA maiores que 50
#Transformar os valores de expressão na matrixGenes em valores numericos
#buscar ajuda para entender funcao apply
matrixGenes2 <- as.data.frame(matrixGenes2)

?apply
matrixGenes2[,1:3] <- apply(matrixGenes2[,1:3], 1:2, function(x) as.numeric(x) )

matrixGenes3 <- matrixGenes2[ which( matrixGenes2[,1] > 50 ) , ]
matrixGenes3

#Selecao de linhas que tenham um padrao em uma coluna
matrixGenes2[ grepl(paste0(1:2, collapse="|"), rownames(matrixGenes2) ), ]
matrixGenes2[grepl("grupo 1",matrixGenes2$Grupo), ]
matrixGenes2[, grepl("o$",colnames(matrixGenes2)) ]
matrixGenes2[, grepl("^E",colnames(matrixGenes2)) ]

ls()

#Criar uma lista e selecionar alguns elementos
mylist <- list(matrixGenes, tabelaAMOSTRA,geneA, 3)
mode(mylist)
length(mylist)
str(mylist)
mylist[2]
mylist[3]
mylist[[2]][1]
mylist[[3]][2:5]
names(mylist) <- c("matrixGenes", "tabelaAMOSTRA", "geneA", "amostra21")
mylist

#Importar arquivos .csv no R
getwd()

#trocar diretorio de trabalho da sessao do r
#setwd("/Users/jessicaplaca/Desktop/")

table_exp <- read.csv("expression_data.csv", header=T, sep=",", row.names=1)
head(table_exp)
mode(table_exp)
dim(table_exp)
str(table_exp)

#distribuicao dos dados
summary(table_exp)
t(table_exp)
summary(t(table_exp))

#salvar um arquivo
?write.table
write.table(table_exp,"my_data_frame.tsv", sep="\t", quote=F)

#Abrir tabela com valores de expressao
#table_exp <- read.csv("/Users/jessicaplaca/Documents/cursos/CRABI-SP_2022_v12/Aulas/expression_data.csv", header=T, sep=",", row.names=1)
head(table_exp)
is.numeric(table_exp)

#Transformar tabela em valores numericos para execucao de operacoes matematicas
table_exp_numeric <- apply(table_exp, 1:2, function(x) as.numeric(x) )


#Comparar os grupos de amostras com teste t
testeT <- apply(table_exp_numeric, 1, function(x) t.test(x[1:3],x[4:6])$p.value )
FoldChange <-  apply(table_exp_numeric, 1, function(x) mean(x[4:6])/mean(x[1:3]) )


#calcular correlacao e p value entre dois genes
correlation <- cor.test(table_exp_numeric[1,], table_exp_numeric[4,])
correlation$estimate
correlation$p.value

png("correlation.png",res=500, width = 2000, height = 2000, type = c("cairo"))

plot(table_exp_numeric[1,],
     table_exp_numeric[4,],
     pch=16,
     cex=2,
     xlab=rownames(table_exp_numeric)[1],
     ylab=rownames(table_exp_numeric)[4])

abline(lm( table_exp_numeric[4,] ~ table_exp_numeric[1,] ), col = "red", lwd=2)
text(1000, max(table_exp_numeric[4,]) ,paste("p.value =", round(correlation$p.value,3)) )
text(600, max(table_exp_numeric[4,])-300 ,paste("R =", round(correlation$estimate,3)) )

dev.off() # fechar o arquivo (nao "escrever" mais)

#utilizando if - condicional - if (cond) { exc }
if (testeT[1] >= 0.05){ 
  print("maior") 
} else { 
    print("menor") 
  }

#Utilizando for  - for (cond) { exc }
    mydata <- vector()
    for (posicao in 1:length(FoldChange) ) {
        if (FoldChange[posicao] > 10) {
          mydata[posicao] <- "up" 
        } else { 
            mydata[posicao] <- "down" 
            }
    }

#salvar historico
savehistory(file = "AulaR.Rhistory")
