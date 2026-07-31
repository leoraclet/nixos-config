{...}: {
  imports = [
    ./dev.nix
    ./flatpak.nix
    ./apps.nix
    ./lsp.nix
    ./terminal.nix
    ./nix-tools.nix
    # ./gaming.nix
  ];
}
