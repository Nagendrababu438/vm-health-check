#!/bin/bash

# Colors for highlighting
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to get CPU usage
get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'
}

# Function to get memory usage
get_memory_usage() {
  free | grep Mem | awk '{print $3/$2 * 100.0}'
}

# Function to get disk space usage
get_disk_usage() {
  df / | grep / | awk '{print $5}' | sed 's/%//g'
}

# Get usage percentages
cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

# Initialize health status and explanation
health_status="healthy"
status_color=$GREEN
explain_message=""

# Determine health status
if (( $(echo "$cpu_usage > 60" | bc -l) )); then
  health_status="not healthy"
  status_color=$RED
  explain_message+="CPU usage is too high: ${cpu_usage}%\n"
fi

if (( $(echo "$memory_usage > 60" | bc -l) )); then
  health_status="not healthy"
  status_color=$RED
  explain_message+="Memory usage is too high: ${memory_usage}%\n"
fi

if (( $(echo "$disk_usage > 60" | bc -l) )); then
  health_status="not healthy"
  status_color=$RED
  explain_message+="Disk usage is too high: ${disk_usage}%\n"
fi

# Print health status with color
echo -e "Health status: ${status_color}${health_status}${NC}"

# Explain reason if "explain" argument is passed
if [ "$1" == "explain" ]; then
  echo -e "$explain_message"
  echo "CPU usage: $cpu_usage%"
  echo "Memory usage: $memory_usage%"
  echo "Disk usage: $disk_usage%"
fi

# Log health status and reasons
echo "$(date): Health status: $health_status" >> health_check.log
if [ "$1" == "explain" ]; then
  echo "$(date): CPU usage: $cpu_usage%" >> health_check.log
  echo "$(date): Memory usage: $memory_usage%" >> health_check.log
  echo "$(date): Disk usage: $disk_usage%" >> health_check.log
fi