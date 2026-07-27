{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    nix-tree
    nix-output-monitor
    nil
    statix
    patchelf
    nix-inspect
    manix
    nh
    nvd
    nixos-shell

    nix-init
    hydra-check
    nix-update
    nixpkgs-review
    nixfmt
    nixfmt-tree
  ];
}
