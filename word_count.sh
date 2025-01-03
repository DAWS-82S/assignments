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

# Count word occurrences and display the top 5
tr -s ' ' '\n' < "$file" | tr -d '[:punct:]' | sort | uniq -c | sort -nr | head -n 5

