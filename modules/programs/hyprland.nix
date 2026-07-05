{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  ###################################################
  # Hyprland
  ###################################################

  # Dependencies for compositor and desktop shell
  environment.systemPackages = with pkgs; [
    nwg-displays
    networkmanagerapplet
    hyprpolkitagent
    hyprpicker
    cliphist
    wlsunset
    wl-clipboard
    wl-screenrec
    wl-mirror
    libnotify
    playerctl # Player control
    brightnessctl # Screen control
  ];
}
