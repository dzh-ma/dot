#!/bin/bash

# powersave mode script for arch linux asus zenbook s16
# this script sets system to powersave mode

# exit on any error
set -e

echo "🔋 switching to powersave mode..."

# check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "❌ please run this script as a regular user (it will use sudo when needed)"
    exit 1
fi

# 1. update auto-cpufreq config to power
echo "📝 updating auto-cpufreq configuration..."
sudo sed -i 's/energy_performance_preference = performance/energy_performance_preference = power/g' /etc/auto-cpufreq.conf

# if the line doesn't exist, add it to the [charger] section
if ! grep -q "energy_performance_preference = power" /etc/auto-cpufreq.conf; then
    echo "⚠️  adding power preference to config..."
    sudo sed -i '/\[battery\]/a energy_performance_preference = power' /etc/auto-cpufreq.conf
fi

# 2. restart auto-cpufreq service
echo "🔄 restarting auto-cpufreq service..."
sudo systemctl restart auto-cpufreq.service

# 3. force powersave mode
echo "💚 forcing powersave mode..."
sudo auto-cpufreq --force powersave

# 4. set fan state to silent
echo "🤫 setting fan to silent mode..."
if command -v fan_state &> /dev/null; then
    fan_state set 1
else
    echo "⚠️ fan_state command not found - skipping fan configuration"
fi

echo "✅ powersave mode activated!"
echo "🔋 your system is now optimized for battery life and quiet operation."
