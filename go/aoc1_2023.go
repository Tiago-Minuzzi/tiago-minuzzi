package main

import (
    "strconv"
    "bufio"
    "fmt"
    "os"
)

func main() {
    readFile, err := os.Open("aocEx1.txt")

    if err != nil {
        fmt.Println(err)
    }

    fileScanner := bufio.NewScanner(readFile)
    fileScanner.Split(bufio.ScanLines)

    var nums []int

    for fileScanner.Scan() {
        //fmt.Println(fileScanner.Text()) // printar o texto lido no arquivo
        linhas := fileScanner.Text()
        var s []string
        for _, l := range linhas {
            l := string(l)
            if _, err := strconv.Atoi(l); err == nil {
                s = append(s, l)
            }
        }

        first, last := s[0], s[len(s)-1]
        fila := first+last
        num, _ := strconv.Atoi(fila) // uso do "_" para ignorar o erro. Pode-se manejá-lo usando a mesma estrutura do "if" para fazer append no slice "s".
        nums = append(nums, num)
    }

    readFile.Close()

    var soma int = 0

    for _, n := range nums {
        soma += n
    }
    fmt.Println(soma)

}
