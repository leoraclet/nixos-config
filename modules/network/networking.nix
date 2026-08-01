{...}: {
  networking = {
    hostName = "leonne";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    enableIPv6 = false;
    wireless.iwd.enable = false;

    nat = {
      enable = false;
      internalInterfaces = ["virbr0"];
    };

    extraHosts = let
      hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
      hostsFile = builtins.fetchurl {
        url = hostsPath;
        # nix-prefetch-url --type sha256 "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
        sha256 = "1awfaky6liw4j0v3jlmyzgycpmsi76r3ch7hl07n0whg5abpl409";
      };
    in
      builtins.readFile "${hostsFile}";
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
