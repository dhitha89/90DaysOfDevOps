# Day 18 – Shell Scripting: Functions & Slightly Advanced Concepts
## Challenge Tasks

### Task 1: Basic Functions
1. Create `functions.sh` with:
- A function `greet` that takes a name as argument and prints `Hello, <name>!`
- A function `add` that takes two numbers and prints their sum
- Call both functions from the script

Code:
-------
#!/bin/bash
greet(){
echo "Hello, $1!"
}

add(){
SUM=$(( $1+$2 ))
echo "Sum of given numbers is $SUM"
}

greet "Sharmila"

add 5 10

Output:
------------
➜  shellscript ./functions.sh
Hello, Sharmila!
Sum of given numbers is 15



### Task 2: Functions with Return Values
Create `disk_check.sh` with:
- A function `check_disk` that checks disk usage of `/` using `df -h`
- A function `check_memory` that checks free memory using `free -h`
- A main section that calls both and prints the results

Code:
------
#!/bin/bash

check_disk(){
        echo "Checking disk usuage for '/'.....:"
        df -h /
}

check_memory(){
echo "Checking free memory ..."
free -h
}

check_disk
check_memory

Output
---------
➜  shellscript ./disk_check.sh
Checking disk usuage for '/'.....:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdd       1007G   77G  880G   8% /
Checking free memory ...
total        used        free      shared  buff/cache   available
Mem:            15Gi       3.1Gi        10Gi        26Mi       2.0Gi        12Gi
Swap:          4.0Gi          0B       4.0Gi

### Task 3: Strict Mode — `set -euo pipefail`
* Create `strict_demo.sh` with `set -euo pipefail` at the top
* Try using an **undefined variable** — what happens with `set -u`?
* Try a command that **fails** — what happens with `set -e`?
* Try a **piped command** where one part fails — what happens with `set -o pipefail`?

Code:
------
#!/bin/bash

set -eu

#Testing undefined variable
#echo "This is a testvariable: $SHARVAR"
#echo "Task completed!"

#Testing error
#mkdir shartest
#echo "directory created successfully!"

#Testing pipefail
cat shartest.txt |  systemctl status nginx | awk 'NR==3'
echo "nginx status displayed"

**Case 1-> undefined variable**

 with "u" output:
---------------------
➜  shellscript ./strict_demo.sh
./strict_demo.sh: line 6: SHARVAR: unbound variable

without "u" output:
------------------
➜  shellscript ./strict_demo.sh
This is a testvariable:
Task completed!

**Case 2-> error**

with "e" output:
--------
shellscript mkdir shartest
➜  shellscript ./strict_demo.sh
mkdir: cannot create directory ‘shartest’: File exists

without "e" output:
------------------
➜  shellscript ./strict_demo.sh
mkdir: cannot create directory ‘shartest’: File exists
directory created successfully!


with "o pipefail" output:
-----------------
./strict_demo.sh
cat: shartest.txt: No such file or directory
Active: active (running) since Sat 2026-01-31 06:03:24 CET; 1 week 4 days ago

without "o pipefail" output:
------------------
./strict_demo.sh
cat: shartest.txt: No such file or directory
Active: active (running) since Sat 2026-01-31 06:03:24 CET; 1 week 4 days ago
nginx status displayed


**What does each flag do?**
- `set -e` → stop executing on error
- `set -u` → stop when variable is undefined
- `set -o pipefail` → stop when part of the pipe fails

---

### Task 4: Local Variables
Create `local_demo.sh` with:
- A function that uses `local` keyword for variables
- Show that `local` variables don't leak outside the function
- Compare with a function that uses regular variables

Code:
------
#!/bin/bash

GLOBAL_VAR="sharmila_global"
function_local_var(){
local LOCAL_VAR="Sharmila_local"
echo "Local user: $LOCAL_VAR"
echo "Global user: $GLOBAL_VAR"
}

function_regular_var(){
REGULAR_VAR="Sharmila_regular"
echo  "Accessing local variable from other function: $LOCAL_VAR"
}

function_local_var
function_regular_var

echo "Accessing Global Variable: $GLOBAL_VAR"
echo "Accessing Local Variable outside function: $LOCAL_VAR"
echo "Accessing Regular Variable outside function: $REGULAR_VAR"

Output:
--------
shellscript ./local_demo.sh
Local user: Sharmila_local
Global user: sharmila_global
Accessing local variable from other function:
Accessing Global Variable: sharmila_global
Accessing Local Variable outside function:
Accessing Regular Variable outside function: Sharmila_regular


### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
* A function to print **hostname and OS info**
* A function to print **uptime**
* A function to print **disk usage** (top 5 by size)
* A function to print **memory usage**
* A function to print **top 5 CPU-consuming processes**
* A `main` function that calls all of the above with section headers
* Use `set -euo pipefail` at the top

Code:
------
#!/bin/bash

set -euo pipefail

function_host(){
echo "| hostname |"
echo "***********************************"
hostname
echo "| OS info |"
uname -o
}

function_uptime(){
echo "| Uptime |"
echo "***********************************"
uptime
}

function_disk_usage(){
echo "| Disk Usage Top 5 records |"
echo "***********************************"
df -h | sort -k2 -rh | head -6
}

function_memory_usage(){
echo "| Memory Usage |"
echo "***********************************"
free -h | awk '{print $1,$2,$3}'
}

function_cpu_usage(){
echo "| Top 5 CPU Usage process |"
echo "***********************************"
ps aux --sort=-%cpu | head -6
}

function_main(){
echo "=========================================================="
echo "System Information"
echo "=========================================================="
function_host
function_uptime
function_disk_usage
function_memory_usage
function_cpu_usage
echo "=========================================================="
echo "Report Complete"
echo "=========================================================="
}

function_main

Output:
--------
==========================================================
System Information
==========================================================
| hostname |
***********************************
Aahan
| OS info |
GNU/Linux
| Uptime |
***********************************
23:05:05 up 6 days,  9:09,  1 user,  load average: 0.08, 0.09, 0.13
| Disk Usage Top 5 records |
***********************************
/dev/sdd       1007G   77G  879G   9% /
drivers         952G  329G  624G  35% /usr/lib/wsl/drivers
C:\             952G  329G  624G  35% /mnt/c
rootfs          7.7G  2.7M  7.7G   1% /init
none            7.7G  4.0K  7.7G   1% /mnt/wsl
none            7.7G  2.5M  7.7G   1% /run
| Memory Usage |
***********************************
total used free
Mem: 15Gi 2.9Gi
Swap: 4.0Gi 0B
| Top 5 CPU Usage process |
***********************************
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
sharmila 1661408 14.7  0.5 178476 80784 pts/0    Ss+  14:15  77:53 php artisan funnel:import
sharmila    1022  1.4  0.1 106196 19260 pts/0    Ssl+ Feb05 133:44 /tmp/tmp.rame8nPfZj/ijent grpc-server --self-delete-on-exit
1200     1460224  1.2  1.4 13640244 231596 ?     Sl   06:22  12:17 java -Dwebdriver.remote.enableTracing=false -Dwebdriver.httpclient.version=HTTP_1_1 -Dwebdriver.chrome.driver=/usr/bin/chromedriver -Dwebdriver.edge.driver=/usr/bin/msedgedriver -Dwebdriver.gecko.driver=/usr/bin/geckodriver -jar /opt/selenium/selenium-server.jar standalone --session-request-timeout 300 --session-retry-interval 15 --healthcheck-interval 120 --relax-checks true --detect-drivers false --bind-host false --config /opt/selenium/config.toml --enable-managed-downloads true --register-period 120 --register-cycle 10 --heartbeat-period 30 --delete-session-on-ui true --log-level INFO --http-logs false --structured-logs false --reject-unsupported-caps true --slot-selector org.openqa.selenium.grid.distributor.selector.GreedySlotSelector --tracing false
sharmila  615695  0.9  0.4 34236284 79036 ?      Sl   Feb10  19:23 /opt/google/chrome/chrome --type=gpu-process --no-sandbox --disable-dev-shm-usage --headless=new --ozone-platform=headless --use-angle=swiftshader-webgl --crashpad-handler-pid=615578 --enable-crash-reporter=, --noerrdialogs --user-data-dir=/tmp/dusk-profile-615569-ebede120 --change-stack-guard-on-fork=enable --gpu-preferences=UAAAAAAAAAAgAAAEAAAAAAAAAAAAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAAAAAABgAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAgAAAAAAAAA --use-gl=disabled --shared-files --field-trial-handle=3,i,11602289030492694117,1126197317448913488,262144 --disable-features=PaintHolding --variations-seed-version --enable-logging --log-level=0
sharmila 3179963  0.9  0.4 34236296 80256 ?      Sl   Feb09  40:56 /opt/google/chrome/chrome --type=gpu-process --no-sandbox --disable-dev-shm-usage --headless=new --ozone-platform=headless --use-angle=swiftshader-webgl --crashpad-handler-pid=3179804 --enable-crash-reporter=, --noerrdialogs --user-data-dir=/tmp/dusk-profile-3179795-bc2f74ff --change-stack-guard-on-fork=enable --gpu-preferences=UAAAAAAAAAAgAAAEAAAAAAAAAAAAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYAAAAAAAAABgAAAAAAAAAAAAAAAAAAAAIAAAAAAAAAAgAAAAAAAAA --use-gl=disabled --shared-files --field-trial-handle=3,i,2231769871104497193,13617392425339243409,262144 --disable-features=PaintHolding --variations-seed-version --enable-logging --log-level=0
==========================================================
Report Complete
==========================================================
