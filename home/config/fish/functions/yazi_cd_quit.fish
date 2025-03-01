function yazi_cd_quit
    set tmp "$(mktemp -t 'yazi-cwd.XXXXXX')"
    yazi --cwd-file="$tmp"
    set cwd $(cat "$tmp")
    if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]
        cd "$cwd"
    end
    commandline -f repaint
end
