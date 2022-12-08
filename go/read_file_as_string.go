package main

import (
    "fmt"
    "io/ioutil"
    "log"
    "os"
)

func main() {
    
    arq := os.Args[1]
    content, err := ioutil.ReadFile(arq)

    if err != nil {
        log.Fatal(err)
    }
    
    fmt.Println(string(content))
}
