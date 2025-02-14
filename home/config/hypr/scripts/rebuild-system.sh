#!/usr/bin/env bash

# find ~/.config -type l # Find symlinks
# find ~/.config -type l -delete # Delete symlinks

set -e

# cd to your config dir
pushd ~/Config/

# Add all potentialy untracked files
git add .
git add -A -N # Just in case (not sure what it does thought ...)

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*'; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null ||
	(
		alejandra .
		echo "formatting failed!" && exit 1
	)

# Shows your changes
git diff -U0 '*'

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

echo "Done !"

# Commit all changes witih the generation metadata
git commit -am "$current"

# Notify all OK!
notify-send -e "NixOS Rebuilt OK"

# Back to where you were
popd >/dev/null
exit 1
