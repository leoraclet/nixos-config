function file-preview
    set file "$argv[1]"
    bat --color=always --style=numbers,header-filesize,grid --line-range=:500 --wrap=auto "$file"
end
