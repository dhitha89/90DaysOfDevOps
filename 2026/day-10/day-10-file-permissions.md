# Commands Used

-rw-rw-r-- 1 sharmila sharmila  0 Feb  5 00:25 devops.txt
-rw-rw-r-- 1 sharmila sharmila 42 Feb  5 00:32 notes.txt
-rwxrwxr-x 1 sharmila sharmila 20 Feb  5 00:34 script.sh

* devops.txt --> owner read write | group read write |others read permission
* notes.txt --> owner read write | group read write |others read permission
* notes.txt --> owner read write execute| group read write execute|others read permission
* chmod +x script.sh --> make it executable
* chmod 444 devops  --> apply only read permission to owner, group , admin
* chmod u+x script.sh --> make it executable for owner only