function image-preview
    # Retrieve the current terminal dimensions and reduce them slightly to avoid boundary issues
    set term_width (math (tput cols) - 1)
    set term_height (math (tput lines) - 1)

    chafa "$argv[1]" --size="$term_width"x"$term_height" -f kitty
end
