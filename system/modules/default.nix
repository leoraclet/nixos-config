{...}: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./internationalisation.nix
    ./networking.nix
    ./nixsettings.nix
    ./packages.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
    ./swap.nix
    ./system.nix
    ./theme.nix
    ./dns.nix
    #./upgrade.nix
    ./fhs.nix
    ./firewall.nix
    ./lsp.nix
  ];
}
