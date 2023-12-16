package main

import (
    "go_workspace_template/math"
	"go_workspace_template/crypto"
    "fmt"
)

func main() {
    xs := []float64{1, 2, 3, 4}
    avg := math.Average(xs)
	fmt.Println(avg)
	crypto.Myhash(xs)
}