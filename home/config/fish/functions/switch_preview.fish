function switch_preview
    set path "$argv[1]"
    kitten icat --clear --transfer-mode=memory --unicode-placeholder= --stdin=no

    if test -f "$path"
        if test ! -s "$path"
            echo "File is empty"
        else
            archive_preview "$path"
            if string match -q "image/*" (file -b --mime-type "$path")
                image_preview "$path"
            else
                file_preview "$path"
            end
        end
    else if test -d "$path"
        dir_preview "$path"
    else
        echo "Preview unavailable"
    end
end
