#!/bin/bash
set -e
DIR=
if [ $# -eq 0 ]; then
    DIR=$(pwd)
else
    DIR=$1
fi
for D in $(find $DIR -name .git); do
    echo $D
    git --git-dir=$D fetch
    sleep 1 # sleep to avoid server block
done
