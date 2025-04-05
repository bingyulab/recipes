#!/bin/bash

# longest_lines.sh
# Description: Selects the N longest lines from a given text file,
#              sorted from longest to shortest, with line length prepended.
#              It checks for valid input and prints errors to stderr.

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number of lines to select> <filename>" >&2
    exit 1
fi

n=$1          # Number of lines to select
file=$2       # Input file

# Validate that the first argument is a positive integer
if ! [[ "$n" =~ ^[0-9]+$  ]] || [ "$n" -eq 0 ]; then
    echo "Error: First argument must be a positive integer." >&2
    exit 1
fi

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found." >&2
    exit 1
fi

# Process the file:
# 1. Read line by line
# 2. Print length and line using printf (to avoid trailing space issues)
# 3. Sort by length (numeric, reverse)
# 4. Pick top N lines
while IFS= read -r line; do
    printf "%05d %s\n" "${#line}" "$line"
done < $file | sort -nr | head -n $n

