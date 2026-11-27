#!/bin/bash

SOURCES=("$HOME/backup_task/data" "$HOME/backup_task/logs")
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/backup_task/backups_versioned/backup_$TIMESTAMP"
LOG_FILE="$HOME/backup_task/backup.log"

mkdir -p "$BACKUP_DIR"

echo "=== Backup started: $TIMESTAMP ===" >> "$LOG_FILE"

for SRC in "${SOURCES[@]}"; do
    if [ -d "$SRC" ]; then
        FOLDER_NAME=$(basename "$SRC")
        rsync -av --exclude='*.tmp' "$SRC/" "$BACKUP_DIR/$FOLDER_NAME/" >> "$LOG_FILE" 2>&1
        echo "[OK] Backed up $SRC to $BACKUP_DIR/$FOLDER_NAME" >> "$LOG_FILE"
    else
        echo "[WARNING] Source directory $SRC does not exist, skipping." >> "$LOG_FILE"
    fi
done

echo "=== Backup finished ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
