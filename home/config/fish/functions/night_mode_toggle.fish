function night_mode_toggle
    set target_process wlsunset

    if pgrep $target_process >/dev/null
        killall -s SIGINT wlsunset
    else
        wlsunset -T 9000
    end
end
