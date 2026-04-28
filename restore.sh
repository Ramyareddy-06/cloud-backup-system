#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

CLOUD_DIR="$PROJECT_DIR/cloud_storage"
RESTORE_DIR="$PROJECT_DIR/restored_files"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/restore.log"

mkdir -p "$RESTORE_DIR" "$LOG_DIR"

echo "Available backup files:"
echo "----------------------------------------"
ls "$CLOUD_DIR"
echo "----------------------------------------"

echo "Enter backup file name to restore:"
read BACKUP_FILE

echo "----------------------------------------" >> "$LOG_FILE"
echo "Restore started at: $(date)" >> "$LOG_FILE"

if [ ! -f "$CLOUD_DIR/$BACKUP_FILE" ]; then
    echo "Backup file not found: $BACKUP_FILE" >> "$LOG_FILE"
    echo "Restore failed: Backup file not found"
    exit 1
fi

rm -rf "$RESTORE_DIR"/*
unzip -o "$CLOUD_DIR/$BACKUP_FILE" -d "$RESTORE_DIR" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Files restored successfully from $BACKUP_FILE" >> "$LOG_FILE"
    echo "Restore completed at: $(date)" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"

    echo "Restore completed successfully!"
    echo "Files restored inside restored_files folder."
    echo ""
    echo "Restored files:"
    find "$RESTORE_DIR" -type f
else
    echo "Restore failed during extraction" >> "$LOG_FILE"
    echo "Restore failed"
    exit 1
fi
