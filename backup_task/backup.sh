#!/bin/bash

# directories for backup
SOURCES=("/home/vagrant/data" "/home/vagrant/logs")


BACKUP_ROOT="/home/vagrant/backups_versioned"

# store exact date & time
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# combined root path + timestamp to make unqiue backup folder
DEST="$BACKUP_ROOT/backup_$TIMESTAMP"

# logfile path
LOG_FILE="/home/vagrant/ukd_devops_colledge_2026/backup_task/backup.log"

mkdir -p "$DEST"

echo "=== Backup started at $TIMESTAMP ===" >> "$LOG_FILE"

# loop through every dir in SOURCES
for SRC in "${SOURCES[@]}"; do
	# check if it's a valid folder and get a path
    if [ -d "$SRC" ]; then
    	# get folder name stripping away the path
        FOLDER_NAME=$(basename "$SRC")
        # backup files and fill in logs (errors are shown in the backup log as well)
        rsync -av --exclude='*.tmp' "$SRC/" "$DEST/$FOLDER_NAME/" >> "$LOG_FILE" 2>&1
        echo "[OK] Backed up $SRC to $DEST/$FOLDER_NAME" >> "$LOG_FILE"
    else
        echo "[WARNING] Directory $SRC does not exist. Skipping." >> "$LOG_FILE"
    fi
done

echo "=== Backup finished ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
