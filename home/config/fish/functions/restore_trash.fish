function restore_trash
    trashy list \
    | fzf --multi \
    | awk '{$1=$1;print}' \
    | rev \
    | cut -d ' ' -f1 \
    | rev \
    | xargs trashy restore --match=exact --force
end
