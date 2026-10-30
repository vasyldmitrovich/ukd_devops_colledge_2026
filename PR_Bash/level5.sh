#!/bin/bash

# Variables
name="Veronika"
count=5

echo "Hello, $name!"
echo "Starting Bash script..."

# Condition
if [ $count -gt 3 ]; then
    echo "Count is greater than 3"
else
    echo "Count is 3 or less"
fi

# Loop
for i in 1 2 3 4 5
do
    echo "Iteration: $i"
done

# Array
services=("Web" "Database" "Server")

echo "Available services:"

for service in "${services[@]}"
do
    echo "$service"
done

# RegEx validation
email="admin@example.com"

if [[ "$email" =~ ^[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,}$ ]]; then
    echo "Email format is correct"
else
    echo "Email format is incorrect"
fi

# Pipeline
echo "Filtering IP addresses from data.txt:"
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' data.txt

echo "Script completed!"
