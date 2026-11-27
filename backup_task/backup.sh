#!/bin/bash

BACKUP_DIR="$HOME/versioned_backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
DEST="$BACKUP_DIR/$DATE"
LOG="$(dirname "$(realpath "$0")")/backup.log"

mkdir -p "$DEST" || exit 1

echo "Backup started: $(date)" >> "$LOG"

STATUS=0

for DIR in "$HOME/data" "$HOME/logs"; do
    if [ -d "$DIR" ]; then
        if rsync -av --exclude='*.tmp' "$DIR" "$DEST/" >> "$LOG" 2>&1; then
            echo "Success: $DIR" >> "$LOG"
        else
            echo "Error: $DIR" >> "$LOG"
            STATUS=1
        fi
    else
        echo "Directory not found: $DIR" >> "$LOG"
        STATUS=1
    fi
done

echo "Backup finished: $(date), status: $STATUS" >> "$LOG"
echo "------------------------" >> "$LOG"

exit "$STATUS"
