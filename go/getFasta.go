package main

import (
    "strings"
    "bufio"
    "fmt"
    "log"
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

func readIdsFile(filename string) []string {
    
    var idsSlice []string

    wantedIds, err     := os.Open(filename)
    scanIds            := bufio.NewScanner(wantedIds)

    if err != nil {
        fmt.Println("Erro no arquivo de Ids.")
    }

    for scanIds.Scan() {
        linha       := scanIds.Text()
        linha       =  strings.TrimSpace(linha)
        idsSlice    =  append(idsSlice, linha)
    }

    defer wantedIds.Close()

    return idsSlice
}

func main() {

    if len(os.Args) < 3 {
        fmt.Println("Uso: ./fastar seu_arquivo.fasta ids.txt")
        os.Exit(1)
    }

    var fasFile string  = os.Args[1]
    var idsFile string  = os.Args[2]

    recs := readFasta(fasFile)
    fids := readIdsFile(idsFile)

    for fid, fsq := range recs {
        for i := range fids {
            if fid[1:] == fids[i] {
                fmt.Println(fid, fsq)
            }
        }
    }
}
