#!/bin/bash

# performance mode script for arch linux asus zenbook s16
# this script sets system to performance mode

# Exit on any error
set -e

# visual indicator
echo "🚀 switching to performance mode..."

# check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "❌ please run this script as a regular user (it will use sudo when needed)"
    exit 1
fi

# 1. update auto-cpufreq config to performance
echo "📝 updating auto-cpufreq configuration..."
sudo sed -i 's/energy_performance_preference = power/energy_performance_preference = performance/g' /etc/auto-cpufreq.conf

# if the line doesn't exist, add it to the [charger] section
if ! grep -q "energy_performance_preference = performance" /etc/auto-cpufreq.conf; then
    echo "⚠️  adding performance preference to config..."
    sudo sed -i '/\[battery\]/a energy_performance_preference = performance' /etc/auto-cpufreq.conf
fi

# 2. restart auto-cpufreq service
echo "🔄 Restarting auto-cpufreq service..."
sudo systemctl restart auto-cpufreq.service

# 3. force performance mode
echo "⚡ Forcing performance mode..."
sudo auto-cpufreq --force performance

# 4. set fan state to normal
echo "🌪️  setting fan to normal mode..."
if command -v fan_state &> /dev/null; then
    fan_state set 0
else
    echo "⚠️ fan_state command not found - skipping fan configuration"
fi

echo "✅ performance mode activated!"
echo "💡 your system is now optimized for maximum performance."
