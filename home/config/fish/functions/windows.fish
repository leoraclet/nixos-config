function windows

    # set current_dir "$(pwd)"
    # set dir "$(find ~/VM -name "docker-windows" -type d)"
    # cd "$dir"
    # docker compose up -d
    # sleep 10
    # xfreerdp /v:127.0.0.1:3389 /u:admin /p:admin /timeout:10000 -f
    # docker compose stop
    # cd "$current_dir"

    set current_dir "$(pwd)"
    set dir "$(find ~/Data/VM -name "quickemu-windows10" -type d)"
    cd "$dir"

    if test (count $argv) -gt 0
        if test "$argv[1]" = "kill"
            kill -9 windows-10
            commandline -f repaint
            return
        end

        if test "$argv[1]" = "spice"
            quickemu --vm windows-10.conf --fullscreen --keyboard_layout fr-fr --public-dir ~/ --display spice --extra_args "-enable-kvm"
        end
    else
        if test -n "$(pgrep windows-10)"
            xfreerdp /f /v:127.0.0.1:3389 /u:quickemu /p:quickemu /cert:tofu
            cd "$current_dir"
            commandline -f repaint
            return
        end
    end

    quickemu --vm windows-10.conf --fullscreen --keyboard_layout fr-fr --public-dir ~/ --display none --extra_args "-enable-kvm"
    cd "$current_dir"
    commandline -f repaint
end
