## Recalling commands form previous tasks
* ps aux 
* kill -9 PID
* echo "text">> file.txt
* echo "text2"| tee -a file.txt
* cat /etc/passwd
* cat /etc/group
* groups groupname
* sudo usermod -aG groupname user


## Mini Self-Check (write short answers in `day-12-revision.md`)
1) Which 3 commands save you the most time right now, and why?
* command | tail -5 or command | head -5
* ssh -i privatekey user@hostip
* sudo chown owner:grp file
* sudo journalctl -u servicename
* pgrep -l text

2) How do you check if a service is healthy? List the exact 2–3 commands you’d run first.
* ps aux
* systemctl status service

3) How do you safely change ownership and permissions without breaking access? Give one example command.
* sudo chown owner:group filename
* sudo chmod 777 filename (permission number based on requirement)

4) What will you focus on improving in the next 3 days?
Next main focus on Python for Devops and volume management