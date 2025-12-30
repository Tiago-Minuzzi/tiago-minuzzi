package main

import (
  "os"
  "fmt"
  "log"
  "flag"
  "sync"
  "bufio"
  "runtime"
  "strings"
  "path/filepath"
)

type Record struct {
  ID  []byte
  Seq []byte
}

func main() {

  inputPtr  := flag.String("input", "", "Caminho para o arquivo FASTQ de entrada. (Obrigatório)")
  cpusPtr   := flag.Int("threads", runtime.NumCPU(), "Número de threads para processamento.")

  flag.Parse()

  if *inputPtr == "" {
    fmt.Println(">>> Atenção! A flag '-input' é obrigatória.\n")
    flag.Usage()
    fmt.Println("\n>>> Exemplo:")
    fmt.Printf("\t%s -input <ARQUIVO_FASTA>\n", os.Args[0])
    os.Exit(42)
  }

  runtime.GOMAXPROCS(*cpusPtr)
  numWorkers := *cpusPtr

  if len(os.Args) > 5 {
    flag.Usage()
    fmt.Println("\n>>> Exemplo:")
    fmt.Printf("\t%s -input <ARQUIVO_FASTA>\n", os.Args[0])
    os.Exit(1)
  }

  arquivo       := *inputPtr
  entrada, err  := os.Open(arquivo)

  if err != nil {
    log.Printf("\n\tErro na leitura: %v", err)
    os.Exit(2)
  }

  defer entrada.Close()

  baseName  := filepath.Base(arquivo)
  extension := filepath.Ext(baseName)
  newName   := strings.TrimSuffix(baseName, extension)
  newName    = fmt.Sprintf("%s.fasta", newName)

  saida, err := os.Create(newName)

  if err != nil {
    log.Printf("\n\tErro de escrita: %v\n", err)
    os.Exit(3)
  }

  defer saida.Close()

  writer := bufio.NewWriterSize(saida, 1024*1024)
	defer writer.Flush()

  // Pool de memória para evitar alocações constantes
  recordPool := sync.Pool {
    New: func() interface{} {
      return &Record {
        ID:   make([]byte, 0, 512),
        Seq:  make([]byte, 0, 1024),
      }
    },
  }

  jobs    := make(chan *Record, numWorkers * 2)
  results := make(chan *Record, numWorkers * 2)
  var wg sync.WaitGroup

  for i:= 0; i < numWorkers; i++ {
    wg.Add(1)
    go func ()  {
      defer wg.Done()
      for r := range jobs {
        if len(r.ID) > 0 {
          r.ID[0] = '>'
        }
        results <- r
      }
    }()
  }

  doneWriting := make(chan bool)
  go func() {
    for r := range results {
      writer.Write(r.ID)
      writer.WriteByte('\n')
      writer.Write(r.Seq)
      writer.WriteByte('\n')

      r.ID  = r.ID[:0]
      r.Seq = r.Seq[:0]
      recordPool.Put(r)
    }
    doneWriting <- true
  }()

  scanner := bufio.NewScanner(entrada)

  idx := 1

  var currentRecord *Record

  for scanner.Scan() {
    mod := idx % 4

    switch mod {
    case 1:
      currentRecord = recordPool.Get().(*Record)
      currentRecord.ID = append(currentRecord.ID, scanner.Bytes()...)
    case 2:
      currentRecord.Seq = append(currentRecord.Seq, scanner.Bytes()...) // os `...` servem para desempacotar o slice
      jobs <- currentRecord
    }
    idx++
  }

  close(jobs)
  wg.Wait()
  close(results)
  <-doneWriting

  fmt.Println(">>> Programa finalizado!")
}
