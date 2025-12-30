package main

import (
  "os"
  "fmt"
  "log"
  "bufio"
  "strings"
  "path/filepath"
)

func main() {

  if len(os.Args) != 2 {
    fmt.Println(">>> Uso:")
    fmt.Printf("\t%s <ARQUIVO_FASTA>\n", os.Args[0])
    os.Exit(1)
  }

  arquivo := os.Args[1]
  entrada, err := os.Open(arquivo)

  if err != nil {
    log.Printf("\n\tErro na leitura: %v", err)
    os.Exit(2)
  }

  defer entrada.Close()

  baseName := filepath.Base(arquivo)
  extension := filepath.Ext(baseName)
  newName := strings.TrimSuffix(baseName, extension)
  newName = fmt.Sprintf("%s.fasta", newName)

  idx := 1


  saida, err := os.Create(newName)

  if err != nil {
    log.Printf("\n\tErro de escrita: %v\n", err)
    os.Exit(3)
  }

  defer saida.Close()

  scanner := bufio.NewScanner(entrada)
  buf := make([]byte, 64*1024)
  scanner.Buffer(buf, 1024*1024)

  writer := bufio.NewWriterSize(saida, 1024*1024)
	defer writer.Flush()

  for scanner.Scan() {
    linha := scanner.Bytes()

    switch idx % 4 {
    case 1:
      writer.WriteByte('>')
      if len(linha) > 0 {
        writer.Write(linha[1:])
      }
      writer.WriteByte('\n')

    case 2:
      writer.Write(linha)
      writer.WriteByte('\n')
    }
    idx++
  }
  fmt.Println(">>> Programa finalizado!")
}
