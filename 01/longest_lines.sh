#!/bin/bash

# longest_lines.sh
# Description: Selects the N longest lines from a given text file,
#              sorted from longest to shortest, with line length prepended.

n=$1          # Number of lines to select
file=$2       # Input file

# Process the file:
# 1. Read line by line
# 2. Print length and line using printf (to avoid trailing space issues)
# 3. Sort by length (numeric, reverse)
# 4. Pick top N lines
while IFS= read -r line; do
    printf "%05d %s\n" "${#line}" "$line"
done < $file | sort -nr | head -n $n

