#!/bin/bash
BASE="/home/kwaidix/ukd_devops_colledge_2026/PR_BackupTools"
SOURCES=("$BASE/data" "$BASE/logs")
DEST="$BASE/backup_task/backups"
LOG="$BASE/backup_task/backup.log"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

DRY=""
[ "$1" = "--dry-run" ] && DRY="--dry-run"

log() { echo "$(date '+%F %T') $1" >> "$LOG"; }

mkdir -p "$DEST"
log "=== Початок backup $DRY ==="

for SRC in "${SOURCES[@]}"; do
    if [ ! -d "$SRC" ]; then
        log "ПОМИЛКА: папка $SRC не існує"
        continue
    fi
    NAME=$(basename "$SRC")
    TARGET="$DEST/${NAME}_$DATE"
    if rsync -av $DRY --exclude='*.tmp' --exclude='*.cache' "$SRC/" "$TARGET/" >> "$LOG" 2>&1; then
        log "OK: $SRC -> $TARGET"
    else
        log "ПОМИЛКА rsync для $SRC"
    fi
done

log "=== Кінець backup ==="
