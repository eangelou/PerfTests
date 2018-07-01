from pyd.support import setup, Extension 

projName = 'AppDpy'

setup(
    name=projName,
    version='0.1',
    ext_modules=[
        Extension(projName, ['src/test/package.d', 'src/test/perf.d'],
#             extra_compile_args=['-w'],
            optimize = True,
            build_deimos=True,
            d_lump=True
        )
    ],
)

## To build as Python module, try:
# python setup.py build  --compiler=ldc2
# sudo python setup.py install
