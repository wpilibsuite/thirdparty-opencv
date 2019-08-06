#!/bin/bash

# Bash script that download, cross-compile and install FFmpeg with the specified compiler
# First argument = the cross-compiler prefix
# Second argument = the target architecture
# example : ./installFFmpeg.sh arm-raspbian9-linux-gnueabihf- armhf

if [ "$1" = "" ]; then
    echo "Parameter 1 is empty"
    echo "You must specified a cross-compiler to build FFmpeg with"
elif [ "$2" = "" ]; then
    echo "Parameter 2 is empty"
    echo "You must specified the target architecture"
else
    git clone git://source.ffmpeg.org/ffmpeg.git
    cd ffmpeg
    ./configure --enable-cross-compile --cross-prefix=$1 --arch=$2 --target-os=linux
    make
    make install
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
    export PKG_CONFIG_LIBDIR=/usr/local/lib
    cd ..
fi