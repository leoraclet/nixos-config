function dir-preview
    set dir "$argv[1]"
    eza --tree --color=always "$dir"
end
