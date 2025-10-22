{
  lib,
  pkgs,
  ...
}: {
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    enableIPv6 = false;
    wireless.iwd.enable = true;
    extraHosts = let
      hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
      hostsFile = builtins.fetchurl {
        url = hostsPath;
        # nix-prefetch-url --type sha256 "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
        sha256 = "1kjr0jrr6dbjy1sqgsj5pkay5ksd234s18qylq2vv4yh8ij0h8ir";
      };
    in
      builtins.readFile "${hostsFile}";
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
