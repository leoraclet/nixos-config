function recent_directories
    set dir $(
        zoxide query --list --score | sort -n |
        fzf --height 60% --layout reverse --info inline \
            --nth 2.. --tac --query "$argv" \
            --bind 'enter:become:echo {2..}'
    )
    if test -n "$dir"
        cd "$dir"
        clear
        return
    end

    commandline -f repaint
end
