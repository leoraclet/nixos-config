{pkgs, ...}: {
  programs.niri.enable = false;

  environment.systemPackages = with pkgs; [
    # niri
    xwayland-satellite
  ];
}
