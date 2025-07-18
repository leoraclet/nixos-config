{...}: {
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    enableIPv6 = false;
    wireless.iwd.enable = true;
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
