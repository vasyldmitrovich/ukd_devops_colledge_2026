#!/bin/bash
AUTHOR="Erik"
FILE="data.txt"
echo "=== Запуск перевірки файлу $FILE від $AUTHOR ==="
while IFS= read -r line; do
if [[ "$line" =~ ([0-9]{1,3}\.){3}[0-9]{1,3} ]]; then
echo "[IP ЗНАЙДЕНО]: $line"
elif [[ "$line" =~ Error ]]; then
echo "[ПОМИЛКА]: $line"
else
echo "[ІНШЕ]: $line"
fi
done < "$FILE"
