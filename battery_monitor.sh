#!/bin/bash

# Battery Monitor Script for Arch Linux
# Logs processes with high CPU usage and battery consumption

LOG_DIR="$HOME/.battery_logs"
LOG_FILE="$LOG_DIR/battery_log_$(date +%Y%m%d).log"
INTERVAL=60  # Check every 60 seconds
TOP_PROCESSES=15  # Number of top processes to log

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to get battery info
get_battery_info() {
    if [ -d "/sys/class/power_supply/BAT0" ]; then
        local status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "N/A")
        local capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "N/A")
        local power_now=$(cat /sys/class/power_supply/BAT0/power_now 2>/dev/null || echo "0")
        local voltage_now=$(cat /sys/class/power_supply/BAT0/voltage_now 2>/dev/null || echo "1")
        
        # Calculate power in watts (convert from microwatts)
        local power_watts=$(awk "BEGIN {printf \"%.2f\", $power_now / 1000000}")
        
        echo "Status: $status | Capacity: $capacity% | Power Draw: ${power_watts}W"
    else
        echo "Battery information not available"
    fi
}

# Function to get CPU temperature
get_temp() {
    if command -v sensors &> /dev/null; then
        sensors | grep -E "Core|Package" | head -1 | awk '{print $3}'
    elif [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        local temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        echo "$(awk "BEGIN {printf \"%.1f\", $temp / 1000}")°C"
    else
        echo "N/A"
    fi
}

# Function to log top processes
log_processes() {
    echo "=================================================" >> "$LOG_FILE"
    echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
    echo "Battery: $(get_battery_info)" >> "$LOG_FILE"
    echo "CPU Temp: $(get_temp)" >> "$LOG_FILE"
    echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    echo "Top $TOP_PROCESSES CPU-consuming processes:" >> "$LOG_FILE"
    ps aux --sort=-%cpu | head -n $((TOP_PROCESSES + 1)) | awk '{printf "%-10s %5s %5s %8s %s\n", $1, $2, $3, $4, $11}' >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    echo "Top $TOP_PROCESSES Memory-consuming processes:" >> "$LOG_FILE"
    ps aux --sort=-%mem | head -n $((TOP_PROCESSES + 1)) | awk '{printf "%-10s %5s %5s %8s %s\n", $1, $2, $3, $4, $11}' >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    
    # Check for any suspicious high CPU usage
    local high_cpu=$(ps aux --sort=-%cpu | awk 'NR==2 {print $3}')
    if (( $(echo "$high_cpu > 50" | bc -l 2>/dev/null || echo 0) )); then
        echo "⚠️  WARNING: Detected high CPU usage ($high_cpu%)" >> "$LOG_FILE"
        echo "" >> "$LOG_FILE"
    fi
}

# Main monitoring function
monitor_continuous() {
    echo "Starting battery monitor... Logging to: $LOG_FILE"
    echo "Press Ctrl+C to stop"
    echo ""
    
    while true; do
        log_processes
        
        # Display current status to terminal
        echo "[$(date '+%H:%M:%S')] Logged | Battery: $(get_battery_info) | Temp: $(get_temp)"
        
        sleep "$INTERVAL"
    done
}

# One-time snapshot function
snapshot() {
    echo "Taking snapshot..."
    log_processes
    echo "Snapshot saved to: $LOG_FILE"
    echo ""
    tail -n 50 "$LOG_FILE"
}

# Analyze logs function
analyze_logs() {
    echo "Analyzing battery logs..."
    echo ""
    
    if [ ! -d "$LOG_DIR" ] || [ -z "$(ls -A $LOG_DIR 2>/dev/null)" ]; then
        echo "No logs found. Run the monitor first."
        return
    fi
    
    echo "=== Most frequent CPU-intensive processes ==="
    grep -h "^[a-zA-Z]" "$LOG_DIR"/*.log 2>/dev/null | \
        grep -v "^Top" | grep -v "^USER" | grep -v "^===" | \
        awk '{print $NF}' | sort | uniq -c | sort -rn | head -20
    
    echo ""
    echo "=== High CPU warnings ==="
    grep -h "WARNING" "$LOG_DIR"/*.log 2>/dev/null | tail -10
    
    echo ""
    echo "=== Recent logs ==="
    ls -lht "$LOG_DIR"/*.log 2>/dev/null | head -5
}

# Clean old logs
clean_logs() {
    echo "Cleaning logs older than 7 days..."
    find "$LOG_DIR" -name "battery_log_*.log" -mtime +7 -delete
    echo "Done!"
}

# Usage information
usage() {
    cat << EOF
Battery Monitor Script

Usage: $0 [OPTION]

Options:
    monitor     Start continuous monitoring (default)
    snapshot    Take a one-time snapshot
    analyze     Analyze collected logs
    clean       Remove logs older than 7 days
    help        Show this help message

Examples:
    $0 monitor          # Start continuous monitoring
    $0 snapshot         # Quick snapshot of current state
    $0 analyze          # Analyze historical data

Logs are stored in: $LOG_DIR
EOF
}

# Main script logic
case "${1:-monitor}" in
    monitor)
        monitor_continuous
        ;;
    snapshot)
        snapshot
        ;;
    analyze)
        analyze_logs
        ;;
    clean)
        clean_logs
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        echo "Unknown option: $1"
        usage
        exit 1
        ;;
esac
