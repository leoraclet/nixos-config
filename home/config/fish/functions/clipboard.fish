function clipboard
    if pgrep clipse
        killall -s SIGINT clipse
    else
        kitty --class clipse -e clipse
    end
end
