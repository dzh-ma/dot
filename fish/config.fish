#set PS1 "[\u@\h \W]\$ '"
#set -Ux PATH $HOME/.local/bin $HOME/.local/share/gem/ruby/3.3.0/bin $HOME/.cargo/bin $HOME/.npm-global/bin$PATH
set -Ux PATH $HOME/.local/bin $HOME/.local/share/gem/ruby/3.3.0/bin $HOME/.cargo/bin $HOME/.npm-global/bin $HOME/.nimble/bin $HOME/dot/scripts/ $PATH
set -U fish_user_paths /home/dzh-ma/.local/share/gem/ruby/3.3.0/bin /home/dzh-ma/.npm-global/bin $fish_user_paths
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    # ALIASES
    alias n="nvim"
    alias z="zoxide"
    alias E="exa --long --icons --all --no-quotes --across --modified --total-size --grid --group-directories-first"
    alias e="exa --long --icons --all --no-quotes --across --modified --grid --group-directories-first"
    # alias clear="clear && fastfetch"
    alias za="zathura"
    alias img="kitty +kitten icat"
    # alias r="ranger"
    alias r="Rscript"
    alias ck="clockify-cli"
    alias ckn="clockify-cli in --interactive=1"
    alias ckr="clockify-cli report"
    alias cko="clockify-cli out"
    alias power="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
    alias mix="pulsemixer"
    alias nmwc="sudo nmcli dev wifi connect"
    alias t="tmux"
    alias ta="tmux attach"
    alias p="python"
    alias j="java"
    alias jc="javac"
    alias c="gcc -o"
    alias cpp="g++ -o"
    alias nk="nvim ~/.config/kitty/kitty.conf"
    alias nf="nvim ~/.config/fish/config.fish"
    alias nb="nvim ~/.bashrc"
    alias nt="nvim ~/.tmux.conf"
    alias ns="nvim ~/.config/starship.toml"
    alias nn="nvim ~/.config/nvim/init.lua"
    alias nh="nvim ~/.config/hypr/hyprland.conf"
    alias nw="nvim ~/.config/waybar/config.jsonc"
    alias ng="nvim ~/.config/ghostty/config"
    alias g.="git add ."
    alias gc="git commit -m"
    alias gs="git push"
    alias gl="git pull"
    alias q="exit"
    alias a="clear"
    alias b="btop"
    alias B="bluetui"
    alias bs="brightnessctl set"
    alias g="gwenview"
    alias s="sudo systemctl"
    # alias o="onlyoffice-desktopeditors"
    alias d0="hyprctl keyword monitor 'eDP-1, disable'"
    alias d1="hyprctl keyword monitor 'eDP-1, 2880x1800@120, 0x0, 1'"
    alias l="libreoffice"
    alias fs="fan_state get"
    alias fS="fan_state set"        # 0-3 = standard / quiet / high / full
    # alias pp="powerprofilesctl"
    # alias battery="fan_state set 1 && powerprofilesctl set power-saver"
    # alias balance="fan_state set 0 && powerprofilesctl set balanced"
    # alias performance="fan_state set 3 && powerprofilesctl set performance"
    alias silent="fan_state set 1"
    alias normal="fan_state set 0"
    alias loud="fan_state set 3"
    alias powersave="sudo auto-cpufreq --force powersave"
    alias performance="sudo auto-cpufreq --force performance"
    alias pac="sudo pacman"
    alias hwifi="nmcli connection up Bedroom\ 5GHz"
    alias uwifi="nmcli connection up eduroam\ \[a16c8929\]"
    alias wifi="nmcli connection"
    alias jumd="jupytext --to markdown"
    alias juno="jupytext --to notebook"
    alias tlist="sudo timeshift --list --snapshot-device /dev/nvme0n1p2"
    alias tcreate="sudo timeshift --create --comments"
    alias tdelete="sudo timeshift --delete-all"
    alias bon="sudo systemctl start bluetooth.service"
    alias boff="sudo systemctl stop bluetooth.service"
    alias epp1="sudo nvim /etc/auto-cpufreq.conf"
    alias epp2="sudo systemctl restart auto-cpufreq.service"
    alias live="sudo auto-cpufreq --live"
    alias wallpaper="pkill hyprpaper && hyprctl reload"
    alias vm1="modprobe -a vmw-vmci vmmon"
    alias vm2="sudo systemctl start vmware-networks-configuration.service"
    alias vm3="sudo systemctl start vmware-networks.service"
    alias vm4="sudo systemctl start vmware-usbarbitrator.service"
    alias vms1="sudo systemctl start vmware-networks-configuration.service"
    alias vms2="sudo systemctl start vmware-networks.service"
    alias vms3="sudo systemctl start vmware-usbarbitrator.service"
    alias prf="sh ~/dot/scripts/mode_performance.sh"
    alias pow="sh ~/dot/scripts/mode_powersave.sh"

    # ENVIRONMENT VARIABLES
    set -x PATH $PATH $HOME/.local/bin
    set -x PATH $PATH $HOME/.local/share/gem/ruby/3.0.0/bin
    set -x PATH $PATH $HOME/.cargo/bin

    # Display system info
    # fastfetch

    # Initialize starship prompt
    starship init fish | source

    # Initialize zoxide
    zoxide init fish | source

    # Initialize opam
    eval (opam env --switch=4.14.1)

    # Set vi mode
    fish_vi_key_bindings

    # Custom key bindings for autocompletion
    function fish_user_key_bindings
        for mode in insert default
            bind -M $mode \cn forward-char force-repaint
        end
    end
end


if not pgrep ssh-agent > /dev/null
    eval (ssh-agent -c)
end
ssh-add ~/.ssh/id_ed25519 2>/dev/null

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
