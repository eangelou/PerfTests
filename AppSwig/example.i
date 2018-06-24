/*
example.i
 Created on: Oct 8, 2017
     Author: vagos 
*/
 
%module example
%{
#include "example.h"
%}

%include "std_vector.i"
namespace std {
   %template(vectori) vector<int>;
   %template(vectorvectori) vector<vector<int>>;
};

/* Include the header file with above prototypes */
%include "example.h"

