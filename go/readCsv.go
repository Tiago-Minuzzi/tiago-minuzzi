package main

import (
    "os"
    "fmt"
    "bufio"
    "regexp"
    "strings"
)

func main() {
    if len(os.Args) != 4 {
        fmt.Println("Usage: ./readCsv file.csv DISEASE pattern")
        os.Exit(1)
    }

    var inFile string   = os.Args[1]
    var inDise string   = os.Args[2]
    var inPatt string   = os.Args[3]
    
    var valDis bool

    diseases := []string{"COVID", "MISC"}

    for _, d := range diseases {
        if inDise == d {
            valDis = true
        }
    }

    if !valDis {
        fmt.Println(">>> Erro:")
        fmt.Printf("\tArgumento %s não é válido.\n", inDise)
        fmt.Println("\tUse COVID ou MISC.")
        os.Exit(1)
    }

    arquivo, err := os.Open(inFile)

    if err != nil {
        fmt.Printf("Erro ao abrir o arquivo \"%s\".\n", inFile)
    }

    defer arquivo.Close()

    pattern, _ := regexp.Compile(inPatt)

    scanner := bufio.NewScanner(arquivo)

    for scanner.Scan() {
        linha   := scanner.Text()
        linha   =  strings.TrimSpace(linha)
        split   := strings.Split(linha, ",")
        
        path, cluster, patient, disease := split[0], split[1], split[2], split[3]

        if disease == inDise {
            if pattern.MatchString(path) {
                fmt.Printf("# Patient: %s\n\t- Cluster: %s\n\t- Term: %s\n", patient, cluster, path)
            }
        }
    }
}
