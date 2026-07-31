{
  modulesPath,
  lib,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./hardware-configuration.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = with pkgs;
    map lib.lowPrio [
      curl
      gitMinimal
      neovim
    ];

  users.users.root.initialHashedPassword = "$y$j9T$umqR8hCW0RMD3RCYEzMKe1$lAYOAA5uLE7uJKXnppWf1doq70SrBi9dnY86bduFkS7";
  users.mutableUsers = true;
  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "# CHANGE"
  ];

  system.stateVersion = "24.05";
}
