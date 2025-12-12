function wallify
    set wall_dir "$HOME/Pictures/Wallpapers"
    set cwd (pwd)

    cd $wall_dir || return 1

    set selected_wall (for a in *.jpg *.png
        echo -en "$a\0icon\x1f$a\n"
    end | rofi -dmenu -p "")

    cd $cwd || return 1
end
