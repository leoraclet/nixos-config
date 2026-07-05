{...}: {
  imports = [
    ./printing.nix
    ./power.nix
    ./scanner.nix
    ./bluetooth.nix
    ./graphics.nix
    ./sound.nix
    ./swap.nix
    ./firmware.nix
    ./usb.nix
    # ./nvidia.nix
    # ./amd.nix
  ];
}
