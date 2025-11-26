#!/bin/bash

# Enhanced Battery Monitor with PowerTOP integration
# Requires: powertop (optional but recommended)

LOG_DIR="$HOME/.battery_logs"
POWERTOP_LOG="$LOG_DIR/powertop_snapshot.txt"

# Check if running as root for powertop
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "⚠️  Note: Running without root. PowerTOP features will be limited."
        echo "   Run with 'sudo' for full power analysis."
        return 1
    fi
    return 0
}

# PowerTOP snapshot
powertop_snapshot() {
    if ! command -v powertop &> /dev/null; then
        echo "PowerTOP not installed. Install with: sudo pacman -S powertop"
        return 1
    fi
    
    echo "Running PowerTOP analysis (this takes ~15 seconds)..."
    
    if check_root; then
        powertop --html="$LOG_DIR/powertop_$(date +%Y%m%d_%H%M%S).html" --time=15
        echo "PowerTOP report saved to: $LOG_DIR/"
    else
        echo "Run with sudo for full PowerTOP analysis:"
        echo "  sudo powertop --html=powertop_report.html --time=15"
    fi
}

# Real-time power monitor
realtime_monitor() {
    echo "Real-time Power Monitor"
    echo "======================="
    echo ""
    
    while true; do
        clear
        echo "=== Battery Status ($(date '+%H:%M:%S')) ==="
        
        # Battery info
        if [ -d "/sys/class/power_supply/BAT0" ]; then
            echo "Status:   $(cat /sys/class/power_supply/BAT0/status)"
            echo "Capacity: $(cat /sys/class/power_supply/BAT0/capacity)%"
            
            local power_now=$(cat /sys/class/power_supply/BAT0/power_now 2>/dev/null || echo "0")
            local power_watts=$(awk "BEGIN {printf \"%.2f\", $power_now / 1000000}")
            echo "Power:    ${power_watts}W"
            
            # Estimate time remaining
            local energy_now=$(cat /sys/class/power_supply/BAT0/energy_now 2>/dev/null || echo "0")
            local energy_full=$(cat /sys/class/power_supply/BAT0/energy_full 2>/dev/null || echo "1")
            if [ "$power_now" -gt 0 ]; then
                local hours=$(awk "BEGIN {printf \"%.1f\", ($energy_now / $power_now)}")
                echo "Time Est: ${hours}h"
            fi
        fi
        
        echo ""
        echo "=== CPU Information ==="
        if command -v sensors &> /dev/null; then
            sensors | grep -E "Core|Package" | head -3
        fi
        
        echo ""
        echo "=== Top 10 CPU Users ==="
        ps aux --sort=-%cpu | head -11 | tail -10 | \
            awk '{printf "%-20s %5s%%  %s\n", substr($11,1,20), $3, $2}'
        
        echo ""
        echo "Press Ctrl+C to exit"
        
        sleep 2
    done
}

# Find battery drainers
find_drainers() {
    echo "Analyzing battery drainers..."
    echo ""
    
    echo "=== Processes by CPU usage (likely battery drain) ==="
    ps aux --sort=-%cpu | head -20 | \
        awk 'NR==1 || $3>5.0 {printf "%-12s %6s%% %6s%% %s\n", $1, $3, $4, $11}'
    
    echo ""
    echo "=== Background services consuming resources ==="
    systemctl list-units --type=service --state=running | \
        grep -E "running" | head -20
    
    echo ""
    echo "=== Disk I/O activity (can drain battery) ==="
    if command -v iotop &> /dev/null; then
        echo "Install iotop for I/O monitoring: sudo pacman -S iotop"
    fi
    
    # Check for known battery drainers
    echo ""
    echo "=== Checking for common issues ==="
    
    # # Check if laptop-mode-tools is running
    # if systemctl is-active --quiet tlp; then
    #     echo "✓ TLP is running (good for battery)"
    # else
    #     echo "✗ TLP not running. Consider: sudo pacman -S tlp && sudo systemctl enable --now tlp"
    # fi
    
    # Check for GPU power management
    if lsmod | grep -q nvidia; then
        echo "⚠ NVIDIA GPU detected. Check power management settings."
    fi
    
    # Check for bluetooth
    if systemctl is-active --quiet bluetooth; then
        echo "⚠ Bluetooth is running (disable if not needed)"
    fi
    
    # Check for unnecessary services
    if systemctl is-active --quiet cups; then
        echo "⚠ Print service running (disable if printer not needed)"
    fi
}

# Optimization suggestions
suggest_optimizations() {
    cat << 'EOF'
=== Battery Optimization Tips for Arch Linux ===

1. Install Power Management Tools:
   sudo pacman -S tlp tlp-rdw powertop
   sudo systemctl enable --now tlp
   sudo systemctl mask systemd-rfkill.service
   sudo systemctl mask systemd-rfkill.socket

2. Run PowerTOP Calibration (one-time):
   sudo powertop --calibrate  # Takes ~15 minutes

3. Apply PowerTOP Recommendations:
   sudo powertop --auto-tune

4. CPU Frequency Scaling:
   sudo pacman -S cpupower
   sudo cpupower frequency-set -g powersave

5. Display Brightness:
   # Reduce brightness when on battery
   echo 50 | sudo tee /sys/class/backlight/*/brightness

6. Disable Unused Hardware:
   # Bluetooth:
   sudo systemctl disable bluetooth
   
   # Webcam (if not needed):
   sudo modprobe -r uvcvideo

7. Browser Extensions:
   - Use uBlock Origin (reduces CPU usage)
   - Suspend unused tabs

8. Check for wakelocks:
   cat /sys/kernel/debug/wakeup_sources

9. Monitor system logs:
   journalctl -p 3 -xb  # Check for errors

10. For NVIDIA Optimus laptops:
    sudo pacman -S optimus-manager
    # Or use nouveau drivers for better battery life

EOF
}

# Usage
usage() {
    cat << EOF
Enhanced Battery Monitor

Usage: $0 [OPTION]

Options:
    powertop      Run PowerTOP analysis (needs sudo)
    realtime      Real-time power monitoring display
    drainers      Find processes draining battery
    optimize      Show optimization suggestions
    help          Show this help message

Examples:
    $0 realtime         # Live monitor
    sudo $0 powertop    # Detailed power analysis
    $0 drainers         # Find problematic processes
    $0 optimize         # Get optimization tips

EOF
}

# Main
case "${1:-realtime}" in
    powertop)
        powertop_snapshot
        ;;
    realtime)
        realtime_monitor
        ;;
    drainers)
        find_drainers
        ;;
    optimize)
        suggest_optimizations
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
