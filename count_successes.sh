#!/usr/bin/env bash

file=$1

# TODO (SR) research how to create temp dir securely
# TODO (SR) wrap the files - in a check for the variable  not empty etc
#           if not set print usage

# create a temp directory to untar the file in
temp_dir=$(mktemp -d)

# research why this does not require a - for the flags
tar xfz "$file" -C "$temp_dir"

successes=$(grep -rl  SUCCESS "$temp_dir" | wc -l)
failures=$(grep -rl FAILURE "$temp_dir" | wc -l)

echo "There were $successes successes and $failures failures."

rm -rf "$temp_dir"
