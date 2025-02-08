{...}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;
    wireless.iwd.enable = true;
  };
}
