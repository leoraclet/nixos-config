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

    hydra-check
    nix-update
    nixpkgs-review
    nixfmt
    nixfmt-tree
  ];
}
