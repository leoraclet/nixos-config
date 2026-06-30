{...}: {
  # Open ports in the firewall.
  networking = {
    nftables.enable = false;
    firewall = {
      enable = false;
      allowPing = false;
      allowedTCPPorts = [3000];
      allowedUDPPorts = [3000];
      trustedInterfaces = ["virbr0"];
    };
  };
}
