#!/bin/bash
set -e
DIR=
if [ $# -eq 0 ]; then
    DIR=$(pwd)
else
    DIR=$1
fi
for D in $(find $DIR -name .git); do
    if git --git-dir=$D rev-parse --is-inside-work-tree > /dev/null 2>&1 ; then
        echo $D
        git --git-dir=$D fetch --all --prune
    fi
    sleep 1 # sleep to avoid server block
done
