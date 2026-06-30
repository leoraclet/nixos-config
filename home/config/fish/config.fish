#################################################
# GLOBAL VARIABLES
#################################################

set -U fish_greeting
set -gx EDITOR nvim
set -gx ATUIN_NOBIND "true"

#################################################
# ALIAS
#################################################

# System aliases
alias ngc="sudo nix-collect-garbage --delete-older-than 1d"
alias npw="sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system"
alias cbe="sudo nix-collect-garbage -d && sudo nix profile wipe-history --profile /nix/var/nix/profiles/system"
alias con="zeditor ~/Config/"

# Terminal aliases
alias py="uv run python"
alias cl="clear"
alias c="clear"
alias cls="clear"
alias tree="eza --tree --icons=always --color=always -h --hyperlink"
alias ls="eza --color=always --long --git --icons=always --group-directories-first -h --hyperlink"
alias ll="clear; ls -la"
alias untar="tar -xvf"
alias s="kitten ssh"
alias d="kitten diff"
alias icat="kitten icat"
alias cd="z"
alias ps="procs"
alias man="tldr"
alias du="dust"
alias mkdir="mkdir -pv"
alias cat="bat"
alias hex="hexyl"
alias dua="dua i"
alias open="xdg-open"
alias code="codium --enable-features=UseOzonePlatform --ozone-platform=wayland . 1>/dev/null 2>/dev/null"
alias x="ouch decompress -y"
alias rm="trash"
alias restore="restore_trash"
alias empty="trash empty --all"
alias zed="zeditor ."
alias shell="nix-shell --command 'fish' --packages"
alias nix-shell="nix-shell --command 'fish'"
alias sudo="sudo TERMINFO=\"$TERMINFO\""
alias e="exit"
alias vi="nvim"
alias vim="nvim"
alias spf="superfile"
alias v="nvim"
alias .="cd"

# Git related
alias ga="git add . -A"
alias gs="clear; git status; git log --oneline -4"
alias gc="git add .; git commit -m"
alias gl="git log --all --color --decorate --oneline --graph"
alias gp="git push"
alias gi="git init"
alias gb="git branch"
alias gu="git pull"
alias gc="git diff"

# Fix commands
alias fix_sd_card="modprobe rtsx_pci"

#################################################
# MODULES
#################################################

# fzf --fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish --disable-up-arrow | source
starship init fish --print-full-init | source
sk --shell fish --shell-bindings | source
enable_transience # For starship
