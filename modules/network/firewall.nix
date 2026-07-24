# https://wiki.nixos.org/wiki/Networking#Virtualization
{...}: {
  # Open ports in the firewall.
  networking = {
    nftables.enable = false;
    firewall = {
      enable = false;

      logReversePathDrops = true;
      checkReversePath = "loose";

      allowPing = false;
      allowedTCPPorts = [3000];
      allowedUDPPorts = [3000];
      # Allows the entire interface through the firewall.
      trustedInterfaces = ["virbr0"];
      # Allows individual ports through the firewall.
      interfaces = {
        virbr0 = {
          allowedUDPPorts = [
            # DNS
            53
            # DHCP
            67
            # You may want to allow more ports such as ipv6 and other services here.
          ];
        };
      };
    };
  };
}
