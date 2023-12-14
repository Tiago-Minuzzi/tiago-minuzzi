package main

import (
    "os"
    "fmt"
    "strings"
)

func main() {

    meuDicio := map[string]string {
        "foo": "1",
        "bar": "2",
        "xpto": "3",
    }

    var chaves []string
    for chave := range meuDicio {
        chaves = append(chaves, chave)
    }

    resultado := strings.Join(chaves, "\n")

    if len(os.Args) < 2 {
        fmt.Println("ERRO: faltando argumento.")
        fmt.Println("Tente uma das chaves abaixo:")
        fmt.Println(resultado)
        os.Exit(1)
    }

    option := os.Args[1]


    if valor, existe := meuDicio[option]; existe {
        fmt.Printf("Valor: %s\n", valor)
    } else {
        fmt.Printf("A chave '%s' não existe.\n", option)
        fmt.Println("Tente uma das chaves abaixo:")
        fmt.Println(resultado)
    }
}
