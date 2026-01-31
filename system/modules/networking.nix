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
        sha256 = "1afn9z72pwc5rj1k9siv0nw4c9czmp5r13gcfq6mc8hwybv9jlas";
      };
    in
      builtins.readFile "${hostsFile}";
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
