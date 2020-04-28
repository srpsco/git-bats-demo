#!/bin/bash

File=$1

temp_dir=$(mktemp -d)

tar xfz "$File" -C "$temp_dir"

successes=$(grep -rl  SUCCESS "$temp_dir" | wc -l)
failures=$(grep -rl FAILURE "$temp_dir" | wc -l)

echo "There were $successes successes and $failures failures."

rm -rf "$temp_dir"
