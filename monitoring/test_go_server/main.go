package main

import (
    "fmt"
    "net/http"
    "time"
)

func handler(w http.ResponseWriter, r *http.Request) {
    logMessage := fmt.Sprintf("Request received at %s", time.Now().Format(time.RFC3339))
    fmt.Println(logMessage)
    fmt.Fprintln(w, "Hello, World!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Server running at http://localhost:5000/")
    http.ListenAndServe(":5000", nil)
}
