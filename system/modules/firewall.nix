{...}: {
  # Open ports in the firewall.
  networking.firewall.enable = false;
  #networking.firewall.allowedTCPPorts = [ 3000 ];
  #networking.firewall.allowedUDPPorts = [ 3000 ];
  networking.firewall.trustedInterfaces = ["virbr0"];
}
