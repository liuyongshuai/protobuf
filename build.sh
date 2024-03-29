#!/bin/bash
work_home="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" && cd $work_home

project="protobuf"

function usage() {
    echo "./build.sh [options]"
    echo "  -h show this help message"
    echo "  -c clean temp file"
}

clean=OFF
while getopts "athgcw" opt; do
    case "$opt" in
        c) clean=ON;;
        h) usage; exit;;
        ?) usage; exit;;
    esac
done

# build directory to store temporary compile files
build_home="$work_home/xbuild"
output_home="$work_home/output"

function detect_make_dir() {
  if [ ! -d $1 ]; then
    echo "-- $1 not exist, create it now."
    mkdir $1
  fi
}

separator="=============================================================================="
function make_start_tip() {
  echo $separator
  echo "-- build $1 start --"
}

function make_done_tip() {
  if [ $2 != "0" ]; then
    echo "-- build $1 faild, abort now! --" && exit 1
  else
    echo "-- build $1 done --"
    chmod -R 755 "$output_home"
  fi
}


# 确定编译环境
export CC=/usr/local/gcc/bin/gcc
if [ ! -f $CC ];then
    export CC=$(which gcc)
fi
export CXX=/usr/local/gcc/bin/c++
if [ ! -f $CXX ];then
    export CXX=$(which c++)
fi
gcclib64=/usr/local/gcc/lib64
if [ -f ${gcclib64} ]; then
    if [ "x${LD_LIBRARY_PATH}" == "x" ]; then
        export LD_LIBRARY_PATH=${gcclib64}
    else
        export LD_LIBRARY_PATH=${gcclib64}:${LD_LIBRARY_PATH}
    fi
fi


# clean option and prepare related directories
if [ "$clean" == "ON" ]; then
    rm -rf $build_home
    rm -rf $output_home
fi

detect_make_dir $build_home
detect_make_dir $output_home

cd $build_home
cmake -DCMAKE_C_COMPILER=${CC} -DCMAKE_CXX_COMPILER=${CXX} .. && make -j 4 && make install
make_done_tip $project $? && exit 0
