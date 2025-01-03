package main

import (
  "os"
  "fmt"
  "bufio"
)


func main() {

  indice := 0
  total_bases := 0
  total_reads := 0

  arquivo := os.Args[1]

  f, err := os.Open(arquivo)

  if err != nil {
    fmt.Printf("Error opening file!")
    os.Exit(1)
  }
  defer f.Close()

  scanner := bufio.NewScanner(f)

  for scanner.Scan() {
    indice++
    if indice % 4 == 2 {
      total_bases += len(scanner.Bytes())
      total_reads++
    }
  }

  fmt.Println(total_reads, total_bases)

  if err := scanner.Err(); err != nil {
    fmt.Printf("Error reading file!")
    os.Exit(1)
  }
}
