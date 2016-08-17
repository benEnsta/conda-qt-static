#!/bin/bash

tar xzfv ./qt-lite.tar.gz

cd qt-everywhere-opensource-src-5.7.0
mkdir build
cd build

../configure -release -opensource -static \
             -confirm-license -c++std c++11  \
             -no-mtdev -no-journald \
             -nomake examples -nomake tests \
             -qt-xcb --prefix=${CONDA_PREFIX}


make -j2

make install
