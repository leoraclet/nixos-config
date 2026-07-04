{...}: {
  imports = [
    ./networking.nix
    ./dns.nix
    ./firewall.nix
    ./openvpn.nix
    ./ssh.nix
  ];
}
