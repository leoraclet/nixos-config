# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nixos/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.config/scripts/zsh-defer/zsh-defer.plugin.zsh

# Starship
eval "$(starship init zsh)"
zsh-defer eval "$(fzf --zsh)"
zsh-defer eval "$(atuin init zsh)"
zsh-defer eval "$(zoxide init zsh)"
zsh-defer eval "$(direnv hook zsh)"
zsh-defer source ~/.config/scripts/fzf-git.sh/fzf-git.sh


export BAT_THEME="Monokai Extended"

###########################################################
# ---- FZF (Fuzzy finder) ----
###########################################################

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

alias ff="fzf --preview '$show_file_or_dir_preview'"
alias f="fd --type f | fzf --preview '$show_file_or_dir_preview' | sed 's/\ /\\\ /g' | xargs nvim"

###########################################################
# ---- Zoxide (better cd) ----
###########################################################

function dm() {
  local dir=$(
    zoxide query --list --score |
    fzf --height 40% --layout reverse --info inline \
        --nth 2.. --tac --no-sort --query "$*" \
        --bind 'enter:become:echo {2..}'
  )
  cd "$dir"
}

alias cd="z"

###########################################################
# ---- Eza (better ls) -----
###########################################################

alias ls="eza --color=always --long --git --icons=always"

# thefuck alias

###########################################################
# ---- TLDR ----
###########################################################
alias man="tldr"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function switch() {
    eval "~/.config/hypr/scripts/rebuild-system.sh"
}

###########################################################
###########################################################

alias c="clear"
alias clk="rsclock -c"
alias vm="quickemu --vm ~/VM/windows-10.conf --display spice --width 1920 --height 1080"
alias tre="tre -e"
alias tree="tre -e"
alias neo="neofetch"
alias fast="fastfetch"
alias conf="z ~/.config/"
alias store="z /nix/store/"
