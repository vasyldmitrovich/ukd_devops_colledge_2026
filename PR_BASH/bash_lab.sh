#!/bin/bash

name="Sofiia Tomashchuk"

echo "Student: $name"

for i in 1 2 3 4 5
do
    echo "Number: $i"
done

if [ 5 -gt 3 ]; then
    echo "5 is greater than 3"
else
    echo "5 is not greater than 3"
fi

ip="192.168.1.10"

if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "IP format is correct"
else
    echo "IP format is incorrect"
fi


