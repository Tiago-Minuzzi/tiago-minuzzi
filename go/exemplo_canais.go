package main

import (
	"fmt"
	"unsafe"
)

func main() {
	ch := make(chan int)

	go func() {
		for i := range 100 {
			ch <- i
			i++
		}
		close(ch)
	}()

	for val := range ch {
		fmt.Println(val)
	}
	fmt.Println(unsafe.Sizeof(ch))
}
