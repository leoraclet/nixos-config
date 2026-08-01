{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    nix
    alejandra
    nixfmt
    nixpkgs-fmt
  ];
}
