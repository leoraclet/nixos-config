# Theme for graphical apps
{
  lib,
  pkgs,
  ...
}: let
  catppuccinAccent = "Blue";
  catppuccinFlavor = "Macchiato";

  catppuccinKvantum = pkgs.catppuccin-kvantum.override {
    accent = "${lib.toLower catppuccinAccent}";
    variant = "${lib.toLower catppuccinFlavor}";
  };

  qtThemeName = "catppuccin-${lib.toLower catppuccinFlavor}-${lib.toLower catppuccinAccent}";
in {
  home.packages = with pkgs; [
    papirus-folders # Icons
    catppuccinKvantum
  ];

  # Mouse cursor - Only non-blue Catppuccin
  home.pointerCursor = {
    name = "catppuccin-${lib.toLower catppuccinFlavor}-lavender-cursors";
    package = pkgs.catppuccin-cursors.${lib.toLower catppuccinFlavor + "Lavender"};
    gtk.enable = true;
  };

  # GTK Setup
  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-${lib.toLower catppuccinFlavor}-${lib.toLower catppuccinAccent}-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["${lib.toLower catppuccinAccent}"];
        size = "standard";
        variant = "${lib.toLower catppuccinFlavor}";
      };
    };
    iconTheme = {
      name = "Papirus"; # WTF?
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "${lib.toLower catppuccinFlavor}";
        accent = "${lib.toLower catppuccinAccent}";
      };
    };

    font = {
      name = "JetBrains Mono";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
  };

  dconf.settings = {
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
  };

  # Qt setup
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/${qtThemeName}".source = "${catppuccinKvantum}/share/Kvantum/${qtThemeName}";
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = qtThemeName;
    };
  };
}
