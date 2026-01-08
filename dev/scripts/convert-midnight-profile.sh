#!/bin/bash
#
# Converts a WoW Midnight (12.0+) Edit Mode profile string to a Retail compatible string.
# Usage: 
#   ./convert-midnight-profile.sh "profile_string"
#   ./convert-midnight-profile.sh < input_file.txt
#   echo "profile_string" | ./convert-midnight-profile.sh
#

input_string=""

# check if argument provided
if [ "$#" -ge 1 ]; then
    input_string="$1"
else
    # read from stdin
    # Use -t to check if stdin is a terminal (interactive) or pipe
    if [ -t 0 ]; then
        echo "Please paste the Midnight profile string:"
        read input_string
    else
        read input_string
    fi
fi

if [ -z "$input_string" ]; then
    echo "Error: No input string provided." >&2
    exit 1
fi

# Trim whitespace
input_string=$(echo "$input_string" | tr -d '\n' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# Split into array
IFS=' ' read -r -a parts <<< "$input_string"

count=${#parts[@]}

if [ "$count" -lt 2 ]; then
    echo "Error: Invalid profile string format." >&2
    exit 1
fi

version="${parts[0]}"
num_systems="${parts[1]}"

echo "Detected Version: $version" >&2
echo "Detected System Count: $num_systems" >&2

current=2
new_parts=()
actual_count=0
removed_count=0

# Loop through the systems
for (( i=0; i<num_systems; i++ )); do
    # Check bounds (current index + 9 must be less than count)
    end_idx=$((current + 9))
    if [ "$end_idx" -ge "$count" ]; then
         echo "Warning: Unexpected end of string at index $current" >&2
         break
    fi

    sys_type="${parts[$current]}"
    sys_index="${parts[$((current+1))]}"
    
    # Check exclusion criteria
    # 6 2  : Unknown (New Frame?)
    # 21 -1: Unknown
    # 22 * : Unknown (New Group?)
    # 23 -1: Unknown
    
    exclude=0
    
    if [ "$sys_type" == "6" ] && [ "$sys_index" == "2" ]; then exclude=1; fi
    if [ "$sys_type" == "21" ] && [ "$sys_index" == "-1" ]; then exclude=1; fi
    if [ "$sys_type" == "22" ]; then exclude=1; fi
    if [ "$sys_type" == "23" ]; then exclude=1; fi
    
    if [ "$exclude" -eq 0 ]; then
        # Append 10 fields to new_parts
        for (( j=0; j<10; j++ )); do
            new_parts+=("${parts[$((current+j))]}")
        done
        ((actual_count++))
    else
        ((removed_count++))
    fi
    
    current=$((current + 10))
done

echo "Conversion Complete." >&2
echo "Original Systems: $num_systems" >&2
echo "Removed Systems: $removed_count" >&2
echo "New System Count: $actual_count" >&2
echo "" >&2

# Output final string
echo "$version $actual_count ${new_parts[*]}"
