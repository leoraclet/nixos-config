{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Icon theme
    papirus-folders
    papirus-icon-theme
    # Cursor theme
    bibata-cursors
  ];
}
