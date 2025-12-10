function zoz
    # If a directory is passed as an argument, use it; otherwise use zoxide interactive
    if test (count $argv) -gt 0
        set ZOXIDE_RESULT $argv[1]
    else
        set ZOXIDE_RESULT (zoxide query --interactive)
    end

    # checks whether a directory has been selected
    if test -z "$ZOXIDE_RESULT"
        exit 0
    end

    # extracts the directory name from the absolute path
    set SESSION_TITLE (basename "$ZOXIDE_RESULT")

    # get the list of sessions
    set SESSION_LIST (zellij list-sessions -n ^/dev/null | awk '{print $1}')

    # Check if session already exists
    if echo "$SESSION_LIST" | grep -q "^$SESSION_TITLE\$"
        set SESSION_EXISTS yes
    else
        set SESSION_EXISTS no
    end

    # If session doesn't exist, ask for layout
    if test "$SESSION_EXISTS" = "no"
        set LAYOUT (gum choose "default" "dev" "dev-simple" --header "Choose a layout for new session:")

        if test -z "$LAYOUT"
            echo "No layout selected, aborting"
            exit 0
        end
    end

    # Check if we're already inside a zellij session
    if test -n "$ZELLIJ"
        # We're inside zellij
        if test "$SESSION_EXISTS" = "yes"
            # Try switching tab inside the same session
            zellij action switch-mode normal
            zellij action go-to-tab-name "$SESSION_TITLE" ^/dev/null
            if test $status -ne 0
                echo "Switching to existing session: $SESSION_TITLE"
                zellij action detach
                zellij attach "$SESSION_TITLE"
            end
        else
            # Need to detach and create new session
            echo "Creating new session $SESSION_TITLE at $ZOXIDE_RESULT with layout $LAYOUT"
            zellij action detach
            cd "$ZOXIDE_RESULT"
            zellij --layout "$LAYOUT" attach -c "$SESSION_TITLE"
        end
    else
        # Outside zellij
        if test "$SESSION_EXISTS" = "yes"
            zellij attach "$SESSION_TITLE"
        else
            echo "Creating new session $SESSION_TITLE at $ZOXIDE_RESULT with layout $LAYOUT"
            cd "$ZOXIDE_RESULT"
            zellij --layout "$LAYOUT" attach -c "$SESSION_TITLE"
        end
    end
end
