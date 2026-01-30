# Cheatsheet
**1. Filesystem Commands**
pwd --> Print current working directory
cd ~ --> Change to home directory
cd / --> Change to root directory
ls -la --> List all files with details including hidden
mkdir -->Create new directory
touch -->Create new file
cat   -->Display file contents
nano  -->Open text editor
echo  -->Print text to terminal or file
tail -n file    --> Show last n lines of file
head -n file    --> Show first n lines of file
mv    -->Move or rename files
cp    -->Copy files or directories
rm -f -->Force remove files 
cmp file1 file2 --> Compare two files 

**2. Process management commands**
ps    -->Show running processes
ps aux-->Show all processes with details
top   -->Interactive process 
htop  -->highlighted interactive process 
kill PID  --> Terminate process by process ID
killall file1   --> Kill all processes matching name


**3.Diskusage Commands:**
df    -->Show disk space usage by filesystem
du -h -->Show directory size in human-readable format
free -h   --> Show memory usage in human-readable format
free -g   --> Show memory usage in gigabytes

**4.Network Trouble shooting commands**
ip addr   --> Show network interface IP addresses
ping google.com --> Test network connectivity to host
nslookup google.com   --> Query DNS nameserver for domain info
dig google.com  --> Detailed DNS lookup information
curl http://localhost -->Transfer data from URL
wget link --> Download files from web
journalctl -xe  --> Show recent system logs with explanations
journalctl -u nginx --> Show logs for nginx

**5.User management commands**
whoami-->Display current username
who   -->Show logged-in users
id    -->Display user and group IDs
groupadd group-test --> Create new group
usermod -aG group-test user1  # Add user to group

**6. System Commands**
history   --> Show command history
grep  -->Search text patterns in files
sudo apt update --> Update package repository (Debian/Ubuntu)
clear -->Clear terminal screen
hostname  --> Display system hostname
date  -->Show current date and time