# Theme for graphical apps
{
  lib,
  pkgs,
  ...
}: let
  catppuccinFlavor = "Macchiato";
in {
  home.packages = with pkgs; [
    papirus-folders # Icons
    nwg-look
    adw-gtk3
    kdePackages.qt6ct
  ];

  # Mouse cursor - Only non-blue Catppuccin
  home.pointerCursor = {
    name = "catppuccin-${lib.toLower catppuccinFlavor}-lavender-cursors";
    package = pkgs.catppuccin-cursors.${lib.toLower catppuccinFlavor + "Lavender"};
    gtk.enable = true;
  };
}
