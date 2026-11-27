#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$BASE_DIR/source"
BACKUP_DIR="$BASE_DIR/backups"
LOG_FILE="$BASE_DIR/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
DEST_DIR="$BACKUP_DIR/$DATE"

echo "===== Backup started: $(date) =====" >> "$LOG_FILE"

if [ ! -d "$SOURCE_DIR/documents" ]; then
    echo "ERROR: documents folder does not exist" >> "$LOG_FILE"
    exit 1
fi

if [ ! -d "$SOURCE_DIR/projects" ]; then
    echo "ERROR: projects folder does not exist" >> "$LOG_FILE"
    exit 1
fi

mkdir -p "$DEST_DIR"

rsync -av --exclude="*.tmp" "$SOURCE_DIR/documents/" "$DEST_DIR/documents/" >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    echo "ERROR: documents backup failed" >> "$LOG_FILE"
    exit 1
fi

rsync -av --exclude="*.tmp" "$SOURCE_DIR/projects/" "$DEST_DIR/projects/" >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    echo "ERROR: projects backup failed" >> "$LOG_FILE"
    exit 1
fi

echo "Backup completed successfully: $DEST_DIR" >> "$LOG_FILE"
echo "===== Backup finished: $(date) =====" >> "$LOG_FILE"
