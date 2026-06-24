{pkgs, ...}: {
  home.packages = with pkgs; [
    papirus-folders # Icons
    nwg-look
    adw-gtk3
    kdePackages.qt6ct
  ];
}
