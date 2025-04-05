#!/bin/bash
# file_type_counter.sh
# Description: Count unique file types (based on file extension) in a directory

# Check for correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

directory=$1

# Check if the provided argument is a valid directory
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found." >&2
    exit 1
fi

# Find all files, extract extensions (if any), count and sort them
find "$directory" -type f |
    while read -r file; do
        filename=$(basename "$file")
        # Extract extension: if no '.', print '[no extension]'
        if [[ "$filename" == *.* ]]; then
            ext="${filename##*.}"
        else
            ext="[no extension]"
        fi
        echo "$ext"
    done | sort | uniq -c | sort -nr
