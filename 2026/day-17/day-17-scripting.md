### Task 1: For Loop
- Loops through a list of 5 fruits and prints each one

Code:
------
#!/bin/bash
fruits=("apple" "orange" "kiwi" "grapes" "melon")

for i in "${fruits[@]}";
do
echo $i
done

Output:
➜  shellscript ./for_loop.sh
apple
orange
kiwi
grapes
melon

2. Create `count.sh` that:
- Prints numbers 1 to 10 using a for loop

Code:
------
#!/bin/bash
echo "Count number from 1 to 10"
for i in {1..10};
do
echo $i
done

Output:
--------
➜  shellscript ./count.sh
Count number from 1 to 10
1
2
3
4
5
6
7
8
9
10

## Task 2: While Loop
1. Create `countdown.sh` that:

Code:
------
                                    
#!/bin/bash

a=5
while [ $a -ge 0 ] ;
do
echo "The value is $a"
a=$((a-1))
done
echo "Countdwn completed!!"

Output
-------
➜  shellscript ./countdown.sh
The value is 5
The value is 4
The value is 3
The value is 2
The value is 1
The value is 0
Countdwn completed!!

### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
    - Accepts a name as `$1`
    - Prints `Hello, <name>!`
    - If no argument is passed, prints "Usage: ./greet.sh <name>"

Code:
------
#!/bin/bash

if [ -z "$1" ]; then
echo "Usage: ./greet.sh <name>"
exit 1
else
echo "Hello, $0!"
fi

Output:
--------
➜  shellscript ./greet.sh
Usage: ./greet.sh <name>
➜  shellscript ./greet.sh Sharmila
Hello, Sharmila!


2. Create `args_demo.sh` that:
    - Prints total number of arguments (`$#`)
    - Prints all arguments (`$@`)
    - Prints the script name (`$0`)

Code:
------
#!/bin/bash

echo "Total number of arguments: $#"
echo "All arguments: $@"
echo "Script name: $0"

Output:
-------
➜  shellscript chmod +x args_demo.sh
➜  shellscript ./args_demo.sh
Total number of arguments: 0
All arguments:
Script name: ./args_demo.sh
➜  shellscript ./args_demo.sh hello, this is sharmila
Total number of arguments: 4
All arguments: hello, this is sharmila
Script name: ./args_demo.sh

### Task 4: Install Packages via Script
Check if package `nginx`, `curl`, `wget` exists

Code:
------
#!/bin/bash

package_list=("nginx" "curl" "wget" "python3")

for i in "${package_list[@]}"
do
echo " Checking package $i "
if  dpkg -s "$i" ; then
echo "package exists"
else
sudo apt update
sudo apt install "$i" -y
sudo systemctl status
fi
done

Output:
-----------
./install_packages.sh
Checking package nginx
Package: nginx
Status: install ok installed
Priority: optional
Section: httpd
Installed-Size: 1320
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: amd64
Version: 1.24.0-2ubuntu7.5
Replaces: nginx-core (<< 1.22.1-6~), nginx-extras (<< 1.22.1-6~), nginx-light (<< 1.22.1-6~)
Provides: httpd, httpd-cgi, nginx-abi-1.24.0-1
Depends: libc6 (>= 2.34), libcrypt1 (>= 1:4.1.0), libpcre2-8-0 (>= 10.22), libssl3t64 (>= 3.0.0), zlib1g (>= 1:1.1.4), iproute2, nginx-common (= 1.24.0-2ubuntu7.5)
Breaks: nginx-core (<< 1.22.1-6~), nginx-extras (<< 1.22.1-6~), nginx-light (<< 1.22.1-6~)
Description: small, powerful, scalable web/proxy server
Nginx ("engine X") is a high-performance web and reverse proxy server
created by Igor Sysoev. It can be used both as a standalone web server
and as a proxy to reduce the load on back-end HTTP or mail servers.
Homepage: https://nginx.org
Original-Maintainer: Debian Nginx Maintainers <pkg-nginx-maintainers@alioth-lists.debian.net>
package exists
Checking package curl
Package: curl
Status: install ok installed
Priority: optional
Section: web
Installed-Size: 521
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: amd64
Multi-Arch: foreign
Version: 8.5.0-2ubuntu10.6
Depends: libc6 (>= 2.34), libcurl4t64 (= 8.5.0-2ubuntu10.6), zlib1g (>= 1:1.1.4)
Description: command line tool for transferring data with URL syntax
curl is a command line tool for transferring data with URL syntax, supporting
DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3,
POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP.
.
curl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading, HTTP form
based upload, proxies, cookies, user+password authentication (Basic, Digest,
NTLM, Negotiate, kerberos...), file transfer resume, proxy tunneling and a
busload of other useful tricks.
Homepage: https://curl.se/
Original-Maintainer: Debian Curl Maintainers <team+curl@tracker.debian.org>
package exists
Checking package wget
Package: wget
Status: install ok installed
Priority: standard
Section: web
Installed-Size: 916
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Architecture: amd64
Multi-Arch: foreign
Version: 1.21.4-1ubuntu4.1
Depends: libc6 (>= 2.38), libidn2-0 (>= 0.6), libpcre2-8-0 (>= 10.22), libpsl5t64 (>= 0.16.0), libssl3t64 (>= 3.0.0), libuuid1 (>= 2.16), zlib1g (>= 1:1.1.4)
Recommends: ca-certificates
Conflicts: wget-ssl
Conffiles:
/etc/wgetrc c43064699caf6109f4b3da0405c06ebb
Description: retrieves files from the web
Wget is a network utility to retrieve files from the web
using HTTP(S) and FTP, the two most widely used internet
protocols. It works non-interactively, so it will work in
the background, after having logged off. The program supports
recursive retrieval of web-authoring pages as well as FTP
sites -- you can use Wget to make mirrors of archives and
home pages or to travel the web like a WWW robot.
.
Wget works particularly well with slow or unstable connections
by continuing to retrieve a document until the document is fully
downloaded. Re-getting files from where it left off works on
servers (both HTTP and FTP) that support it. Both HTTP and FTP
retrievals can be time stamped, so Wget can see if the remote
file has changed since the last retrieval and automatically
retrieve the new version if it has.
.
Wget supports proxy servers; this can lighten the network load,
speed up retrieval, and provide access behind firewalls.
Homepage: https://www.gnu.org/software/wget/
Original-Maintainer: Noël Köthe <noel@debian.org>
package exists


---

### Task 5: Error Handling
**Create `safe_script.sh` that uses `set -e and custom error messages`**

Code:
----------
#!/bin/bash

set -e

mkdir /tmp/devops-test || { echo 'Could not create directory' ; exit 1; }
cd /tmp/devops-test || { echo 'Could not navigate into folder'; exit 1; }
touch testfile.txt || { echo 'Could not create file'; exit 1; }

Output:
-----------
➜  shellscript ./safe_script.sh
mkdir: cannot create directory ‘/tmp/devops-test’: File exists
Could not create directory

**Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.**

Code:
------
#!/bin/bash

if [ "$EUID" -eq 0 ]; then
package_list=("nginx" "curl" "wget" "python3")

        for i in "${package_list[@]}"
        do
                echo " Checking package $i "
                if  dpkg -s "$i" ; then
                        echo "package exists"
                else
                        apt update
                        apt install "$i" -y
                        systemctl status
                fi
        done
else
echo "Login as root user and install packages"
fi

Output:
--------
➜  shellscript whoami
sharmila
➜  shellscript echo $EUID
1000
➜  shellscript ./install_packages.sh
Login as root user and install packages