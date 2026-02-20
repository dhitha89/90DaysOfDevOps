Target Service : nginx
-------------------------------------------------------------------
# Environment Basics:
-------------------------------------------------------------------
➜  day5 **uname -a**
Linux Aahan 6.6.87.2-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

➜  day5 **cat /etc/os-release**
PRETTY_NAME="Ubuntu 24.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.2 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo

-------------------------------------------------------------------
# Filesystem Sanity
-------------------------------------------------------------------
➜  day5 **mkdir /tmp/runbook-demo**
➜  day5 **cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo**
total 4
-rw-r--r-- 1 sharmila sharmila 407 Feb 20 15:40 hosts-copy

##### This shows the filesystem is writable

-------------------------------------------------------------------
# CPU and Memory Usage
-------------------------------------------------------------------
day5 ps **aux | grep nginx**
root         697  0.0  0.0  11196  1516 ?        Ss   03:44   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data     698  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     699  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     700  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
www-data     701  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     702  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     703  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     704  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     705  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     707  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
www-data     708  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     709  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     710  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
www-data     711  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     712  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     713  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     714  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
www-data     715  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
www-data     716  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     717  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     718  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     719  0.0  0.0  12880  4332 ?        S    03:44   0:00 nginx: worker process
www-data     720  0.0  0.0  12880  4156 ?        S    03:44   0:00 nginx: worker process
sharmila   67079  0.0  0.0   4092  1936 pts/2    S+   15:44   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox --exclude-dir=.venv --exclude-dir=venv nginx

➜  day5 **ps -o pid,pcpu,pmem,comm -p 697**
PID %CPU %MEM COMMAND
697  0.0  0.0 nginx

➜  day5 **ps -o pid,pcpu,pmem,comm -p 720**
PID %CPU %MEM COMMAND
720  0.0  0.0 nginx

##### The CPU usage of nginx is really low 

➜  day5 **free -h**
                total        used        free      shared  buff/cache   available
Mem:            15Gi       1.0Gi        13Gi       6.9Mi       777Mi        14Gi
Swap:          4.0Gi          0B       4.0Gi

Total → 15 GB available and Used → 1 GB

##### So 90% RAM free, system relaxed, no pressure, nginx not heavy

-------------------------------------------------------------------
# DISK I/O
-------------------------------------------------------------------
➜  day5 **df -h**
Filesystem      Size  Used Avail Use% Mounted on
none            7.7G     0  7.7G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
none            7.7G  4.0K  7.7G   1% /mnt/wsl
drivers         952G  337G  616G  36% /usr/lib/wsl/drivers
/dev/sdd       1007G   78G  879G   9% /
none            7.7G  628K  7.7G   1% /mnt/wslg
none            7.7G     0  7.7G   0% /usr/lib/wsl/lib
_rootfs          7.7G  2.7M  7.7G   1% /init_
C:\             952G  337G  616G  36% /mnt/c

##### Status: Very healthy, disk is Not full, No disk pressure

➜  day5 **du -sh /var/log/nginx**
40K        /var/log/nginx

##### Logs very small,  No disk pressure from nginx

-------------------------------------------------------------------
# NETWORK
-------------------------------------------------------------------
➜  day5 **sudo apt install net-tools -y**
➜  day5 **sudo netstat -tulpn | grep :80**
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      697/nginx: master p
tcp6       0      0 :::80                   :::*                    LISTEN      697/nginx: master p

##### Port 80 listening on all IPv4 addresses, ready to accept connections, works for IPv6 too and nginx running
##### So port 80 open, network working, service reachable 

➜  day5 **curl -I http://localhost**
HTTP/1.1 200 OK
Server: nginx/1.24.0 (Ubuntu)
Date: Fri, 20 Feb 2026 16:02:56 GMT
Content-Type: text/html
Content-Length: 615
Last-Modified: Sat, 31 Jan 2026 05:03:22 GMT
Connection: keep-alive
ETag: "697d8d1a-267"
Accept-Ranges: bytes
##### Service reachable on port 80, so both Network and nginx working

-------------------------------------------------------------------
# LOGS
-------------------------------------------------------------------
➜  ~ **journalctl -u nginx -n 50**
Feb 19 10:09:33 Aahan systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy server...
Feb 19 10:09:33 Aahan systemd[1]: Started nginx.service - A high performance web server and a reverse proxy server.
Feb 19 10:11:28 Aahan systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy server...
Feb 19 10:11:28 Aahan systemd[1]: Started nginx.service - A high performance web server and a reverse proxy server.

##### nginx started cleanly, service stable
##### Only start events present, no errors,no crashes,no restarts 

➜  ~ **tail -n 50 /var/log/nginx/access.log**
::1 - - [20/Feb/2026:16:18:07 +0100] "HEAD / HTTP/1.1" 200 0 "-" "curl/8.5.0"
::1 - - [20/Feb/2026:17:02:42 +0100] "GET / HTTP/1.1" 200 615 "-" "curl/8.5.0"
::1 - - [20/Feb/2026:17:02:56 +0100] "HEAD / HTTP/1.1" 200 0 "-" "curl/8.5.0"

##### nginx responded successfully, requests reached server, responses returned OK

➜  ~ **tail -n 50 /var/log/nginx/error.log**
➜  ~

##### No Failures seen
-------------------------------------------------------------------
## Quick findings:
-------------------------------------------------------------------
Check	        |   Result
Disk	        |   9% used
Logs size	    |   40K only
Memory	        |   14GB free
Port	        |   80 listening
Service logs    |	clean start
Access logs	    |   HTTP 200

## If This Worsens
1. systemctl restart nginx
2. check error.log for crash or failure info
3. increase log level
4. check disk space
5. check network connection