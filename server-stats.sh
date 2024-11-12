#!/bin/bash

top_cpu_usage() {
  echo -e "\nTop 5 Processes by CPU Usage:"
  echo "--------------------------------"
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

top_mem_usage() {
  echo -e "\nTop 5 Processes by Memory Usage:"
  echo "--------------------------------"
  ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

mem_info=$(top -bn1 | grep "MiB Mem")
mem_used=$(echo "$mem_info" | awk '{print $8}')
mem_free=$(echo "$mem_info" | awk '{print $6}')
mem_total=$(awk "BEGIN {print $mem_used + $mem_free}")

mem_used_percent=$(awk "BEGIN {printf \"%.2f%%\", ($mem_used / $mem_total) * 100}")

disk_info=$(df -h --total | grep 'total')
disk_usage=$(echo "$disk_info" | awk '{print $3}')
disk_free=$(echo "$disk_info" | awk '{print $4}')
disk_pct=$(echo "$disk_info" | awk '{print $5}')

cat <<EOF

System Performance Report
=========================

CPU Usage: ${cpu_usage}%
Memory Used: ${mem_used} MiB / ${mem_total} [${mem_used_percent}%]
Disk Usage: ${disk_usage} / ${disk_free} [${disk_pct}]
EOF

top_cpu_usage
top_mem_usage
