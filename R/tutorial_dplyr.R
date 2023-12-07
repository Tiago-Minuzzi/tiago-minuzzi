library("dplyr")
library("datasets")

# Referencias
# https://genomicsclass.github.io/book/pages/dplyr_tutorial.html
# https://sparkbyexamples.com/r-programming/r-dplyr-tutorial-learn-with-examples/

# dplyr verbs 	Description
# select() 	selecionar colunas
# filter() 	filtra linhas
# arrange() 	ordena ou reordena linhas
# mutate() 	cria novas colunas
# summarise() 	gera valores sumarizados
# group_by() 	para realizar operações baseadas em grupos


data("iris")
colnames(iris)

# Selecionar colunas com o método "select"
select(iris, Sepal.Length, Petal.Length)
head(select(iris, Sepal.Length, Petal.Length))
## Selecionar todas colunas exceto uma
head(select(iris, -Species))
## Selecionar um range de colunas
head(select(iris, Petal.Length:Species))

# -----//-----

unique(iris$Species)
mean(iris$Sepal.Length)
mean(iris$Petal.Length)

# Selecionar linhas usando o método filter
head(filter(iris, Species != "setosa"))
## filtrar baseado em mais de uma condição
head(filter(iris, Sepal.Length >= 5.84, Petal.Length >= 3.75))
## filtrar linhas que estão em...
filter(iris, Species %in% c("setosa", "virginica"))

# -----//-----

# Usando o operador de pipe (%>$)
# Não se usa o nome do dataframe no método nesse caso
iris %>% filter(Sepal.Length >= 5.84, Petal.Length >= 3.75) %>% select(Species, Sepal.Length, Petal.Length)

# -----//-----

# Usando o método arrange
iris %>% filter(Sepal.Length >= 5.84, Petal.Length >= 3.75) %>% select(Species, Sepal.Length, Petal.Length) %>% arrange(Sepal.Length)
## ordenando decrescente
iris %>% filter(Sepal.Length >= 5.84, Petal.Length >= 3.75) %>% select(Species, Sepal.Length, Petal.Length) %>% arrange(desc(Sepal.Length))
## ordenando descrenscente em uma e crescente na outra
iris %>% filter(Sepal.Length >= 5.84, Petal.Length >= 3.75) %>% select(Species, Sepal.Length, Petal.Length) %>% arrange(desc(Species), Petal.Length)

# -----//-----

# Usando o método mutate
# Este método cria novas colunas
iris %>% filter(Sepal.Length >= 5.84, Petal.Length >= 3.75) %>% select(Species, Sepal.Length, Petal.Length) %>% arrange(desc(Species), Petal.Length) %>% mutate(SepPetRel = Sepal.Length / Petal.Length)

# -----//-----

# Usando summarise
iris %>% summarise(AvgSepLen = mean(Sepal.Length),
                   AvgPepLen = mean(Petal.Length))

# -----//-----

# Usando groupby
iris %>% select(Species, Sepal.Length, Petal.Length) %>% group_by(Species) %>% summarise(AvgSepLen = mean(Sepal.Length), AvgPetLen = mean(Petal.Length), total = n())

# -----//-----

# Usando relocate para reorganizar colunas
iris %>% select(Species, Sepal.Length, Petal.Length) %>% relocate(Species, Petal.Length, Sepal.Length) %>% head()
