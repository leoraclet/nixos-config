{...}: {
  imports = [
    ./dev.nix
    ./flatpak.nix
    ./apps.nix
    ./lsp.nix
    ./gaming.nix
    ./terminal.nix
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
