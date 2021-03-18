#!/usr/bin/bash

# Run from top level directory
./autogen.sh --without-mysql \
    && ./configure CC=gclang CXX=gclang++ --without-mysql \
    && make -j \
    && make install ;

# Extract bitcode
pushd ./ ; cd ./src ;
get-bc sysbench ;
llvm-dis sysbench.bc ; 

# Instrument
### TODO

popd ;
