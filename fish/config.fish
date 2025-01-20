#set PS1 "[\u@\h \W]\$ '"
set -Ux PATH $HOME/.local/bin $HOME/.local/share/gem/ruby/3.3.0/bin $HOME/.cargo/bin $HOME/.npm-global/bin$PATH
set -U fish_user_paths /home/dzh-ma/.local/share/gem/ruby/3.3.0/bin $fish_user_paths
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

if status is-interactive
    # Commands to run in interactive sessions can go here
    # ALIASES
    alias n="nvim"
    alias z="zoxide"
    alias e="exa --long --icons --all --no-quotes --across --modified --total-size --grid"
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
    alias g.="git add ."
    alias gc="git commit -m"
    alias gs="git push"
    alias gl="git pull"
    alias q="exit"
    alias fg="fan_state get"
    alias fs="fan_state set"

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
    eval (opam env --switch=default)

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
