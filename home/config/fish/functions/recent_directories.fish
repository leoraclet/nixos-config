function recent_directories
    set dir $(
        zoxide query --list --score |
        fzf --height 60% --layout reverse --info inline \
            --nth 2.. --tac --query "$argv" \
            --bind 'enter:become:echo {2..}'
    )
    cd "$dir"
    commandline -f repaint
end
