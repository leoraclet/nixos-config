#################################################
# GLOBAL VARIABLES
#################################################

set -U fish_greeting
set -gx EDITOR hx
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
alias cl="clear"
alias c="clear"
alias cls="clear"
alias tree="eza --tree --icons=always --color=always"
alias ls="eza --color=always --long --git --icons=always --group-directories-first"
alias ll="clear; ls -la"
alias s="kitten ssh"
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
alias ga="git add . -A"
alias gs="git status"
alias gc="git add .; git commit -m"
alias gl="git log --all --color --decorate --oneline --graph"
alias x="ouch decompress -y"
alias rm="trash"
alias restore="restore_trash"
alias empty="trash empty --all"
alias zed="zeditor ."
alias shell="nix-shell --command 'fish' --packages"
alias nix-shell="nix-shell --command 'fish'"
alias sudo="sudo TERMINFO=\"$TERMINFO\""
alias vi="nvim"
alias v="nvim"
alias .="cd"

# Fix commands
alias fix_sd_card="modprobe rtsx_pci"

#################################################
# MODULES
#################################################

zoxide init fish | source
direnv hook fish | source
fzf --fish | source
atuin init fish --disable-up-arrow | source
starship init fish --print-full-init | source
enable_transience # For starship
