#!/bin/bash

file="pr_bash/data.txt"
out="pr_bash/result.txt"
ip_regex='^((25[0-5]|2[0-4][0-9]|1?[0-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]?[0-9])$'
email_regex='^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

ip_count=0
email_count=0
> "$out"

if [ ! -f "$file" ]; then
  echo "Файл $file не знайдено"
  exit 1
fi

for word in $(tr -d ',:' < "$file"); do
  if [[ $word =~ $ip_regex ]]; then
    echo "IP: $word" >> "$out"
    ((ip_count++))
  elif [[ $word =~ $email_regex ]]; then
    echo "EMAIL: $word" >> "$out"
    ((email_count++))
  fi
done

echo "Знайдено IP: $ip_count, email: $email_count"
echo "Результат у файлі $out"
