function empty_selected_trash
    trash list \
    | fzf --multi \
    | awk '{$1=$1;print}' \
    | rev \
    | cut -d ' ' -f1 \
    | rev \
    | xargs trash empty --match=exact --force
end
