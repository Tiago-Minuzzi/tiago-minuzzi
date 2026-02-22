package main

// Exemple input data is a TSV file:
//		 ENSP00000493376 1       -
//		 ENSP00000493376 50      -
//		 ENSP00000493376 100     -
//		 ENSP00000409316 200     !
//		 ENSP00000409316 250     !
//		 ENSP00000409316 300     !
//
// Output is like:
//		 Campo 1: ENSP00000493376, Campo 2: 1, Campo 3: -
//		 Campo 1: ENSP00000493376, Campo 2: 50, Campo 3: -
//		 Campo 1: ENSP00000493376, Campo 2: 100, Campo 3: -
//		 Campo 1: ENSP00000409316, Campo 2: 200, Campo 3: !
//		 Campo 1: ENSP00000409316, Campo 2: 250, Campo 3: !
//		 Campo 1: ENSP00000409316, Campo 2: 300, Campo 3: !

import (
	"io"
	"fmt"
	"os"
	"strconv"
	"encoding/csv"
)

type CsvRecord struct {
	ID string
	Pos int
	Saav string
}

func main() {
	arquivo, err := os.Open("exemplo_vars.tsv")
	if err != nil {
		panic(err)
	}
	defer arquivo.Close()

	records, _ := tabReader(arquivo)
	for r := range records {
		fmt.Printf("Campo 1: %v, Campo 2: %v, Campo 3: %v\n", r.ID, r.Pos, r.Saav)
	}

}

func tabReader(f *os.File) (<-chan CsvRecord, <-chan error) {
	outCh := make(chan CsvRecord)
	errCh := make(chan error, 1)
	
	reader := csv.NewReader(f)
	reader.Comma = '\t'

	go func() {
		defer close(outCh)
		defer close(errCh)

		for {
			record, err := reader.Read()
			if err == io.EOF {
				return
			}
			
			if err != nil {
				errCh <- err
				return
			}
			pos, err := strconv.Atoi(record[1])
			if err != nil {
				errCh <- err
			}

			
			p := CsvRecord{
				ID: record[0],
				Pos: pos,
				Saav: record[2],
			}

			outCh <- p
		}
	} ()
	return outCh, errCh
}
