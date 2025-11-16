printf "CPU USAGE: "
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'






printf "\nMOST CPU INTENSIVE PROGRAMS: \n\n"
ps -eo cmd --sort=-%cpu | head -n 6 | awk '{print $1}'
printf "\nMOST MEMORY INTENSIVE PROGRAMS: \n\n"
ps -eo cmd --sort=-%mem | head -n 6 | awk '{print $1}'
