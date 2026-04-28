# Automated Cloud Backup and Recovery System with Scheduled Backup

## Project Overview
This project is an Automated Cloud Backup and Recovery System implemented using Shell Script on Mac. It creates timestamped ZIP backups, stores them in a simulated cloud storage folder, maintains logs, supports recovery, and uses cron job automation for scheduled backup.

## Features
- Automatic backup using shell script
- Timestamp-based backup versioning
- Simulated cloud storage using cloud_storage folder
- Restore previous backups
- Backup and restore log maintenance
- Cron job scheduling every 5 minutes
- Backup status report

## Technologies Used
- Shell Script
- Mac Terminal
- Cron Job
- Zip/Unzip
- Local cloud storage simulation

## Project Structure
cloud-backup-system/
├── backup.sh
├── restore.sh
├── status.sh
├── files_to_backup/
├── cloud_storage/
├── restored_files/
└── logs/

## How to Run

### Run Backup
```bash
./backup.sh
