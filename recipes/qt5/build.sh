#!/bin/bash


# tar xzf ./qt-lite.tar.gz
#
# cd qt-everywhere-opensource-src-5.7.0

# export TRAVIS_OS_NAME=linux
if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    ./configure -release -opensource -static \
             -confirm-license  \
             -no-mtdev -no-journald \
             -nomake examples -nomake tests \
             --prefix=${CONDA_PREFIX} \
             -platform macx-g++;
fi

if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  # tric to use gcc-4.9 compiller
  # wget -L https://github.com/benEnsta/conda-qt-static/blob/master/recipes/qt5/g++-base.conf -O mkspec/common/g++-base.conf
  ./configure -release -opensource -static \
               -confirm-license -c++std c++11 \
               -no-mtdev -no-journald \
               -nomake examples -nomake tests \
               -qt-xcb --prefix=${CONDA_PREFIX} -no-icu -v;
fi

#-gtkstyle -opengl -qt-freetype
make -j2

make install
