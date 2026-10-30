#!/bin/bash

file="contacts.txt"

echo "Checking contacts..."

while IFS= read -r line
do
    if [[ $line =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "IP address: $line"
    elif [[ $line =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        echo "Email: $line"
    else
        echo "Other text: $line"
    fi
done < "$file"
