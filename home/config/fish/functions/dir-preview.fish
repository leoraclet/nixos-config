function dir-preview
    set dir "$argv[1]"
    eza --tree --color=always --icons=always "$dir"
end
