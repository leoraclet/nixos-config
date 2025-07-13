function night_mode_toggle
    set target_process wlsunset

    if pgrep $target_process >/dev/null
        killall -s SIGINT wlsunset
    else
        wlsunset -l 39.9 -L 116.3
    end
end
