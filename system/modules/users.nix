{pkgs, ...}: {
  users.users.leonne = {
    isNormalUser = true;
    description = "leonne";
    # To avoid being locked out after first install of the system
    # Because by default a new user don't have a password if not set with Nix
    initialPassword = "nixos"; # FIXME: Change user password after first login
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "qemu"
      "kvm"
      "libvirtd"
      "input"
      "video"
      "audio"
      "scanner"
      "lp"
    ];
    shell = pkgs.fish;
    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.fish;
  # Allows to change the initial password to a more robust one after firt login.
  users.mutableUsers = true;
}
