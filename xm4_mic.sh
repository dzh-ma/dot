#!/usr/bin/env bash

# This script toggles the PulseAudio profile of a specific Bluetooth headset
# between A2DP Sink (High Fidelity Playback) and Handsfree Head Unit (HFP).
# It's designed to be used with a hotkey.

# --- Configuration ---

# Path to PulseAudio commands
PACTLC="/usr/bin/pactl"
PACMDC="/usr/bin/pacmd"
AWKC="/usr/bin/awk"
XARGSC="/usr/bin/xargs"

# The unique identifier for your Bluetooth headset (e.g., MAC address converted by PulseAudio)
# Verify this by running `pacmd list-cards` in your terminal and finding your device's "name".
DEVICE="bluez_card.80_99_E7_38_F7_97"

# --- Main Logic ---

# Ensure D-Bus session environment is set for PulseAudio communication.
# This is crucial for scripts run by hotkeys or non-interactive shells.
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && [ -f "${XDG_RUNTIME_DIR}/bus" ]; then
    source "${XDG_RUNTIME_DIR}/bus"
fi

# Give PulseAudio a moment to ensure the card state is stable before querying.
sleep 0.2

# Get the full output of pacmd list-cards.
# Redirecting stderr to stdout (2>&1) can help capture any warnings, though not used here directly.
FULL_PACMD_OUTPUT="$($PACMDC list-cards 2>&1)"

# Use awk to precisely extract the active profile for the target device.
# -v device_name="$DEVICE": Passes the shell DEVICE variable into awk.
# BEGIN { ... }: Initializes variables.
# $0 ~ "name: <" device_name ">" { ... }: Finds the line with the device's name and sets a flag.
# in_device_block && /active profile:/: Once in the device's block, finds the active profile line.
# match($0, /<([^>]+)>/, profile_match): Extracts the profile name (e.g., "a2dp_sink") from angle brackets.
# print profile_match[1]: Prints the extracted profile.
# exit: Exits awk after finding the profile to avoid processing the rest of the output.
# /^Card #[0-9]+:/: Resets the flag if another card block is encountered, preventing incorrect matches.
DETECTED_PROFILE=$(echo "$FULL_PACMD_OUTPUT" | $AWKC -v device_name="$DEVICE" '
    BEGIN { in_device_block = 0; }
    $0 ~ "name: <" device_name ">" { in_device_block = 1; next; }
    in_device_block && /active profile:/ {
        if (match($0, /<([^>]+)>/, profile_match)) {
            print profile_match[1];
        }
        exit;
    }
    /^Card #[0-9]+:/ { in_device_block = 0; }
' | $XARGSC) # xargs removes any leading/trailing whitespace

# Toggle the profile based on the detected current profile.
if [ "$DETECTED_PROFILE" = "a2dp_sink" ]; then
    # If currently in A2DP, switch to Handsfree Head Unit (HFP) for microphone use.
    $PACTLC set-card-profile "$DEVICE" handsfree_head_unit
elif [ "$DETECTED_PROFILE" = "handsfree_head_unit" ]; then
    # If currently in HFP, switch to High Fidelity Playback (A2DP Sink) for better audio.
    $PACTLC set-card-profile "$DEVICE" a2dp_sink
else
    # Fallback: If profile isn't recognized (e.g., new connection, or "off"), default to A2DP.
    # This ensures a known state or attempts to enable audio.
    $PACTLC set-card-profile "$DEVICE" a2dp_sink
fi

# Script finishes here. Output is suppressed to avoid visual clutter when run by hotkey.
