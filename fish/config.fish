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
    #alias rust='function rust; set dir (pwd); set fileName (string replace -r "\..*$" "" $argv[1]); rustc $argv[1]; and eval "$dir/$fileName"; end'
    alias nk="nvim ~/.config/kitty/kitty.conf"
    alias nf="nvim ~/.config/fish/config.fish"
    alias nb="nvim ~/.bashrc"
    alias nt="nvim ~/.tmux.conf"
    alias ns="nvim ~/.config/starship.toml"
    alias nn="nvim ~/.config/nvim/init.lua"
    alias nh="nvim ~/.config/hypr/hyprland.conf"
    alias nw="nvim ~/.config/waybar/config.jsonc"
    #alias nf="nvim ~/.config/fastfetch/config.jsonc"
    alias g.="git add ."
    alias gc="git commit -m"
    alias gs="git push"
    alias gl="git pull"
    alias q="exit"

    # ENVIRONMENT VARIABLES
    set -x PATH $PATH $HOME/.local/bin
    set -x PATH $PATH $HOME/.local/share/gem/ruby/3.0.0/bin
    set -x PATH $PATH $HOME/.cargo/bin

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
