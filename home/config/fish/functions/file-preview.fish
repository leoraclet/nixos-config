function file-preview
    bat --color=always --style=numbers,header-filesize,grid --line-range=:500 --wrap=auto "$argv[1]"
end
