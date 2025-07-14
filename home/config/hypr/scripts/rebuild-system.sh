#!/usr/bin/env bash

set -e

# cd to your config dir
pushd ~/Config/

# Remove log if exist
rm -rf nixos-switch.log

echo "Detect changes ..."

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*'; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

echo "Formatting ..."

# Autoformat your nix files
alejandra .

echo "Config formatted !"

# Shows your changes
git diff -U0 '*'

# Add all potentialy untracked files
git add .
git add -A -N # Just in case (not sure what it does thought ...)

echo "Deleting old config files and folders ..."

sudo find ~/ -name "*.dotfiles_backup" | xargs rm -rf &>nixos-switch.log

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild build --flake ./#leonne &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Remove all symlinks of home-manager
sudo find ~/.config -type l -delete &>nixos-switch.log

echo "Build successfull"
echo "Switching to new configuration ..."

# If it built successfully
sudo nixos-rebuild switch --flake ./#leonne &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep "True")

echo "Done !"

# Commit all changes witih the generation metadata
git commit -am "$current"

# Notify all OK!
notify-send -e "NixOS Rebuilt OK" -t 2000

echo "Removing unnecessary files and folders ..."

# Remove log, build and backup files
sudo find ~/ -name "*.dotfiles_backup" | xargs rm -rf &>nixos-switch.log
rm nixos-switch.log
rm -rf result

# Back to where you were
popd >/dev/null
exit 1
