function rebuild-test
    echo "Rebuild ... TODO"

    set -e

    pushd ~/Config/

    if git diff --quiet '*'
        echo "No changes detected, exiting."
        popd
        exit 0
    end

    alejandra . &>/dev/null || echo "formatting failed!" && exit 1

    # Show your changes
    git diff -U0 '*'

    # Add all potentialy untracked files
    git add .

    echo "NixOS rebuilding ..."

    sudo nixos-rebuild build --flake ./#leonne &>nixos-switch.log || cat nixos-switch.log | grep --color error && exit 1

    # Remove all symbolic links of home-manager and remove backup file
    rm -rf ~/.vscode-oss
    rm -rf ~/.config/**/*.bkp

    find ~/.config -type l -delete

    echo "Build successfull"
    echo "Switching to new configuration ..."

    # If it built successfully then switch to the new configuration
    sudo nixos-rebuild switch --flake ./#leonne &>nixos-switch.log || cat nixos-switch.log | grep --color error && exit 1

    # Get current generation metadata
    set current $(nixos-rebuild list-generations | grep current)

    echo "Done !"

    # Commit all changes witih the generation metadata
    git commit -am "$current"

    # Notify all OK!
    notify-send -e "NixOS Rebuilt OK" -t 2000

    # Remove log and build filesr
    rm nixos-switch.log
    rm -rf result

    # Back to where you were
    popd >/dev/null
    exit 1
end
