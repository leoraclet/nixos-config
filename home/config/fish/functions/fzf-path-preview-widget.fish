function fzf-path-preview-widget
    set selected (fd . /home --hidden --no-ignore --exclude .git --exclude .direnv | fzf --height 60% --reverse --preview='dir-preview {}' --preview-window=right:60%)

    if test -n "$selected"
        if [ -f "$selected" ]
            commandline -i $(dirname $selected)
        else
            commandline -i "$selected"
        end
    end

    commandline -f repaint
end
