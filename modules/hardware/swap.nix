{...}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 50;
  };

  systemd.oomd.enable = true;

  # Already in hardware-configuration.nix
  swapDevices = [
    {
      device = "/dev/disk/by-label/NIXOS_SWAP";
      randomEncryption.enable = false;
    }
  ];
}
