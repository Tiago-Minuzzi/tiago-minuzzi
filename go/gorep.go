package main

import (
    "os"
    "fmt"
    "bufio"
    "regexp"
    "strings"
)


func main() {
    if len(os.Args) != 3 || os.Args[1] == "help" {
        fmt.Printf("# Usage:\n\t./gorep pattern file\n")
        fmt.Println("# To negate a pattern use the minus sign (-):")
        fmt.Println("\t./gorep -pattern file")
        os.Exit(1)
    }

    var inPatr string = os.Args[1]
    var inFile string = os.Args[2]

    file, err := os.Open(inFile)

    if err != nil {
        fmt.Printf("Could not open %s.\n",file)
        os.Exit(1)
    }

    defer file.Close()

    var notPat string = "-"
    var NoInPatr string

    pattern, _ := regexp.Compile(inPatr)
    if strings.HasPrefix(inPatr, notPat) {
        NoInPatr = inPatr[1:]
        pattern, _ = regexp.Compile(NoInPatr)
    }


    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        linha := scanner.Text()
        if pattern.MatchString(linha) && !strings.HasPrefix(inPatr, notPat) {
            fmt.Println(linha)
        } else if !pattern.MatchString(linha) && strings.HasPrefix(inPatr, notPat) {
            fmt.Println(linha)
        }
    }
}
