#!/bin/bash

timestamp=$(date +%Y%m%d_%H%M%S)

zip backup_$timestamp.zip file1.txt file2.txt

mv backup_$timestamp.zip cloud_storage/

echo "Backup created at $timestamp" >> logs/backup.log

echo "Backup successful!"
