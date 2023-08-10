#!/bin/sh -xe 
  
 mkdir build 
 cd build 
 cmake \ 
   -DCMAKE_BUILD_TYPE="Debug" \ 
   -DENABLE_OPENMP="ON" \ 
   -DENABLE_SANITIZERS="ON" \ 
   -DCMAKE_INSTALL_PREFIX=/usr \
   .. 
 make -j$(nproc) VERBOSE=1 DESTDIR=AppDir
 make test_solvespace
