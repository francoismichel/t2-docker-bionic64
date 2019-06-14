#!/bin/bash

mkdir -p $(dirname ${1})
clang -Wall -Wextra -c -emit-llvm -O0 /mount/${1}.c -o ${1}.bc

./llvm2kittel --eager-inline -increase-strength -no-slicing --t2 ${1}.bc > /mount/${1}.t2
