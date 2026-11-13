#!/bin/bash

SOURCE_FILE="network_data.txt"
RESULT_FILE="filtered_contacts.txt"

cat << DATA > "$SOURCE_FILE"
WebServer1: 192.168.1.15 - admin@ukd.edu.ua
Database01: 10.0.5.42 - db.support@company.org
System log: service restarted successfully
GatewayRouter: 172.16.0.1 - netops_team@devops.io
Invalid entry without address
DATA

echo "=== RegEx [[ =~ ]] check ===" > "$RESULT_FILE"

while IFS= read -r line; do
  if [[ "$line" =~ ([0-9]{1,3}\.){3}[0-9]{1,3} ]]; then
    echo "[IP found]: $line" >> "$RESULT_FILE"
  elif [[ "$line" =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} ]]; then
    echo "[Email found]: $line" >> "$RESULT_FILE"
  else
    echo "[Skipped]: $line"
  fi
done < "$SOURCE_FILE"

echo -e "\n=== All IPs ===" >> "$RESULT_FILE"
cat "$SOURCE_FILE" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' >> "$RESULT_FILE"

echo -e "\n=== All Emails ===" >> "$RESULT_FILE"
cat "$SOURCE_FILE" | grep -Eo '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' >> "$RESULT_FILE"

cat "$RESULT_FILE"
