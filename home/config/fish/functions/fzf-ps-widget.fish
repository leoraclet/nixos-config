function fzf-ps-widget
    commandline -i (pgrep -a . | fzf --layout reverse --height 60%)
    commandline -f repaint
end
