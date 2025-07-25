function waybar-theme
    set theme "$argv[1]"
    if not test -f ~/.config/waybar/config$theme.jsonc
        echo "Theme file ~/.config/waybar/config$theme.jsonc does not exist."
        return 1
    end
    if not test -f ~/.config/waybar/style$theme.css
        echo "Style file ~/.config/waybar/style$theme.css does not exist."
        return 1
    end

    echo "Setting Waybar theme to N°$theme"
    pkill waybar
    sleep 0.1
    # Start Waybar with the specified config and style files
    waybar --config ~/.config/waybar/config$theme.jsonc --style ~/.config/waybar/style$theme.css 2>/dev/null 1>/dev/null &
    if test $status -ne 0
        echo "Failed to start Waybar with the specified theme."
        return 1
    end
    echo "Waybar theme set to N°$theme successfully."
    # Wait a moment to ensure Waybar starts properly
    sleep 0.5
    disown
    # Notify the user about the theme change
    notify-send "Waybar Theme Changed" "Theme N°$theme has been applied successfully."
    # Clear the terminal to avoid clutter
    clear
end