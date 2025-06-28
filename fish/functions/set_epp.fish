function set_epp_interactive --description "Interactively set Energy Performance Preference and restart auto-cpufreq service"
    set -l config_file "/etc/auto-cpufreq.conf"

    # Fetch available EPP preferences dynamically from the system
    set -l available_epp (cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences)

    echo "Available EPP preferences: " (string join ", " $available_epp)
    echo -n "Enter desired EPP mode (e.g., power, balance_power): "

    read -P "" new_epp_value

    # Validate the input
    if test -z "$new_epp_value"
        echo "Error: No EPP value entered. Aborting."
        return 1
    end

    if not contains "$new_epp_value" $available_epp
        echo "Error: '$new_epp_value' is not a valid EPP preference."
        echo "Available options: " (string join ", " $available_epp)
        return 1
    end

    # Use sed to replace the line (simplified for your 2-line config)
    # It will find the line starting with "energy_performance_preference=" and replace its content.
    sudo sed -i "s/^energy_performance_preference=.*/energy_performance_preference=$new_epp_value/" "$config_file"

    echo "EPP set to '$new_epp_value' in $config_file"

    # Restart auto-cpufreq service
    echo "Restarting auto-cpufreq service..."
    sudo systemctl restart auto-cpufreq.service

    if test $status -eq 0
        echo "auto-cpufreq service restarted successfully."
        echo "Current EPP (after restart, may take a moment to update):"
        # Display the actual current EPP from sysfs for verification
        cat /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference | uniq
    else
        echo "Error: Failed to restart auto-cpufreq service."
    end
end
