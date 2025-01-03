#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Transpose the file
awk '
{
    for (i = 1; i <= NF; i++) {
        matrix[i, NR] = $i
    }
    rows = NF
    cols = NR
}
END {
    for (i = 1; i <= rows; i++) {
        for (j = 1; j <= cols; j++) {
            printf "%s", matrix[i, j]
            if (j < cols) {
                printf " "
            }
        }
        print ""
    }
}
' "$file"

