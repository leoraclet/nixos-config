{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [
        "hyprland"
        "gtk"
      ];
    };
  };

  environment.systemPackages = [
    # pkgs.astal.mpris
    # pkgs.swappy
    # pkgs.loupe
    # pkgs.baobab
    # pkgs.gnome-calendar
    # pkgs.gnome-system-monitor
    # pkgs.gnome-weather
    # pkgs.gnome-clocks
    # pkgs.gnome-software # for flatpak

    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];

  programs = {
    mtr.enable = true;
    fish.enable = true;
    kdeconnect.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
