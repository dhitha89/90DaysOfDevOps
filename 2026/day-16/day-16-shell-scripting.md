**Observation from Day16 task**
**********************************************
- What happens if you remove the shebang line?
- Try using single quotes vs double quotes for variables— what's the difference?
  Variable within double quotes are substituted with actual value and within single quotes ae treated as strings.


### Task 1: Your First Script
Code:
------
#!/bin/bash
echo "Hello Devops!"

Output:
--------
➜  shellscript ./hello.sh
Hello Devops!

__________________________________________________________________________________________________________

### Task 2: Variables
Code:
------
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your role: " ROLE

echo "Hello, I am $NAME and I am a $ROLE"
echo 'Hello, I am $NAME and I am a $ROLE'

Output:
--------
➜  shellscript ./variable.sh
Enter your name: Sharmila
Enter your role: PHP Developer
Hello, I am Sharmila and I am a PHP Developer
Hello, I am $NAME and I am a $ROLE

__________________________________________________________________________________________________________

### Task 3: User Input with read
Code:
------
#!/bin/bash

read -p "Enter your name: " NAME
read -p "What is your favourite tool: " TOOL

echo "Hello $Name, yOur favourite tool is $TOOL. Have a nice day :) "

Output:
--------
➜  shellscript ./greet.sh
Enter your name: Sharmila
What is your favourite tool: Docker
Hello , yOur favourite tool is Docker. Have a nice day :)

__________________________________________________________________________________________________________

### Task 4: If-Else Conditions
**Check whether number is positive, negative, or zero**

Code:
------

#!/bin/bash
read -p " Please enter the number to be checked: " NUMBER

if [ $NUMBER -gt 0 ]; then
    echo "The number is positive :)"
elif [ $NUMBER -lt 0 ]; then
    echo "The number is negative :("
else
    echo "The number is zero !"
fi

Output:
--------
shellscript ./check_number.sh
Please enter the number to be checked: 2
The number is positive :)
➜  shellscript ./check_number.sh
Please enter the number to be checked: 0
The number is zero !
➜  shellscript ./check_number.sh
Please enter the number to be checked: -6
The number is negative :(
➜  shellscript


**Check if file exists**

Code:
------
#!/bin/bash
read -p " Enter the file name to be checked: " file_name

if [ -f $file_name ]; then
echo "File already exists"
else
echo "File doesnt exists"
fi

Output:
--------
➜  shellscript pwd
/home/sharmila/TWS/shellscript
➜  shellscript ./file_check.sh
Enter the file name to be checked: /home/sharmila/TWS/shellscript/greet.sh
File already exists
➜  shellscript ./file_check.sh
Enter the file name to be checked: /etc/passwd
File already exists
➜  shellscript ./file_check.sh
Enter the file name to be checked: testshar.sh
File doesnt exists

__________________________________________________________________________________________________________

Task 5:

Code:
------
#!/bin/bash
read -p "Enter the service name: " SERVICE_NAME
read -p "Do you want to check the status? (y/n): " STATUS
if [ $STATUS = "y" ]; then
systemctl status $SERVICE_NAME
else
echo "Checking skipped!"
fi


Output:
--------
shellscript ./server.sh
Enter the service name: nginx
Do you want to check the status? (y/n): y
● nginx.service - A high performance web server and a reverse proxy server
Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: enabled)
Active: active (running) since Sat 2026-01-31 06:03:24 CET; 1 week 2 days ago
Docs: man:nginx(8)
Main PID: 893472 (nginx)
Tasks: 23 (limit: 18833)
Memory: 15.7M (peak: 35.8M)
CPU: 2.455s
CGroup: /system.slice/nginx.service
├─893472 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
├─893474 "nginx: worker process"
├─893475 "nginx: worker process"
├─893476 "nginx: worker process"
├─893477 "nginx: worker process"
├─893478 "nginx: worker process"
├─893479 "nginx: worker process"
├─893480 "nginx: worker process"
├─893481 "nginx: worker process"
├─893482 "nginx: worker process"
├─893483 "nginx: worker process"
├─893484 "nginx: worker process"
├─893485 "nginx: worker process"
├─893486 "nginx: worker process"
├─893487 "nginx: worker process"
├─893488 "nginx: worker process"
├─893489 "nginx: worker process"
├─893490 "nginx: worker process"
├─893491 "nginx: worker process"
├─893492 "nginx: worker process"
├─893493 "nginx: worker process"
├─893494 "nginx: worker process"
└─893495 "nginx: worker process"

Notice: journal has been rotated since unit was started, output may be incomplete.
➜  shellscript ./server.sh
Enter the service name: nginx
Do you want to check the status? (y/n): n
Checking skipped!