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
        sha256 = "16jnn63hsgzna31w549val4g4n2kwjmx6i7x5yj16248zpx4jjcg";
      };
    in
      builtins.readFile "${hostsFile}";
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
