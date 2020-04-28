#!/bin/bash

File=$1

mkdir ./test_data/files

tar xfz $1 -C ./test_data/files/

s=$(grep SUCCESS ./test_data/files/files/* | wc -l)
f=$(grep FAILURE ./test_data/files/files/* | wc -l)

echo "There were "$s" successes and "$f" failures."

rm -rf ./test_data/files
