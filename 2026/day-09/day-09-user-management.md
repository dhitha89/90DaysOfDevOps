# Commands Used

- sudo useradd professor
- sudo useradd tokyo
- sudo useradd berlin
- sudo passwd berlin
- sudo groupadd developers
- sudo groupadd admins
- cat /etc/passwd | tail -5
- cat /etc/group | tail -5
- sudo gpasswd -a berlin developers
- sudo usermod -aG developers berlin

-groups berlin
- mkdir /opt/dev-project
- sudo chown :developers /opt/dev-project
- sudo chmod 775 /opt/dev-project
- sudo usermod -s /usr/bin/bash berlin
