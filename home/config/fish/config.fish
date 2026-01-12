if set -q XDG_CONFIG_HOME
  set -gx fisher_path $XDG_CONFIG_HOME/fish/fisher
else
  set -gx fisher_path $HOME/.config/fish/fisher
end

# Automatic things only in interactive mode
if status is-interactive
  if not functions -q fisher
    echo "Fisher not found, installing..."
    curl -sL https://git.io/fisher | source && fisher update || fisher install "jorgebucaran/fisher"
  end
end


for file in $fisher_path/conf.d/*.fish
  source $file
end

# System aliases
alias ngc="sudo nix-collect-garbage --delete-older-than 1d"
alias npw="sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system"

# Terminal utils aliases
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias cl="printf '\033[2J\033[3J\033[1;1H'"
alias c="printf '\033[2J\033[3J\033[1;1H'"
alias cls="printf '\033[2J\033[3J\033[1;1H'"
alias clk="rsclock -c"
alias tree="tre -e"
alias treee="eza --tree --icons=always --color=always"
alias ls="eza --color=always --long --git --icons=always --group-directories-first"
alias ll="printf '\033[2J\033[3J\033[1;1H'; ls -la"
alias cd="z"
alias ps="procs"
alias man="tldr"
alias du="dust"
alias mkdir="mkdir -pv"
alias home="cd ~"
alias h="cd ~"
alias vi="nvim"
alias cat="bat"
alias df="duf"
alias lgit="lazygit"
alias ldock="lazydocker"
alias hex="hexyl"
alias dua="dua i"
alias open="xdg-open"
alias code="codium --enable-features=UseOzonePlatform --ozone-platform=wayland . 1>/dev/null 2>/dev/null"
alias f="fzf-file-preview-widget"
alias ga="git add . -A"
alias gs="git status"
alias gc="git add .; git commit -m"
alias gl="git log --all --color --decorate --oneline --graph"
alias extract="ouch decompress"
alias rm="trash"
alias restore="restore_trash"
alias delete="empty_selected_trash"
alias empty="trash empty --all"
alias zed="zeditor ."

alias fixsdcard="lspci -knn | grep -iA2 card && modprobe rtsx_pci"
alias rebuild="~/.config/hypr/scripts/rebuild-system.sh"

function multicd
    cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    commandline -f repaint
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

set -gx EDITOR nvim

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_visual underscore blink

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

set -Ux fifc_editor nvim
set -U fifc_fd_opts --hidden
set -U fifc_bat_opts --style=numbers
set -U fifc_exa_opts --icons --tree

zoxide init fish | source
direnv hook fish | source
fzf --fish | source
atuin init fish | source
starship init fish --print-full-init | source

fzf_configure_bindings --processes=\cp --history=\ch --directory=\cf --variables=

enable_transience

##########################
# STARTUP COMMANDS
##########################



##########################
##########################
