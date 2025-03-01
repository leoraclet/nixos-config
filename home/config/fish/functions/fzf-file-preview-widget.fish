function fzf-file-preview-widget
    set selected_file (fd --hidden --no-ignore --exclude .git --exclude .direnv | fzf --height 60% --preview-window=right:60% --reverse --preview 'switch-preview {}')
    
    if test -n "$selected_file"
        nvim "$selected_file"
    end

    commandline -f repaint
end
