package main

import (
    "path/filepath"
    "strings"
    "bufio"
    "log"
    "fmt"
    "os"
)

func readFasta(filename string) map[string]string {
    arquivo, err := os.Open(filename)

    if err != nil {
        fmt.Println("Deu ruim.")
    }

    // fecha o arquivo depois da dunção retornar o desejado
    defer arquivo.Close()

    // inicializa o hash map
    records := make(map[string]string)
    // inicializa o Id da sequencia FASTA
    var fid string
    // buferiza o arquivo
    scanner := bufio.NewScanner(arquivo)
    // iterar sobre o conteúdo do arquivo
    for scanner.Scan() {
        linha := scanner.Text()
        if strings.HasPrefix(linha, ">") {
            fid = strings.TrimSpace(linha)
            records[fid] = ""
        } else {
            records[fid] += linha } }

    if erro := scanner.Err(); erro != nil {
        log.Fatal("Erro ", erro) }
    return records

}

func main() {
    if len(os.Args) < 2 {
        fmt.Println("Usage: ./fastaIdIndexer file.fasta")
        os.Exit(1)
    }

    var fastaFile  string = os.Args[1]
    var baseName   string = filepath.Base(fastaFile)
    var indexFasta string = "fmt_" + baseName
    var indexFile  string = "fmt_" + strings.TrimSuffix(baseName, filepath.Ext(baseName)) + ".txt"

    fa, err := os.Create(indexFasta)

    sd, err := os.Create(indexFile)
    if err != nil {
        fmt.Println("Error creating the file ", indexFasta)
    }
    defer sd.Close()

    writeToSd := bufio.NewWriter(sd)
    writeToFa := bufio.NewWriter(fa)

    records := readFasta(fastaFile)

    counter := 0
    for i, j := range records {
        counter += 1
        i = strings.TrimPrefix(i, ">")

        _, err1 := fmt.Fprintf(writeToSd, "seq%d\t%s\n", counter, i)
        _, err2 := fmt.Fprintf(writeToFa, ">seq%d\n%s\n", counter, j)

        if err1 != nil {
            fmt.Println("Error writing to ", err1)
        }

        if err2 != nil {
            fmt.Println("Error writing to ", err2)
        }

    }

    writeToSd.Flush()
    writeToFa.Flush()

    fmt.Println(">>> Done!")
}
