#!/usr/bin/env bash

file=$1

# TODO (SR) research how to do this securely
# create a temp directory to untar the file in
temp_dir=$(mktemp -d)

tar xfz "$file" -C "$temp_dir"

successes=$(grep -rl  SUCCESS "$temp_dir" | wc -l)
failures=$(grep -rl FAILURE "$temp_dir" | wc -l)

echo "There were $successes successes and $failures failures."

rm -rf "$temp_dir"
