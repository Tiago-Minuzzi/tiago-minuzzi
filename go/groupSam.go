package main

import (
    "io"
    "os"
    "fmt"
    //"regexp"
    "strings"
    "encoding/csv"
)

func main() {
    if len(os.Args) != 2 {
		fmt.Println("Uso: ./seu_programa <nome_do_arquivo>")
		os.Exit(1)
	}

    arquivo, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Printf("Erro: %s ao abrir o arquivo %s", err, arquivo)
    }

    defer arquivo.Close()

    reader := csv.NewReader(arquivo)
    reader.Comma = '\t'
    
    sam_map := make(map[string][]string)

    for {
        records, err := reader.Read()
        if err == io.EOF {
            break
        }

        idx := records[0]
        cgr := records[5]
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
