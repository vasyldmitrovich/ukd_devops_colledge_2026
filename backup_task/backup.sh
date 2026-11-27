#!/bin/bash

# Налаштування шляхів
SOURCES=("$HOME/data" "$HOME/logs")
BACKUP_ROOT="$HOME/versioned_backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DEST_DIR="$BACKUP_ROOT/backup_$TIMESTAMP"
LOG_FILE="$(dirname "$(realpath "$0")")/backup.log"

echo "==========================================" >> "$LOG_FILE"
echo "[$TIMESTAMP] Запуск резервного копіювання" >> "$LOG_FILE"

mkdir -p "$DEST_DIR"

for SRC in "${SOURCES[@]}"; do
    if [ -d "$SRC" ]; then
        FOLDER_NAME=$(basename "$SRC")
        echo "[$TIMESTAMP] Копіювання $SRC -> $DEST_DIR/$FOLDER_NAME" >> "$LOG_FILE"
        
        rsync -av --exclude='*.tmp' --exclude='*.cache' "$SRC/" "$DEST_DIR/$FOLDER_NAME/" >> "$LOG_FILE" 2>&1
        
        if [ $? -eq 0 ]; then
            echo "[$TIMESTAMP] УСПІХ: $SRC скопійовано." >> "$LOG_FILE"
        else
            echo "[$TIMESTAMP] ПОМИЛКА при копіюванні $SRC." >> "$LOG_FILE"
        fi
    else
        echo "[$TIMESTAMP] ПОПЕРЕДЖЕННЯ: Директорія $SRC не існує, пропускаємо." >> "$LOG_FILE"
    fi
done

echo "[$TIMESTAMP] Резервне копіювання завершено." >> "$LOG_FILE"
