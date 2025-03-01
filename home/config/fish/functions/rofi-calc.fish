function rofi-calc
    if pgrep rofi
        killall -s SIGINT rofi
    else
        set calc_result ""
        set result ""

        while true
            set result $(rofi -i -dmenu -mesg "$result = $calc_result")

            if [ $status -ne 0 ]
                exit
            end

            if [ -n "$result" ]
                set calc_result $(qalc -t "$result")
                echo "$calc_result" | wl-copy
            end
        end
    end
end
