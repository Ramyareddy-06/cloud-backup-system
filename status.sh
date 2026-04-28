#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

CLOUD_DIR="$PROJECT_DIR/cloud_storage"
LOG_FILE="$PROJECT_DIR/logs/backup.log"

echo "========== CLOUD BACKUP STATUS REPORT =========="
echo ""
echo "Project Directory: $PROJECT_DIR"
echo "Cloud Storage Folder: $CLOUD_DIR"
echo ""

echo "Total Backup Files:"
ls "$CLOUD_DIR"/*.zip 2>/dev/null | wc -l

echo ""
echo "Latest Backup:"
ls -t "$CLOUD_DIR"/*.zip 2>/dev/null | head -1

echo ""
echo "Storage Used:"
du -sh "$CLOUD_DIR"

echo ""
echo "Last 10 Backup Log Entries:"
tail -10 "$LOG_FILE"

echo ""
echo "================================================"
