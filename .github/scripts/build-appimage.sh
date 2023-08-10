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

# get linuxdeploy's AppImage
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage

# run linuxdeploy and generate an AppDir
./linuxdeploy-x86_64.AppImage --appdir AppDir
