#!/usr/bin/python
import datetime
import random
import numpy
cdef int N = 20000
cdef int size = 10


cdef double scalar_product( x, y, int siz):
    cdef double res = 0
    for i in range(siz):
        res += x[i] * y[i]
    return res


def run(self):
#     value_type = 0
#     result_type = 0
#     t = []
#     size_type = []
    
    tm_before = datetime.datetime.now()


    # 1. allocate and fill randomly many short vectors
    xs = []
    for i in range(N):
        xs.append([])
    print "allocation: {} ms".format((datetime.datetime.now()-tm_before).microseconds / 1000.0)
    tm_before = datetime.datetime.now()

    for i in range(N):
        for j in range(size):
            xs[i].append(random.uniform(-1000, 1000))
        xs[i] = numpy.array(xs[i])
    xs = numpy.array(xs)
    print "random generation: {} ms".format((datetime.datetime.now()-tm_before).microseconds / 1000.0)
    tm_before = datetime.datetime.now()

    # 2. compute all pairwise scalar products:
    avg = 0
    for i in range(N):
        for j in range(N):
            avg += scalar_product(xs[i], xs[j], size)
    avg = avg / N*N
    time = (datetime.datetime.now()-tm_before)
    print "result: {}".format(avg)
    print "time: {} ms".format(time)
