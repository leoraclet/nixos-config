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
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];

  programs = {
    dconf.enable = true;
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
