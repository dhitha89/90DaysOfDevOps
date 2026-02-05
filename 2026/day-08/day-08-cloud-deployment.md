**Commands Used**
* ssh -i "tws-ec2-keypair.pem" ubuntu@<ip>.compute-1.amazonaws.com
* sudo apt update
* sudo apt install nginx
* sudo systemctl nginx start
* sudo systemctl nginx status

* sudo apt install docker.io
* docker --verion
* journalctl -u nginx
* jourrnalctl -u nginx >> nginxlogs.txt
* exit

## From local machine:
* scp -i "tws-ec2-keypair.pem" ubuntu@e<ip>.compute-1.amazonaws.com:~/nginxlogs.txt .
* cat nginxlogs.txt

## Work flow to see teh nginx page 
* launch ec2 instance on AWS
* ssh into the ec2 instance
* install nginx on the instance
* on aws console select the ec2 instance
  --> security tab--> select security group-->edit inbound rules-->add rule (HTTP,TCP,80, anyhere ipv4,nginx)-->save
* go to Details tab of ec2 instance-->click public ip -->access nginx via : http://public ip