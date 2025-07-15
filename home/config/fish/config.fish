if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl="clear"
alias c="clear"
alias cls="clear"
alias ngc="sudo nix-collect-garbage -d"
alias npw="sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system"

alias c="clear"
alias clk="rsclock -c"
#alias vm="quickemu --vm ~/VM/windows-10.conf --display spice --width 1920 --height 1080"
alias tre="tre -e"
alias tree="tre -e"
alias ls="eza --color=always --long --git --icons=always --group-directories-first"
alias cd="z"
alias ps="procs"
alias man="tldr"
alias ll="ls -la"
alias du="dust"
alias mamba="micromamba"
alias v="nvim"

# Fzf
alias f="fzf-file-preview-widget"

# Git
alias ga="git add"
alias gc="git commit -m "
alias gs="git status"
alias gp="git push"
alias gi="git init"
alias gl="git log --all --color --decorate --oneline --graph"

alias mkdir="mkdir -p"
alias home="cd ~"

alias open="xdg-open"
alias cat="bat"
alias df="duf"
alias lgit="lazygit"
alias ldock="lazydocker"
alias hex="hexyl"
alias dua="dua i"
alias vc="codium ."
alias code="codium ."

#alias fixsd="lspci -knn | grep -iA2 card && modprobe rtsx_pci"
alias rebuild="~/.config/hypr/scripts/rebuild-system.sh"

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
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

starship init fish | source
zoxide init fish | source
direnv hook fish | source
fzf --fish | source
atuin init fish | source
