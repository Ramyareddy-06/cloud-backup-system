#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

SOURCE_DIR="$PROJECT_DIR/files_to_backup"
CLOUD_DIR="$PROJECT_DIR/cloud_storage"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="backup_$TIMESTAMP.zip"

mkdir -p "$SOURCE_DIR" "$CLOUD_DIR" "$LOG_DIR"

echo "----------------------------------------" >> "$LOG_FILE"
echo "Backup started at: $(date)" >> "$LOG_FILE"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Backup failed: files_to_backup folder not found" >> "$LOG_FILE"
    echo "Backup failed: files_to_backup folder not found"
    exit 1
fi

if [ -z "$(ls -A "$SOURCE_DIR")" ]; then
    echo "Backup failed: No files found in files_to_backup" >> "$LOG_FILE"
    echo "Backup failed: No files found in files_to_backup"
    exit 1
fi

cd "$SOURCE_DIR"
zip -r "$CLOUD_DIR/$BACKUP_FILE" . >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Files compressed successfully" >> "$LOG_FILE"
    echo "Backup stored in cloud_storage folder" >> "$LOG_FILE"
    echo "Backup file name: $BACKUP_FILE" >> "$LOG_FILE"
    echo "Backup completed at: $(date)" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"

    echo "Backup completed successfully!"
    echo "Backup file created: $BACKUP_FILE"
else
    echo "Backup failed during compression" >> "$LOG_FILE"
    echo "----------------------------------------" >> "$LOG_FILE"

    echo "Backup failed"
    exit 1
fi
