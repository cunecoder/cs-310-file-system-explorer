## Name:          file_explorer.sh
## Author:        David Marin
## Created:       9/13/2025
## Description:   This bash script lists out all files in a given directory

#!/bin/bash

## List out all the files in the given directory (argument 1: $1).
for file in "$1"/*; do
    path="$(realpath "$file")"
    size="$(du -h "$path" | cut -f1)"
    type="$(file --mime-type "$path" | cut -d':' -f2)"
    
    if [ -f "$path" ]; then
        echo ""$path"    file    "$size"    "$type""
    fi

    if [ -d "$path" ]; then
        echo ""$path"    directory    "$size"    "$type""
    fi
done
