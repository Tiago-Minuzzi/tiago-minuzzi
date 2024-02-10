library(caret)
library(dplyr)
library(datasets)
library(FactoMineR)

data("iris")
dados <- select(iris, -Species)
pdados <- preProcess(dados, method = c("range"))
pdados <- predict(pdados, dados)

prediction <- kmeans(pdados, centers = 3, nstart = 25)
iris <- mutate(iris, "cluster" = prediction$cluster)
non_normalized <- iris %>% count(Species, cluster)
normalized <- iris %>% count(Species, cluster)

icc <- read.csv('/home/tiago/Desktop/fiocruz/v4.dados/ambos/input_ambos.csv')
icc_dados <- select(icc, -Patient)
icc_index <- select(icc, Patient)

clusters <- kmeans(icc_dados, centers = 3, nstart = 10)
icc_index <- mutate(icc_index, 'cluster' = clusters$cluster)
disease <- ifelse(grepl("MISC", icc_index$Patient), 'MISC',
       ifelse(grepl("COVID", icc_index$Patient), 'COVID', NA))
icc_index <- mutate(icc_index, 'disease' = disease)
icc_index %>% count(disease, cluster) %>% arrange(cluster,disease)
