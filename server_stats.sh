#!/usr/bin/env bash
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "TOTAL CPU USAGE: " 100 - $1"%"}'
free -t | awk 'NR == 2 {printf("TOTAL MEMORY USAGE: %.2f%\n"), $3/$2*100}'
df -hl --total | tail -n 1 | awk '{print "TOTAL DISK USAGE: " $5}'
printf "MOST CPU INTENSIVE PROGRAMS: \n"
ps -eo cmd --sort=-%cpu | head -n 6 | awk '{print $1}'
printf "MOST MEMORY INTENSIVE PROGRAMS: \n"
ps -eo cmd --sort=-%mem | head -n 6 | awk '{print $1}'
