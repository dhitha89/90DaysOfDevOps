# 1. Process checks
- **ps**  -->list active processes
  PID TTY          TIME CMD
  556548 pts/8    00:00:00 zsh
  807673 pts/8    00:00:00 ps

- **ps aux**  --> list all processess
  USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
  root           1  0.0  0.0  23052 12988 ?        Ss   Jan29   0:17 /sbin/init
  root           2  0.0  0.0   3072  1760 ?        Sl   Jan29   0:00 /init
  root           6  0.0  0.0   3160  2488 ?        Sl   Jan29   0:09 plan9 --control-socket 7 --log-level 4 --server-fd 8 --pipe
  root          66  0.0  0.1  50516 17608 ?        S<s  Jan29   0:09 /usr/lib/systemd/systemd-journald
  root         116  0.0  0.0  26140  6864 ?        Ss   Jan29   0:24 /usr/lib/systemd/systemd-udevd
  root         137  0.0  0.0 152936  1232 ?        Ssl  Jan29   0:00 snapfuse /var/lib/snapd/snaps/bare_5.snap /snap/bare/5 -o r
  root         139  0.0  0.0 152936  1056 ?        Ssl  Jan29   0:00 snapfuse /var/lib/snapd/snaps/chromium_3343.snap /snap/chro
  root         141  0.0  0.0 153068  1056 ?        Ssl  Jan29   0:00 snapfuse /var/lib/snapd/snaps/chromium_3348.snap /snap/chro

  - **top** --> return process info
  top - 16:10:15 up 19:32,  1 user,  load average: 0.00, 0.00, 0.03
  Tasks: 123 total,   1 running, 122 sleeping,   0 stopped,   0 zombie
  %Cpu(s):  0.0 us,  0.0 sy,  0.0 ni, 99.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
  MiB Mem :  15704.7 total,  13452.9 free,   1434.9 used,   1089.1 buff/cache
  MiB Swap:   4096.0 total,   4096.0 free,      0.0 used.  14269.8 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
  613 root      20   0 1308240  61952  46112 S   0.3   0.4   0:27.55 gitlab-runner
  31946 root      20   0  223528  29364  23136 S   0.3   0.2   0:06.61 apache2
  1 root      20   0   23052  12988   9116 S   0.0   0.1   0:18.01 systemd
  2 root      20   0    3072   1760   1760 S   0.0   0.0   0:00.08 init-systemd(Ub
  6 root      20   0    3160   2488   1936 S   0.0   0.0   0:09.14 init
  66 root      19  -1   50516  17608  16728 S   0.0   0.1   0:09.73 systemd-journal

  - **pgrep** (searches process by its names and returns their PID)
  ~ pgrep php  --> return PID of all php process
  32121
  790900

  ➜  ~ pgrep -l php --> PID with process name
  32121 php
  790900 php8.2
  
  ➜  ~ pgrep -a php --> returns full details with php process PID
  32121 /usr/bin/php -d variables_order=EGPCS /var/www/html/artisan serve --host=0.0.0.0 --port=80
  790900 /usr/bin/php8.2 -S 0.0.0.0:80 /var/www/html/server.php

  ➜  ~ pgrep -x php --> PID of process matching exactly named "php"
  32121
  
  ➜  ~ pgrep -d, php --> PID of newest php process seperated by comma
  32121,790900
  
  ➜  ~ pgrep -n php --> PID of newest php process
  790900
  
  ➜  ~ pgrep -o php --> PID of oldest php process
  32121

# 2. Service checks
- **systemctl** manages system services in Linux like 
  * nginx
  * apache
  * docker
  * mysql

- **systemctl status ssh** --> status of nginx service
  systemctl status ssh
  ○ ssh.service - OpenBSD Secure Shell server
  Loaded: loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled)
  Active: inactive (dead)
  TriggeredBy: ● ssh.socket
  Docs: man:sshd(8)
  man:sshd_config(5)

- **systemctl start nginx** --> start nginx service 
- **systemctl stop nginx** --> stop nginx service
- **systemctl reload nginx** --> reload nginx service
- **systemctl enable nginx** --> enable nginx service
- **systemctl list-units --type=service** --> list services

# 3. Log checks
- **journalctl -xe** --> Print log entries from the systemd journal
  ~ journalctl -xe | tail -2
  Jan 29 18:09:27 Aahan wsl-pro-service[577]: INFO Daemon: connecting to Windows Agent
  Jan 29 18:09:27 Aahan wsl-pro-service[577]: DEBUG Updated systemd status to "Connecting"

