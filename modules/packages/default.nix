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

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    allowBroken = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
}
