# Criando uma matriz
meu_vetor <- c(1,2,3,4,5,6,7,8,9)

minha_matriz <- matrix(meu_vetor,nrow = 3, ncol = 3)
print(minha_matriz)

# Criando um dataframe
meu_df <- data.frame(minha_matriz)
meu_df

my_fun <- function(valor) {
    if (valor < 5) {
        sprintf("O %s é menor que 5.",valor)
    } else if (valor == 5) {
        print("É o próprio.")
    } else {
        sprintf("O %s é maior que 5.",valor)
    }
}

res <- sapply(meu_vetor, my_fun)
res
