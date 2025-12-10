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
    set dir "$(find ~/VM -name "quickemu-windows10" -type d)"
    cd "$dir"
    quickemu --vm windows-10.conf --fullscreen --keyboard_layout fr-fr --public-dir ~/ --display spice
    cd "$current_dir"
end
