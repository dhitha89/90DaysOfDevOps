#!/bin/bash
set -uo pipefail

<< readme
Daily maintenance scripts that calls log rotation and backups
readme

LOG_FILE="/home/sharmila/TWS/backup_log_rotate/log/maintenance.log"
LOG_DIR="/home/sharmila/TWS/log_files"
SOURCE_DIR="/home/sharmila/TWS/shellscript"
BACKUP_DIR="/home/sharmila/TWS/backups"

LOG_ROTATE_SUCCESS=0
BACKUP_SUCCESS=0
FAILED=0

log_msg() {
  echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" | tee -a "$LOG_FILE"
}

log_rotation() {
  log_msg "Running log rotation..."
  /home/sharmila/TWS/backup_log_rotate/log_rotate.sh "$LOG_DIR" >> "$LOG_FILE" 2>&1|| FAILED=1
}

run_backup() {
  log_msg "Running backup..."
  /home/sharmila/TWS/backup_log_rotate/backup.sh "$SOURCE_DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1|| FAILED=1
}

main() {
  log_msg "=========================================="
  log_msg "Starting maintenance"
  log_msg "=========================================="

  log_rotation
  run_backup
  log_msg "=========================================="
  log_msg "Completed maintenance"
  log_msg "=========================================="
  log_msg "Maintenance finished"

  [ $FAILED -eq 1 ] && exit 1
   exit 0
}

main