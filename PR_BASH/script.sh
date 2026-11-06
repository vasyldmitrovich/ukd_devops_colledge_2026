#!/bin/bash
STUDENT="Maksym"
SERVERS=("web-server" "db-server" "cache")
echo "Starting check for $STUDENT..."
for srv in "${SERVERS[@]}"; do
if [[ $srv =~ ^web.* ]]; then
echo "Match found: $srv"
else
echo "No match: $srv"
fi
done
echo -e "error: disk\ninfo: update\nerror: memory" | grep "error"
