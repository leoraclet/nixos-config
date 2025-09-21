function fzf-cd-preview-widget
    set selected (fd . /home --hidden --no-ignore --exclude .git --exclude .direnv | fzf --height 60% --reverse --preview='dir-preview {}' --preview-window=right:60%)

    if test -n "$selected"
        if [ -f "$selected" ]
            cd "$(dirname $selected)"
        else
            cd "$selected"
        end
    end
    commandline -f repaint
end
