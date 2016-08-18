#!/bin/bash


tar xzf ./qt-lite.tar.gz

cd qt-everywhere-opensource-src-5.7.0
mkdir build
cd build

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    ../configure -release -opensource -static \
             -confirm-license  \
             -no-mtdev -no-journald \
             -nomake examples -nomake tests \
             --prefix=${CONDA_PREFIX} \
             -sdk 10.11;
fi

if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  alias gcc="gcc-4.9"
  alias g++="g++-4.9"
  echo $($CC --version)s
  ../configure -release -opensource -static \
               -confirm-license -c++std c++11 \
               -no-mtdev -no-journald \
               -nomake examples -nomake tests \
               -qt-xcb --prefix=${CONDA_PREFIX};
fi

#-gtkstyle -opengl -qt-freetype
make -j2

make install
