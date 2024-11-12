# server-stats

This repository contains a Bash script (`server-stats.sh`) for displaying basic server performance statistics, including CPU usage, memory usage, and disk usage. It also lists the top processes by CPU and memory usage.
This project is based on the following site: https://roadmap.sh/projects/server-stats

## Features

- **CPU Usage**: Shows the current CPU utilization as a percentage.
- **Memory Usage**: Displays memory used, free memory, and memory usage percentage.
- **Disk Usage**: Lists total, used, and available disk space.
- **Top Processes**: Displays the top 5 processes by CPU and memory usage.

## Prerequisites

- **Operating System**: This script is intended for Linux systems.
- **Dependencies**: The script uses `top`, `df`, and `awk`, which are commonly available on most Linux distributions.

## Example Output

System Performance Report
=========================

CPU Usage: 0%
Memory Used: 425.9 MiB / 662.9 [64.25%%]
Disk Usage: 4.6G / 4.2G [53%]

Top 5 Processes by CPU Usage:
--------------------------------
    PID COMMAND         %CPU
  10596 fwupd            0.0
   2631 containerd       0.0
   1482 qemu-ga          0.0
   8501 sshd             0.0
   2851 dockerd          0.0

Top 5 Processes by Memory Usage:
--------------------------------
    PID COMMAND         %MEM
   2851 dockerd          4.5
   2631 containerd       2.3
  10596 fwupd            1.9
    810 snapd            1.5
    361 multipathd       1.3
