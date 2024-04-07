#!/bin/bash

# Specify the directory containing the CSV files
directory="./"

# Check if the directory exists
if [ -d "$directory" ]; then
    # Loop through each CSV file in the directory
    for file in "$directory"/*.csv; do
        # Skip if the file is a directory
        if [ -f "$file" ]; then
            # Create a temporary file to store the modified content
            temp_file=$(mktemp)
            # Remove the first 7 lines and the last 2 lines from the file and write it to the temporary file
            tail -n +8 "$file" | head -n -2 > "$temp_file"
            # Create a cleaned copy of the file with "cleaned" appended to its filename
            cleaned_file="${file%.csv}_cleaned.csv"
            cp "$temp_file" "$cleaned_file"
            echo "Created cleaned copy: $cleaned_file"
            # Remove the temporary file
            rm "$temp_file"
        fi
    done
else
    echo "Directory not found: $directory"
fi
