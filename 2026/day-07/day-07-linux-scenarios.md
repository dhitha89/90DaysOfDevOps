**Scenario 1: Service Not Starting**
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.

Step 1
systemctl status nginx
Why - To check status of nginx if running or not

Step 2
systemctl list-units --type=service
Why - To see service present on system or not.

Step 3 systemctl is-enabled nginx
Why - to see is this service set to start when system boot on default.


**Scenario 2: High CPU Usage**
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?

Step 1
htop/top
Why - see all the processes running with their cpu usage.

Step 2
ps aux --sort=-%cpu | head -10
Why - Sort processes and get PID of process having higher cpu usage.


**Scenario 3: Finding Service Logs**
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?

Step 1
systemctl status docker
Why - Check status first.

Step 2
journalctl -u docker -n 50
Why - To get last 50 lines of docker service logs.

Step 3 journalctl -u docker -f
Why - -f flag to get real-time logs.


**Scenario 4: File Permissions Issue**
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"

What commands would you use to fix this?

Step 1: 
ls -l /home/user/backup.sh
why - Check current permissions

Step 2: 
chmod +x /home/user/backup.sh
why - Add execute permission

Step 3: 
ls -l /home/user/backup.sh
why - Verify it worked

Step 4: 
./backup.sh
why - Executing bash script