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
    alias E="exa --long --icons --all --no-quotes --across --modified --total-size --grid --group-directories-first"
    alias e="exa --long --icons --all --no-quotes --across --modified --grid --group-directories-first"
    alias clear="clear && fastfetch"
    alias r="Rscript"
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
    alias pac="sudo pacman"

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

    # Set vi mode
    fish_vi_key_bindings

    # Custom key bindings for autocompletion
    function fish_user_key_bindings
        for mode in insert default
            bind -M $mode \cn forward-char force-repaint
        end
    end
end
