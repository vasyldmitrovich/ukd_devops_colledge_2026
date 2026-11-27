#!/bin/bash

# Налаштування
SOURCES=("$HOME/data" "$HOME/logs")
DEST_ROOT="$HOME/backups"
LOG="$HOME/ukd_devops_colledge_2026/backup_task/backup.log"
TS=$(date +%Y-%m-%d_%H-%M-%S)
DEST="$DEST_ROOT/$TS"

# Режим dry-run: ./backup.sh --dry-run
DRY=""
if [ "$1" = "--dry-run" ]; then
    DRY="--dry-run"
fi

log() {
    echo "$(date '+%F %T') $1" >> "$LOG"
}

log "=== Старт backup ($TS) $DRY ==="

if [ -z "$DRY" ]; then
    mkdir -p "$DEST"
fi

for SRC in "${SOURCES[@]}"; do
    # перевірка, чи існує папка
    if [ ! -d "$SRC" ]; then
        log "ПОМИЛКА: папка $SRC не існує, пропускаю"
        continue
    fi

    rsync -av $DRY --exclude='*.tmp' --exclude='*.cache' "$SRC" "$DEST/" >> "$LOG" 2>&1

    if [ $? -eq 0 ]; then
        log "OK: $SRC"
    else
        log "ПОМИЛКА rsync для $SRC"
    fi
done

log "=== Кінець backup ==="
