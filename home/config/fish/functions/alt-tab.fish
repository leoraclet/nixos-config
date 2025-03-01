function alt-tab
    if pgrep rofi
        killall -s SIGINT rofi
    else
        rofi -show window -show-icons
    end
end
