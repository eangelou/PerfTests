package main

import "time"
import (
	"math/rand"
	"fmt"
)


const N = 20000;
const size = 10;


func scalar_product(x []int, y []int) int {
	res := 0;
	siz := len(x);
	for i := 0; i < siz; i++ {
		res += x[i] * y[i];
	}
	return res;
}

func main() {
	tm_before := time.Now();

	// 1. allocate and fill randomly many short vectors
	var xs [N][size]int;

	fmt.Println("allocation: ", time.Since(tm_before));
	tm_before = time.Now();

	for i := 0; i < N; i++ {
		for j := 0; j < size; j++ {
			random := rand.Intn(2000);
			if random > 1000 {
				xs[i][j] = - (random - 1000);
			} else {
				xs[i][j] = random;
			}
		}
	}

	fmt.Println("random: ", time.Since(tm_before));
	tm_before = time.Now();

	// 2. compute all pairwise scalar products:
	avg := 0;
	operation_num := 0;
	for i := 0; i < N; i++ {
		for j := 0; j < N; j++ {
			avg += scalar_product(xs[i][:], xs[j][:]);
			operation_num = operation_num + 1;
		}
	}
	avg = avg / N*N;
	fmt.Println("result: ", avg);
	time := time.Since(tm_before);
	fmt.Println("scalar products: ", time);
	fmt.Println("operations: ", operation_num);

}

