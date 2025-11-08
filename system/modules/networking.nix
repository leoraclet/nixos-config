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
        sha256 = "1qaz48jcqpfbjsll3b7ca66a8lkjzhxd80jx3yry1y8r9i0hqn5y";
      };
    in
      builtins.readFile "${hostsFile}";
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
