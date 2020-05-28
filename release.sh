#!/bin/bash
d=${PWD}
bd=${d}/build

if [ ! -d ${bd} ] ; then
    mkdir ${bd}
fi

cd ${bd}
cmake -DCMAKE_BUILD_TYPE=Release \
      ..

if [ $? -ne 0 ] ; then
    echo "Failed to configure"
fi

cmake --build . \
      --config Release

if [ $? -ne 0 ] ; then
    echo "Failed to build"
fi

./test

