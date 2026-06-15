function multicd
    cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    commandline -f repaint
end
