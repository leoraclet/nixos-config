function ctrl_l
    printf '\033[2J\033[3J\033[1;1H'
    commandline -f repaint
end
