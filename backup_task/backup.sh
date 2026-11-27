#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
SOURCES=("$HOME/data" "$HOME/logs")
BACKUP_ROOT="$HOME/versioned_backups"
DEST_DIR="$BACKUP_ROOT/backup_$TIMESTAMP"
LOG_FILE="$HOME/ukd_devops_colledge_2026/backup_task/backup.log"

echo "========================================" >> "$LOG_FILE"
echo "[$TIMESTAMP] Старт резервного копіювання" >> "$LOG_FILE"

mkdir -p "$DEST_DIR"

for SRC in "${SOURCES[@]}"; do
    if [ -d "$SRC" ]; then
        FOLDER_NAME=$(basename "$SRC")
        echo "[$TIMESTAMP] Копіювання $SRC -> $DEST_DIR/$FOLDER_NAME" >> "$LOG_FILE"
        rsync -av --exclude='*.tmp' "$SRC/" "$DEST_DIR/$FOLDER_NAME/" >> "$LOG_FILE" 2>&1
    else
        echo "[$TIMESTAMP] ПОМИЛКА: Папка $SRC не існує!" >> "$LOG_FILE"
    fi
done

echo "[$TIMESTAMP] Завершено." >> "$LOG_FILE"
