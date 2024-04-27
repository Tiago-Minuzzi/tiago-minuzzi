package main

import (
    "os"
    "fmt"
    //"regexp"
    "bufio"
    "strings"
)

func main() {
    if len(os.Args) != 2 {
		fmt.Println("### Criado por Tiago Minuzzi ###","\n")
		fmt.Println("Uso: ./groupSam nome_do_arquivo.sam > saida.tsv")
		os.Exit(1)
	}

    arquivo, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Printf("Erro: %s ao abrir o arquivo %s", err, arquivo)
    }

    defer arquivo.Close()

    reader := bufio.NewScanner(arquivo)
    
    sam_map := make(map[string][]string)

    for reader.Scan() {
        linha := reader.Text()
        linha = strings.TrimSpace(linha)

        splitted := strings.Split(linha, "\t")
        idx,_,cgr,_ := splitted[0], splitted[1:5], splitted[5], splitted[6:]

        sam_map[idx] = append(sam_map[idx], cgr)
    }

    var resultado strings.Builder

    for i, j := range sam_map {
        resultado.WriteString(i)
        resultado.WriteString("\t")
        resultado.WriteString(strings.Join(j, "\t"))
        resultado.WriteString("\n")
    }

    fmt.Println(resultado.String())
}
