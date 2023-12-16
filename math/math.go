package math

func Average(xs []float64) float64 {
    total := float64(0)
    for _, x := range xs {
        total += x
		total += 1
    }
    return total / float64(len(xs))
}