#!/bin/bash


# tar xzf ./qt-lite.tar.gz
#
# cd qt-everywhere-opensource-src-5.7.0

# export TRAVIS_OS_NAME=linux
if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    export MACOSX_DEPLOYMENT_TARGET=10.7
    ./configure -release -opensource -static -platform macx-clang \
             -confirm-license  \
             -no-mtdev -no-journald \
             -nomake examples -nomake tests \
             -qt-libpng \
             -qt-libjpeg \
             -qt-freetype \
             -qt-pcre \
             -no-rpath \
             -no-dbus \
             --prefix=${CONDA_PREFIX} -v ;
            #  -platform macx-g++;
fi

if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  # tric to use gcc-4.9 compiller
  # wget -L https://github.com/benEnsta/conda-qt-static/blob/master/recipes/qt5/g++-base.conf -O mkspec/common/g++-base.conf
  ./configure -release -opensource -static \
               -confirm-license \
               -no-mtdev -no-journald \
               -nomake examples -nomake tests \
               -qt-xcb --prefix=${CONDA_PREFIX} -no-icu -v;
fi

#-gtkstyle -opengl -qt-freetype
make -j2

make install
