{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    overwriteBackup = true;
    backupFileExtension = "bak";
    users.leonne = {
      imports = [
        ../../home/user
      ];
    };
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  # Setup second SSD
  fileSystems."/home/leonne/Data" = {
    device = "/dev/disk/by-label/NIXOS_DATA";
    fsType = "ext4";
    options = [
      "defaults"
      "user"
      "nofail"
      "rw"
    ];
  };

  ################################################
  # EXAMPLES (with NTFS)
  ################################################

  # fileSystems."/home/leonne/Documents" = {
  #   device = "/dev/disk/by-uuid/26923F4A923F1E2D";
  #   fsType = "ntfs-3g";
  #   options = ["rw" "nofail" "uid=1000" "gid=100" "dmask=017" "fmask=017"];
  # };

  system.stateVersion = "25.05";
}
