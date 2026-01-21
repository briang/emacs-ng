#!/bin/bash

parent_dir="$HOME/.emacs.d/eln-cache"

for sub in $(find $parent_dir -mindepth 1 -type d); do
    name=$(basename "$sub")
    count=$(find "$sub" -maxdepth 1 -type f | wc -l)
    echo "$count $name"
done
