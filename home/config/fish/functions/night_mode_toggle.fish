function night_mode_toggle
    set target_process hyprsunset

    if pgrep $target_process >/dev/null
        killall -s SIGINT hyprsunset
    else
        hyprsunset --temperature 2500
    end
end
