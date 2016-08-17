#!/bin/bash

echo $(gcc --version)
tar xzf ./qt-lite.tar.gz

cd qt-everywhere-opensource-src-5.7.0
mkdir build
cd build

../configure -release -opensource -static \
             -confirm-license -c++std c++11  \
             -no-mtdev -no-journald \
             -nomake examples -nomake tests \
             -qt-xcb --prefix=${CONDA_PREFIX}

#-gtkstyle -opengl -qt-freetype
make -j2

make install
