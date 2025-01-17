#!/bin/sh
set -eux

. ./extra/travis/env.sh

cmake . \
  -DCMAKE_INCLUDE_PATH="$CACHE_DIR/usr/include" \
  -DCMAKE_LIBRARY_PATH="$CACHE_DIR/usr/lib" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
  -DENABLE_TESTS=ON \
  -DENABLE_WERROR=OFF
make
./run_tests.sh
