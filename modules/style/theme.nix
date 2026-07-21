{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Icon theme
    papirus-folders
    papirus-icon-theme
    # Cursor theme
    bibata-cursors
    # Apps to customize looks
    nwg-look
    adw-gtk3
    kdePackages.qt6ct
  ];
}
