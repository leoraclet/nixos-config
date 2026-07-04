{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    ###################################################
    # Hyprland
    ###################################################
    networkmanagerapplet
    hyprpolkitagent
    hyprpicker
    cliphist
    wlsunset
    wl-clipboard
    wl-screenrec
    wl-mirror
    pavucontrol
    alsa-utils
    libnotify
  ];
}
