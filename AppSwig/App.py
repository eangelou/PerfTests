#!/usr/bin/python
import datetime
import random
import example
N = 20000
size = 10


def scalar_product(x, y):
    res = 0
    siz = len(x)
    for i in range(siz):
        res += x[i] * y[i]
    return res


class Example(object):

    value_type = 0
    result_type = 0
    t = []
    size_type = []

    def main(self):
        tm_before = datetime.datetime.now()

        # 1. allocate and fill randomly many short vectors
        xs = []
        for i in range(N):
            xs.append(example.vectori(size))
        print "allocation: {} ms".format((datetime.datetime.now()-tm_before).microseconds / 1000.0)
        tm_before = datetime.datetime.now()
        
        for i in range(N):
            for j in range(size):
                xs[i][j] = int(random.uniform(-1000, 1000))
        print "random generation: {} ms".format((datetime.datetime.now()-tm_before).microseconds / 1000.0)
        tm_before = datetime.datetime.now()

        # 2. compute all pairwise scalar products:
        avg = example.scalar_product(example.vectorvectori(xs), N, size)
        time = (datetime.datetime.now()-tm_before)
        print "result: {}".format(avg)
        print "time: {} ms".format(time)


if __name__ == "__main__":
    exampleObj = Example()
    exampleObj.main()
