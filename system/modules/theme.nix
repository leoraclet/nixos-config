{pkgs, ...}: {
  environment.systemPackages = [
    # Icon theme
    pkgs.papirus-icon-theme
  ];
}
