function fzf-cd-preview-widget
    set selected_dir (fd --type d --hidden --no-ignore --exclude .git --exclude .direnv | fzf --height 60% --reverse --preview='dir-preview {}' --preview-window=right:60%)

    if test -n "$selected_dir"
        cd "$selected_dir"
    end
    commandline -f repaint
end
