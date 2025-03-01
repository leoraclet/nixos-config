function fzf-ps-widget
    commandline -i (pgrep -a . | fzf --height 60%)
    commandline -f repaint
end
