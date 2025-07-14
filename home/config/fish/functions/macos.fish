function macos
    set current_dir "$(pwd)"
    set dir "$(find ~/VM/ -name "docker-macos" -type d)"
    cd "$dir"
    docker compose up -d
    sleep 5
    xfreerdp /v:127.0.0.1:3389 /u:admin /p:admin /timeout:10000 -f
    docker compose stop
    cd "$current_dir"
end