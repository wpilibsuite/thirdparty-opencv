#!/bin/bash

# Bash script that download, cross-compile and install FFmpeg with the specified compiler
#
# Argument [optional] = the platform for which ffmpeg has to be built for ("raspbian" or "athena")
# If no argument is provided, the build system's platform is used
#
# example : ./installFFmpeg.sh raspbian

if [ "$1" = "" ]; then
    echo "No platform specified; using the build system's platform"
elif [ "$1" = "raspbian" ]; then
    CROSS_COMPILE_OPTIONS="--enable-cross-compile --cross-prefix=arm-raspbian10-linux-gnueabihf- --arch=armhf --target-os=linux"
elif [ "$1" = "athena" ]; then
    CROSS_COMPILE_OPTIONS="--enable-cross-compile --cross-prefix=arm-frc2020-linux-gnueabi- --arch=arm --target-os=linux"
elif [ "$1" = "aarch64bionic" ]; then
    CROSS_COMPILE_OPTIONS="--enable-cross-compile --cross-prefix=aarch64-bionic-linux-gnu- --arch=aarch64 --target-os=linux"
fi

git clone git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
BUILD_PATH=$(pwd)/build
mkdir $BUILD_PATH
./configure --prefix=$BUILD_PATH --disable-programs $CROSS_COMPILE_OPTIONS
make
make install
cd ..

export PKG_CONFIG_PATH=$BUILD_PATH/lib/pkgconfig/
export PKG_CONFIG_LIBDIR=$BUILD_PATH/lib
