package main

import (
    "fmt"
    "os"
)

func main() {
    script_name := os.Args[0]
    arguments := os.Args[1:] // From first arg to the end

    fmt.Println("Script name is:", script_name)
    fmt.Println("You've typed:",arguments) // print all arguments
    fmt.Println("First arg =",arguments[0]) // Read first argument from command line
    fmt.Println("Last arg =",arguments[len(arguments)-1]) // Read last argument from command line
}
