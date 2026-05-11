function restore_trash
    trash list \
    | sort --numeric-sort \
    | fzf --multi \
    | awk '{$1=$1;print}' \
    | rev \
    | cut -d ' ' -f1 \
    | rev \
    | xargs trash restore --match=exact --force
    commandline -f repaint
end
