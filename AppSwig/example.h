/* File : example.h */

#include <vector>

int scalar_product(std::vector<std::vector<int>> xs, int N, int siz) {
  int res = 0;
  int avg = 0;
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < N; ++j) { 
      res = 0;
      for (long z = 0; z < siz; ++z)
        res += xs[i][z] * xs[j][z];
      avg += res;
    }
  }
  avg = avg / N*N;
  return avg;
}
