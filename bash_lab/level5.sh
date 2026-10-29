#!/bin/bash

input_file="data.txt"
output_file="extracted_data.txt"

> $output_file

echo "Починаємо аналіз файлу $input_file..."

while IFS= read -r line; do
  
  if [[ $line =~ "Failed" ]]; then
    echo "Увага: знайдено помилку в логах -> $line"
  fi

done < "$input_file"

echo -e "\n--- Знайдені IP адреси ---" >> $output_file
grep -E -o "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $input_file >> $output_file

echo -e "\n--- Знайдені Email адреси ---" >> $output_file
grep -E -o "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" $input_file >> $output_file

echo "Дані успішно відфільтровано та збережено у $output_file"
