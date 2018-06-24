CXXFLAGS =	-O3 -g -Wall -fmessage-length=0

OBJS =	example_wrap.o example.o

SRCS =   example_wrap.cxx example.c

LIBS =

INCLUDES = /usr/include/python2.7/

TARGET = _example.so

$(TARGET):	$(OBJS)
	$(CXX) -shared -o $(TARGET) $(OBJS) $(LIBS)

$(OBJS): example_wrap.cxx
	c++ -fpic -I$(INCLUDES) -c $(SRCS)

example_wrap.cxx:
	swig -c++ -python example.i

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET) example_wrap.cxx *.pyc example.py
	rm -fr __pycache__
