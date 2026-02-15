## SCript information
There are 4 scripts created w.r.t to this task which are as below:
* backup.sh
* log_rotate.sh
* maintainence.sh
* healt_check.sh
The scripts of these files are uploaded in the current folder day-19


## Crontab enteries
COMMON_PATH=/home/sharmila/TWS/backup_log_rotate
# Daily maintenance at 1 AM
0 1 * * * $COMMON_PATH/maintenance.sh

# Log rotation at 2 AM daily
0 2 * * * $COMMON_PATH/log_rotate.sh /home/sharmila/TWS/log_files >> $COMMON_PATH/log/log_rotation.log 2>&1

# Backup every Sunday at 3 AM
0 3 * * 0 $COMMON_PATH/backup.sh /home/sharmila/TWS/shellscript /home/sharmila/TWS/backups >> $COMMON_PATH/log/backup.log 2>&1

# Health check every 5 minutes
*/5 * * * * $COMMON_PATH/health_check.sh >> $COMMON_PATH/health_check.log 2>&1

## Running maintainence.sh
➜  log_files ls -la
total 52
drwxr-xr-x  2 sharmila sharmila 4096 Feb 15 15:56 .
drwxr-xr-x 15 sharmila sharmila 4096 Feb 15 15:16 ..
-rw-r--r--  1 sharmila sharmila   12 Feb 15 15:56 app-log-0.log
-rw-r--r--  1 sharmila sharmila   12 Feb 12 15:56 app-log-1.log
-rw-r--r--  1 sharmila sharmila   12 Feb  9 15:56 app-log-2.log
-rw-r--r--  1 sharmila sharmila   12 Feb  6 15:56 app-log-3.log
-rw-r--r--  1 sharmila sharmila   12 Feb  3 15:56 app-log-4.log
-rw-r--r--  1 sharmila sharmila   12 Jan 31 15:56 app-log-5.log
-rw-r--r--  1 sharmila sharmila   12 Jan 28 15:56 app-log-6.log
-rw-r--r--  1 sharmila sharmila   12 Jan 25 15:56 app-log-7.log
-rw-r--r--  1 sharmila sharmila   12 Jan 22 15:56 app-log-8.log
-rw-r--r--  1 sharmila sharmila   12 Jan 19 15:56 app-log-9.log
-rwxr-xr-x  1 sharmila sharmila  246 Feb 15 15:16 create_logfile.sh
➜  log_files cd ..
➜  TWS cd backup_log_rotate
➜  backup_log_rotate ./maintainence.sh
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Starting maintenance
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Running log rotation...
2026-02-15 15:57:20: Running backup...
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Completed maintenance
2026-02-15 15:57:20: ==========================================
➜  backup_log_rotate cd log
➜  log ls
maintenance.log
➜  log nano maintenance.log

## Output saved in  maintenance.log

GNU nano 7.2                                                      
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Starting maintenance
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Running log rotation...
Starting log rotation for: /home/sharmila/TWS/log_files
Compressing 7 log files older than 7 days...
No compressed files older than 30 days found to delete
-----------------------------------
Log rotation completed
Files compressed: 7
Files deleted: 0
2026-02-15 15:57:20: Process finished
-----------------------------------
2026-02-15 15:57:20: Running backup...
Starting backup...
Source: /home/sharmila/TWS/shellscript
Destination: /home/sharmila/TWS/backups/backup-2026-02-15_155720.tar.gz
-----------------------------------
Backup created: backup-2026-02-15_155720.tar.gz
Size: 2.1K
-----------------------------------
No old backups to clean up
-----------------------------------
Backup process completed
New backup: backup-2026-02-15_155720.tar.gz (2.1K)
Total backups deleted: 0
-----------------------------------
2026-02-15 15:57:20: ==========================================
2026-02-15 15:57:20: Completed maintenance
2026-02-15 15:57:20: ==========================================


