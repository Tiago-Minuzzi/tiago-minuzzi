package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
)

func main() {
    // Read command line input
    arq := os.Args[1]

    f, err := os.Open(arq)
    // Error handling
    if err !=nil {
        log.Fatal(err)
    }
    
    defer f.Close() // close the file at the end of the program

    scanner := bufio.NewScanner(f)
    for scanner.Scan() {
        fmt.Println(scanner.Text())
    }

    if err := scanner.Err(); err!=nil {
        log.Fatal(err)
    }

}
