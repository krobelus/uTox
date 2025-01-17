#!/bin/sh
set -eux

. ./extra/travis/env.sh

export CFLAGS="-I$CACHE_DIR/usr/include -I/usr/share/mingw-w64/include/ "

mkdir build_win
cd build_win
cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-win64.cmake \
    -DCMAKE_INCLUDE_PATH="$CACHE_DIR/usr/include" \
    -DCMAKE_LIBRARY_PATH="$CACHE_DIR/usr/lib" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
    -DENABLE_FILTERAUDIO=OFF \
    -DSTATIC_ALL=ON \
    -DSTATIC_TOXCORE=ON \
    -DENABLE_TESTS=OFF \
    -DENABLE_WERROR=OFF

make || make VERBOSE=1
