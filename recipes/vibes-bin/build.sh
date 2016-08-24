cd viewer
qmake PREFIX=${CONDA_PREFIX} .
make
make install
