{...}: {
  imports = [
    ./hardware
    ./network
    ./packages
    ./programs
    ./security
    ./style
    ./system
    ./user

    ./overlays.nix
  ];
}
