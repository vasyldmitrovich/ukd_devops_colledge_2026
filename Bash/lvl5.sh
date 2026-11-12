#!/bin/bash

input_file="data.txt"
output_file="filtered_data.txt"

> "$output_file"

echo "=== Аналіз файлу ==="

while IFS= read -r line; do
  if [[ "$line" =~ "Admin" ]]; then
    echo "Знайдено запис адміністратора!"
  fi
done < "$input_file"

grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$input_file" >> "$output_file"

grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" "$input_file" >> "$output_file"

cat "$output_file"
