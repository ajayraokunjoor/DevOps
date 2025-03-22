#!/bin/bash

# Display Total CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 + $4 "%"}'

# Display Total memory usage
echo "Memory Usage:"
free -h | awk '/^Mem/ {printf "Used: %s, Free: %s (%.2f%%)\n", $3, $4, $3*100/($3+$4)}'

# Display Total disk usage
echo "Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s, Free: %s (%s)\n", $3, $4, $5}'

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,user,pcpu,cmd --sort=-pcpu | head -n 6

# Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,user,pmem,cmd --sort=-pmem | head -n 6

# Optional: OS Version, Uptime, Load Average, Logged-in Users
echo "OS Version:" && lsb_release -a
echo "Uptime:" && uptime
echo "Load Average:" && uptime | awk -F'load average:' '{print $2}'
echo "Logged-in Users:" && who

