{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    udiskie # Removable disk automounter for udisks
    usbutils # USB utilities
  ];
}
