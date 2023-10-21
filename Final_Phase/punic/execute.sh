#!/bin/bash

# Parse inputs
while getopts "c:b:" opt; do
    case "$opt" in
        c) catapults="$OPTARG" ;;
        b) battalions=($OPTARG) ;;
    esac
done

# Validate inputs
if [ -z "$catapults" ]; then
    echo "Error: Missing number of catapults."
    exit 1
fi

if [ ${#battalions[@]} -eq 0 ]; then
    echo "Error: No battalions provided."
    exit 1
fi

destroyed=0

while [ $catapults -gt 0 ]; do
    max_val=-1
    for val in "${battalions[@]}"; do
        if [ $val -le $catapults ] && [ $val -gt $max_val ]; then
            max_val=$val
        fi
    done

    if [ $max_val -eq -1 ]; then
        break
    fi

    # Find the index of the first occurrence of max_val and unset it
    for idx in "${!battalions[@]}"; do
        if [ ${battalions[$idx]} -eq $max_val ]; then
            unset battalions[$idx]
            let catapults-=$max_val
            let destroyed+=1
            break
        fi
    done
done

echo $destroyed
