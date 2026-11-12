#!/bin/bash
AUTHOR="Кузьмін Артур"
LOG_FILE="mixed_data.txt"
IP_REGEX='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

echo "Running script by $AUTHOR"

if [ -f "$LOG_FILE" ]; then
  echo "Processing file: $LOG_FILE"
  cat "$LOG_FILE" | grep -E "Server|Gateway"
fi

test_ips=("192.168.1.10" "invalid_ip" "10.0.0.254")
for ip in "${test_ips[@]}"; do
  if [[ $ip =~ $IP_REGEX ]]; then
    echo "[OK] Valid IP format: $ip"
  else
    echo "[WARN] Invalid IP format: $ip"
  fi
done
