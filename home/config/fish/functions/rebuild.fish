function rebuild
    # cd to your config dir
    pushd ~/Config/ >/dev/null

    # Remove log if it exists
    and sudo rm -f nixos-switch.log

    echo "Detecting changes..."

    # Early return if no changes were detected
    if git diff --quiet '*'
        echo "No changes detected, exiting."
        popd >/dev/null
        return 0
    end

    echo "Formatting..."

    # Autoformat your nix files
    alejandra .

    echo "Config formatted!"

    # Add all potentially untracked files
    git add . -A -N

    echo "Deleting old config files and folders..."

    sudo find ~/ -name "*.dotfiles_backup" | xargs rm -rf > nixos-switch.log 2>&1

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log tracebacks
    if not sudo nixos-rebuild build --sudo --flake ./#leonne > nixos-switch.log 2>&1
        cat nixos-switch.log | grep --color error
        notify-send -e "BUILD FAILED !!" -t 5000
        popd >/dev/null
        return 1
    end

    echo "Build successful"

    # Remove all symlinks of home-manager from previous generation
    sudo find ~/.config -type l -delete > nixos-switch.log 2>&1

    echo "Switching to new configuration..."

    # If it built successfully, switch to new configuration
    if not sudo nixos-rebuild switch --sudo --flake ./#leonne > nixos-switch.log 2>&1
        cat nixos-switch.log | grep --color error
        notify-send -e "SWITCH FAILED !!" -t 5000
        popd >/dev/null
        return 1
    end

    # Get current generation metadata
    set current (nixos-rebuild list-generations --json | jq -r '.[0].date')

    echo "Done!"
    # Notify all OK!
    notify-send -e "NixOS Rebuilt OK" -t 2000

    # Commit all changes with the generation metadata
    git commit -am "$current"

    echo "Removing unnecessary files and folders..."

    # Remove log, build, and backup files
    sudo find ~/ -name "*.dotfiles_backup" | xargs rm -rf > nixos-switch.log 2>&1

    sudo rm nixos-switch.log
    sudo rm -rf result

    # Back to where you were
    popd >/dev/null
end
