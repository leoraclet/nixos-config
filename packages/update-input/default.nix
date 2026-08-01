{pkgs, ...}:
pkgs.writeShellScriptBin "update-input" ''
  input=$(                                           \
    nix flake metadata --json                        \
    | ${pkgs.jq}/bin/jq -r ".locks.nodes.root.inputs | keys[]" \
    | ${pkgs.fzf}/bin/fzf)
  commit=$(printf "yes\no" | ${pkgs.fzf}/bin/fzf --prompt="Commit lock file? ")

  if [ "$commit" = "yes" ]; then
    nix flake update $input --commit-lock-file
  else
    nix flake update $input
  fi
''
