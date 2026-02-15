#!/bin/bash
set -uo pipefail

<< readme
Log rotation script that compresses old logs and cleans up old archives
readme

LOG_DIR="$1"
COMPRESSED=0
DELETED=0

validate_args() {
    if [ -z "$LOG_DIR" ]; then
        echo "Usage: $0 <directory_path>"
        exit 1
    fi
}

check_source_dir_exists() {
    if [ ! -d "$LOG_DIR" ]; then
        echo "Error: $LOG_DIR directory does not exist"
        exit 1
    fi
}

compress_old_logs() {
    local COUNT=$(find "$LOG_DIR" -type f -name "*.log" -mtime +7 2>/dev/null | wc -l)

    if [ "$COUNT" -gt 0 ]; then
        echo "Compressing $COUNT log files older than 7 days..."
        find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec gzip {} \; 2>/dev/null
        COMPRESSED=$COUNT
    else
        echo "No log files older than 7 days found"
        COMPRESSED=0
    fi
}

cleanup_old_archives() {
    local COUNT=$(find "$LOG_DIR" -type f -name "*.gz" -mtime +30 2>/dev/null | wc -l)

    if [ "$COUNT" -gt 0 ]; then
        echo "Deleting $COUNT compressed files older than 30 days..."
        find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -exec rm -f {} \; 2>/dev/null
        DELETED=$COUNT
    else
        echo "No compressed files older than 30 days found to delete"
        DELETED=0
    fi
}

main() {
    validate_args
    check_source_dir_exists

    echo "Starting log rotation for: $LOG_DIR"

    compress_old_logs
    cleanup_old_archives

    echo "-----------------------------------"
    echo "Log rotation completed"
    echo "Files compressed: $COMPRESSED"
    echo "Files deleted: $DELETED"
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Process finished"
    echo "-----------------------------------"
}

main