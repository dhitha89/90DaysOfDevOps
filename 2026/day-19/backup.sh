#!/bin/bash
set -uo pipefail

<< readme
Backup script with timestamped archives
Cleans backups older than 14 days automatically
readme

SOURCE_DIR="$1"
BACKUP_DIR="$2"
BACKUP_NAME=""
BACKUP_SIZE=""
DELETED=0

validate_args() {
    if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
        echo "Usage: $0 <source_directory> <backup_directory>"
        exit 1
    fi
}

check_source_dir_exists() {
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "Error: Source directory '$SOURCE_DIR' does not exist"
        exit 1
    fi
}

setup_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        echo "Creating backup directory: $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
    fi
}

create_backup() {
    local TIMESTAMP=$(date +%Y-%m-%d_%H%M%S)
    BACKUP_NAME="backup-$TIMESTAMP.tar.gz"
    local BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"
    
    echo "Starting backup..."
    echo "Source: $SOURCE_DIR"
    echo "Destination: $BACKUP_PATH"
    
    tar -czf "$BACKUP_PATH" "$SOURCE_DIR" 2>/dev/null
    
    if [ $? -ne 0 ] || [ ! -f "$BACKUP_PATH" ] || [ ! -s "$BACKUP_PATH" ]; then
        echo "Error: Backup failed"
        rm -f "$BACKUP_PATH"
        exit 1
    fi
    
    BACKUP_SIZE=$(ls -lh "$BACKUP_PATH" | awk '{print $5}')
    
    echo "-----------------------------------"
    echo "Backup created: $BACKUP_NAME"
    echo "Size: $BACKUP_SIZE"
    echo "-----------------------------------"
}

cleanup_old_backups() {
    local COUNT=$(find "$BACKUP_DIR" -type f -name "backup-*.tar.gz" -mtime +14 2>/dev/null | wc -l)
    
    if [ "$COUNT" -gt 0 ]; then
        echo "Removing $COUNT old backups..."
        find "$BACKUP_DIR" -type f -name "backup-*.tar.gz" -mtime +14 -exec rm -f {} \; 2>/dev/null
        DELETED=$count
    else
        echo "No old backups to clean up"
        DELETED=0
    fi
}

main() {
    validate_args
    check_source_dir_exists
    setup_backup_dir
    create_backup
    cleanup_old_backups
    
    echo "-----------------------------------"
    echo "Backup process completed"
    echo "New backup: $BACKUP_NAME ($BACKUP_SIZE)"
    echo "Total backups deleted: $DELETED"
    echo "-----------------------------------"
}

main