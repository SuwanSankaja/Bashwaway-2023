#!/bin/bash
sudo apt-get update
sudo apt-get install fpc
# Check if the Free Pascal Compiler (fpc) is installed
if ! command -v fpc &> /dev/null; then
    exit 1
fi

# Specify the full path to the Pascal-like script
script_path=$(realpath src/markings.pas)

# Create a temporary directory
temp_dir=$(mktemp -d)

# Compile the Pascal-like script
fpc -o"$temp_dir/output" "$script_path"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    # Execute the compiled program
    "$temp_dir/output"

    # Clean up the temporary directory
    rm -r "$temp_dir"
else
    rm -r "$temp_dir"
    exit 1
fi
