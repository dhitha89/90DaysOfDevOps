# Linux Commands Cheatsheet

## 1. Filesystem Commands

| Command              | Description                                            |
| -------------------- | ------------------------------------------------------ |
| `pwd`                | Print current working directory                        |
| `cd ~`               | Change to home directory                               |
| `cd /`               | Change to root directory                               |
| `ls -la`             | List all files with details, including hidden          |
| `mkdir <dir>`        | Create a new directory                                 |
| `touch <file>`       | Create a new empty file                                |
| `cat <file>`         | Display file contents                                  |
| `nano <file>`        | Open file in the nano text editor                      |
| `echo "text"`        | Print text to terminal (or redirect to file with `>`)  |
| `head -n 10 <file>`  | Show first 10 lines of a file                          |
| `tail -n 10 <file>`  | Show last 10 lines of a file                           |
| `mv <src> <dst>`     | Move or rename files                                   |
| `cp <src> <dst>`     | Copy files or directories                              |
| `rm -f <file>`       | Force-remove a file                                    |
| `cmp file1 file2`    | Compare two files byte by byte                         |

---

## 2. Process Management

| Command          | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| `ps`             | Show processes for the current shell                         |
| `ps aux`         | Show all running processes with details                      |
| `top`            | Interactive process viewer                                   |
| `htop`           | Interactive process viewer (colored, friendlier than `top`)  |
| `kill <PID>`     | Terminate a process by its PID                               |
| `killall <name>` | Kill all processes matching a process name                   |

---

## 3. Disk & Memory Usage

| Command        | Description                                          |
| -------------- | ---------------------------------------------------- |
| `df -h`        | Show disk space usage by filesystem (human-readable) |
| `du -h <dir>`  | Show directory size in human-readable format         |
| `free -h`      | Show memory usage in human-readable format           |
| `free -g`      | Show memory usage in gigabytes                       |

---

## 4. Network & Troubleshooting

| Command                  | Description                                |
| ------------------------ | ------------------------------------------ |
| `ip addr`                | Show network interfaces and IP addresses   |
| `ping google.com`        | Test network connectivity to a host        |
| `nslookup google.com`    | Query DNS nameserver for domain info       |
| `dig google.com`         | Detailed DNS lookup information            |
| `curl http://localhost`  | Transfer data from a URL                   |
| `wget <url>`             | Download a file from the web               |
| `journalctl -xe`         | Show recent system logs with explanations  |
| `journalctl -u nginx`    | Show logs for the nginx service            |

---

## 5. User Management

| Command                               | Description                  |
| ------------------------------------- | ---------------------------- |
| `whoami`                              | Display current username     |
| `who`                                 | Show logged-in users         |
| `id`                                  | Display user and group IDs   |
| `sudo groupadd group-test`            | Create a new group           |
| `sudo usermod -aG group-test user1`   | Add user1 to group-test      |

---

## 6. System & Utilities

| Command                  | Description                                |
| ------------------------ | ------------------------------------------ |
| `history`                | Show command history                       |
| `grep "pattern" <file>`  | Search for text patterns inside files      |
| `sudo apt update`        | Update package repository (Debian/Ubuntu)  |
| `clear`                  | Clear the terminal screen                  |
| `hostname`               | Display the system hostname                |
| `date`                   | Show the current date and time             |
