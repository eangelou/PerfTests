from distutils.core import setup
from Cython.Build import cythonize

setup(name='AppCython',
      ext_modules=cythonize("AppCython.pyx"))