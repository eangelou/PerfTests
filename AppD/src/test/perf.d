module test.perf;

import std.stdio;
import std.datetime;
import std.random;
import pyd.class_wrap;
import pyd.pyd;

class TestClass
{

    const long N = 20000;
    const int size = 10;

    alias int value_type;
    alias long result_type;
    alias value_type[] vector_t;
    alias ulong size_type;
    
    this(int Nu=20000, int sizeu=10) {
    	N = Nu;
    	size = sizeu;
	}

    value_type scalar_product(const ref vector_t x, const ref vector_t y)
    {
        value_type res = 0;
        size_type siz = x.length;
        for (size_type i = 0; i < siz; ++i)
            res += x[i] * y[i];
        return res;
    }

    int main()
    {
        auto tm_before = Clock.currTime();

        // 1. allocate and fill randomly many short vectors
        vector_t[] xs;
//        xs.length = N;
        for (int i = 0; i < N; ++i)
        {
        	xs.length = xs.length+1;
            xs[i].length = size;
        }
        writefln("allocation: %s ", (Clock.currTime() - tm_before));
        tm_before = Clock.currTime();

        // Use the mersenne twister engine
        Mt19937 mte;

        for (int i = 0; i < N; ++i)
            for (int j = 0; j < size; ++j)
                xs[i][j] = uniform(-1000, 1000, mte);
        writefln("random: %s ", (Clock.currTime() - tm_before));
        tm_before = Clock.currTime();

        // 2. compute all pairwise scalar products:
        result_type avg = cast(result_type) 0;
        result_type ops = cast(result_type) 0;
        for (int i = 0; i < N; ++i)
            for (int j = 0; j < N; ++j)
            {
                avg += scalar_product(xs[i], xs[j]);
                ops++;
            }
        avg = avg / N * N;
        writefln("result: %d", avg);
        auto time = Clock.currTime() - tm_before;
        writefln("scalar products: %s ", time);
        writefln("operations: %d ", ops);

        return 0;
    }

}

extern(C) void PydMain() {
    module_init();

    // Call wrap_class
    wrap_class!(
        TestClass,
        // Wrap the "main" method
        Def!(TestClass.main, int function()),
        // Wrap the constructors.
        Init!(int,int)
    )();
}