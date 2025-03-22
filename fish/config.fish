#set PS1 "[\u@\h \W]\$ '"
#set -Ux PATH $HOME/.local/bin $HOME/.local/share/gem/ruby/3.3.0/bin $HOME/.cargo/bin $HOME/.npm-global/bin$PATH
set -Ux PATH $HOME/.local/bin $HOME/.local/share/gem/ruby/3.3.0/bin $HOME/.cargo/bin $HOME/.npm-global/bin $PATH
set -U fish_user_paths /home/dzh-ma/.local/share/gem/ruby/3.3.0/bin /home/dzh-ma/.npm-global/bin $fish_user_paths
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

if status is-interactive
    # Commands to run in interactive sessions can go here
    # ALIASES
    alias n="nvim"
    alias z="zoxide"
    alias E="exa --long --icons --all --no-quotes --across --modified --total-size --grid --group-directories-first"
    alias e="exa --long --icons --all --no-quotes --across --modified --grid --group-directories-first"
    alias clear="clear && fastfetch"
    alias za="zathura"
    alias img="kitty +kitten icat"
    alias r="ranger"
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
    alias cp="g++ -o"
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
    alias o="onlyoffice-desktopeditors"
    alias d0="hyprctl keyword monitor 'eDP-1, disable'"
    alias d1="hyprctl keyword monitor 'eDP-1, 2880x1800@120, 0x0, 1'"
    alias l="libreoffice"
    alias fs="fan_state get"
    alias fS="fan_state set"        # 0-3 = standard / quiet / high / full
    alias pp="powerprofilesctl"
    alias battery="fan_state set 1 && powerprofilesctl set power-saver"
    alias balance="fan_state set 0 && powerprofilesctl set balanced"
    alias performance="fan_state set 3 && powerprofilesctl set performance"

    # ENVIRONMENT VARIABLES
    set -x PATH $PATH $HOME/.local/bin
    set -x PATH $PATH $HOME/.local/share/gem/ruby/3.0.0/bin
    set -x PATH $PATH $HOME/.cargo/bin

    # Display system info
    fastfetch

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
