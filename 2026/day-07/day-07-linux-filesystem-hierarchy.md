##### / — Root folder
The absolute top of the filesystem 
Every single file and directory on the system lives under here. Think of it as the trunk of the entire directory tree.
NOTE: Used when navigating to full filesystem or troubleshoot system-wide issues.
**ls -l /**
total 2832
drwxr-xr-x   3 root root    4096 Jan 11  2025 Docker
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwx------   2 root root   16384 Dec  1  2024 lost+found
drwxr-xr-x   2 root root    4096 Sep 27  2024 media
drwxrwxrwx   6 root root    4096 Oct 21 12:31 mnt
drwxr-xr-x   7 root root    4096 Feb  4 02:14 opt
dr-xr-xr-x 531 root root       0 Feb 26 13:26 proc
drwx------  12 root root    4096 Feb 21 05:35 root
drwxr-xr-x  31 root root     900 Feb 26 13:26 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxrwxrwt  13 root root   61440 Feb 26 22:49 tmp
drwxr-xr-x  12 root root    4096 Sep 27  2024 usr
drwxr-xr-x  14 root root    4096 Jan 31 06:03 var


##### /home — User Home Directories
Stores personal directories for each user on the system. Each user gets their own subfolder (e.g., /home/ubuntu).
NOTE: Used when looking for a user's personal files.
**ls -l /home** 
drwxr-x--- 41 sharmila      sharmila      4096 Feb 26 22:52 sharmila
drwxr-x---  2 test1         test1         4096 Feb  7 07:31 test1
drwxr-x---  2 test2         test2         4096 Feb  7 07:31 test2
drwxr-x---  2 test3         test3         4096 Feb  7 07:31 test3
drwxr-x---  4 tokyo         tokyo         4096 Feb  4 01:34 tokyo


##### /root — Root User's Home
Home directory of the root (admin) user only.
NOTE: Used when logged in as root and needing to access or configure the superuser's environment.
**sudo ls -l /root**
total 8
drwxr-xr-x  3 root root 4096 Dec  6  2024 datascientest_architecture
drwx------ 11 root root 4096 Oct  6 01:34 snap

#####  /etc — System Configuration Files
Folder contains plain-text config files for almost every installed application and service (nginx, SSH, users, etc.).
NOTE: Used when editing server settings, changing network configuration, or managing user accounts via /etc/passwd.
**ls -l /etc**
rwxr-xr-x 2 root root      4.0K Apr 18  2024 netplan
drwxr-xr-x 6 root root      4.0K Dec  4  2024 network
drwxr-xr-x 8 root root      4.0K Sep 27  2024 networkd-dispatcher
-rw-r--r-- 1 root root        91 Apr 22  2024 networks
drwxr-xr-x 2 root root      4.0K Sep 27  2024 newt
-rwxr-xr-x 1 root root       243 Oct 19  2023 nftables.conf
drwxr-xr-x 8 root root      4.0K Feb 14 06:46 nginx
-rw-r--r-- 1 root root       558 Oct  1 16:17 nsswitch.conf
drwxr-xr-x 4 root root      4.0K Dec  8 06:49 openvpn
drwxr-xr-x 2 root root      4.0K Sep 27  2024 opt
lrwxrwxrwx 1 root root        21 Feb  5  2025 os-release -> ../usr/lib/os-release
-rw-r--r-- 1 root root       552 Oct 13  2022 pam.conf
drwxr-xr-x 2 root root      4.0K Oct  1 16:17 pam.d
-rw-r--r-- 1 root root      2.6K Feb 22 01:18 passwd
-rw-r--r-- 1 root root      2.6K Feb  7 07:44 passwd-
drwxr-xr-x 3 root root      4.0K Sep 27  2024 perl
drwxr-xr-x 6 root root      4.0K Oct  1 16:12 php
drwxr-xr-x 3 root root      4.0K Sep 27  2024 pm
drwxr-xr-x 3 root root      4.0K Sep 27  2024 polkit-1
-rw-r--r-- 1 root root       582 Apr 22  2024 profile


##### /var/log — Log Files 
This folder stores continuously updated log files written by the OS and applications.
NOTE: Used when debugging server crashes, Docker issues, Nginx errors, Laravel production problems.
**ls -l /var/log**
total 16044
lrwxrwxrwx  1 root       root                 39 Sep 27  2024 README -> ../../usr/share/doc/systemd/README.logs
-rw-r--r--  1 root       root                798 Feb 24 14:09 alternatives.log
drwxr-xr-x  2 root       root               4096 Feb 25 08:32 apt
drwxr-xr-x  2 root       root               4096 Feb 27 00:12 atop
-rw-r-----  1 syslog     adm              198849 Feb 27 07:40 auth.log
-rw-r-----  1 syslog     adm              362340 Feb 23 00:00 auth.log.1
-rw-r-----  1 syslog     adm               14268 Feb 12 00:00 auth.log.2.gz
-rw-r--r--  1 root       root             118497 Sep 27  2024 bootstrap.log
-rw-rw----  1 root       utmp                768 Feb  4 00:59 btmp
-rw-rw----  1 root       utmp               1152 Jan 31 06:36 btmp.1
drwxr-xr-x  2 root       root               4096 Sep  5  2024 dist-upgrade
-rw-r-----  1 root       adm               80670 Feb 26 13:26 dmesg
-rw-r-----  1 root       adm               36568 Feb 26 13:23 dmesg.0
-rw-r--r--  1 root       root              40914 Feb 25 08:32 dpkg.log
-rw-r--r--  1 root       root              42876 Feb  1 06:01 dpkg.log.1


##### /tmp — Temporary Files
Temporary files. Auto-deleted after reboot.
NOTE: Used for storing temporary uploads, test files, or scripts that don’t need to be saved.
**ls -l /tmp** 
drwxr-xr-x  3 sharmila sharmila 4096 Feb 26 13:27 VFXZjW
drwx------ 35 sharmila sharmila 4096 Feb 26 15:45 dusk-profile-414881-90768a74
drwx------  5 root     root     4096 Feb 26 23:38 snap-private-tmp
drwx------  3 root     root     4096 Feb 26 13:26 systemd-private-b80e488d62174daf8838a849aab590cd-wsl-pro.service-YPciXq
drwx------  3 sharmila sharmila 4096 Feb 26 13:27 tmp.mkq52Bufhw


##### /bin → Binary files
Contains essential system commands required for booting.
NOTE: Used when running core commands like ls, cp, mv, even in recovery mode.
**ls-l /bin**
lrwxrwxrwx 1 root root 7 Apr 22  2024 /bin -> usr/bin


##### /usr/bin — Essential Binaries
This is where all the core command-line programs live: ls, cp, grep, python3, etc.
NOTE: I would use this when checking whether a tool is installed (which python3) or exploring what executables are available on the system.
**ls -l /usr/bin**
-rwxr-xr-x 1 root root       310416 Jan  5 23:01  gpgv
lrwxrwxrwx 1 root root            3 Mar 31  2024  gpic -> pic
lrwxrwxrwx 1 root root           22 Dec  3 16:01  gprof -> x86_64-linux-gnu-gprof
lrwxrwxrwx 1 root root           24 Dec  3 16:01  gprofng -> x86_64-linux-gnu-gprofng
-rwxr-xr-x 1 root root       186824 Apr  8  2024  grep
-rwxr-xr-x 1 root root        22840 Jan 28 18:53  gresource
-rwxr-xr-x 1 root root        35336 Apr  5  2024  groups
-rwxr-xr-x 1 root root       142312 Apr  5  2024  ls
-rwxr-xr-x 1 root root        14656 Apr 29  2024  lsattr
-rwxr-xr-x 1 root root         2651 Jul  5  2023  lsb_release
-rwxr-xr-x 1 root root       149896 Dec  5  2024  lsblk
-rwxr-xr-x 1 root root       113032 Dec  5  2024  lscpu
-rwxr-xr-x 1 root root       903656 Sep 18  2022  lshw
-rwxr-xr-x 1 root root        51584 Dec  5  2024  lsipc
-rwxr-xr-x 1 root root        31504 Dec  5  2024  lslocks
-rwxr-xr-x 1 root root        51584 Dec  5  2024  lslogins
-rwxr-xr-x 1 root root        39296 Dec  5  2024  lsmem
lrwxrwxrwx 1 root root            4 Oct  2  2024  lsmod -> kmod
-rwxr-xr-x 1 root root        43400 Dec  5  2024  lsns
-rwxr-xr-x 1 root root       175784 Mar 31  2024  lsof


##### /opt — Optional / Third-Party Applications
Optional or third-party software installed manually.
NOTE: Used while installing custom apps or enterprise tools outside the system packages.
**ls -l /opt**
drwx--x--x 4 root root         4096 Dec  4  2024 containerd
drwxrwxr-x 2 root developers   4096 Feb  4 02:04 dev-project
drwxr-xr-x 3 root root         4096 Oct  2 16:53 google
drwxrwxr-x 2 root project-team 4096 Feb  4 02:18 team-workspace
drwxr-xr-x 4 root root         4096 Dec  4  2024 vagrant

**➜  ~ du -sh /var/log/* 2>/dev/null | sort -h | tail -5**
912K    /var/log/syslog.3.gz
4.2M    /var/log/syslog
8.0M    /var/log/syslog.1
182M    /var/log/atop
436M    /var/log/journal

**cat /etc/hostname**
Aahan

**ls -la ~**
total 616504
drwxr-x--- 41 sharmila sharmila      4096 Feb 27 16:26 .
drwxr-xr-x 21 root     root          4096 Feb  7 07:44 ..
drwxr-xr-x  4 sharmila sharmila      4096 May 12  2025 .ansible
lrwxrwxrwx  1 sharmila sharmila        23 Jan 11  2025 .aws -> /mnt/c/Users/arunk/.aws
lrwxrwxrwx  1 sharmila sharmila        25 Jan 11  2025 .azure -> /mnt/c/Users/arunk/.azure
-rw-------  1 sharmila sharmila     23959 Oct  1 16:37 .bash_history
-rw-r--r--  1 sharmila sharmila       220 Dec  1  2024 .bash_logout
-rw-r--r--  1 sharmila sharmila      3803 Nov 28 10:04 .bashrc
drwx------ 13 sharmila sharmila      4096 Dec 31 11:25 .cache
drwxr-xr-x  9 sharmila sharmila      4096 Jan 30 15:30 .config