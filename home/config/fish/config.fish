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
# Terminal aliases
alias cl="clear"
alias c="clear"
alias cls="clear"
alias clk="rsclock -c"
alias tree="eza --tree --icons=always --color=always"
alias ls="eza --color=always --long --git --icons=always --group-directories-first"
alias ll="clear; ls -la"
alias s="kitten ssh"
alias cd="z"
alias ps="procs"
alias man="tldr"
alias du="dust"
alias mkdir="mkdir -pv"
alias home="cd ~"
alias h="cd ~"
alias cat="bat"
alias df="duf"
alias lgit="lazygit"
alias ldock="lazydocker"
alias hex="hexyl"
alias dua="dua i"
alias open="xdg-open"
alias code="codium --enable-features=UseOzonePlatform --ozone-platform=wayland . 1>/dev/null 2>/dev/null"
alias f="fzf-file-preview-widget"
alias ff="sk"
alias ga="git add . -A"
alias gs="git status"
alias gc="git add .; git commit -m"
alias gl="git log --all --color --decorate --oneline --graph"
alias extract="ouch decompress"
alias rm="trash"
alias restore="restore_trash"
alias empty="trash empty --all"
alias zed="zeditor ."
alias shell="nix-shell --command 'fish' --packages"
alias nix-shell="nix-shell --command 'fish'"
alias sudo="sudo TERMINFO=\"$TERMINFO\""
alias fixsdcard="lspci -knn | grep -iA2 card && modprobe rtsx_pci"
alias rebuild="~/.config/hypr/scripts/rebuild-system.sh"

abbr --add dotdot --regex '^\.\.+$' --function multicd

#################################################
# MODULES
#################################################

zoxide init fish | source
direnv hook fish | source
fzf --fish | source
atuin init fish --disable-up-arrow | source
starship init fish --print-full-init | source

enable_transience
