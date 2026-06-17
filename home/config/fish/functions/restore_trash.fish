function restore_trash
    set files $(trash list \
    | sort --numeric-sort \
    | fzf --multi \
    | awk '{$1=$1;print}' \
    | rev \
    | cut -d ' ' -f1 \
    | rev)

    if test -n "$files"
        echo "$files" | xargs trash restore --match=exact --force
    end

    commandline -f repaint
end
