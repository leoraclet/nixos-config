{pkgs, ...}: {
  ###################################################
  # GUI apps
  ###################################################

  environment.systemPackages = with pkgs; [
    # --------------------------------------------------------- #
    # Common
    # --------------------------------------------------------- #
    thunderbird # Email client
    obsidian # Note app
    spotify # Music player
    vesktop # Discord alternative client
    brave # Chronium-based web browser
    onlyoffice-desktopeditors # Office suite
    # libreoffice-fresh

    # --------------------------------------------------------- #
    # Utilities
    # --------------------------------------------------------- #
    qalculate-gtk # GUI Calculator
    flameshot # Screenshot tool
    espanso-wayland # Text Expander

    # --------------------------------------------------------- #
    # Editors
    # --------------------------------------------------------- #
    zed-editor-fhs
    sublime4
    vscodium

    # --------------------------------------------------------- #
    # Files
    # --------------------------------------------------------- #
    localsend
    file-roller
    nemo

    # --------------------------------------------------------- #
    # Images
    # --------------------------------------------------------- #
    # pinta
    # krita
    # gimp
    # inkscape

    # --------------------------------------------------------- #
    # Videos
    # --------------------------------------------------------- #
    # libsForQt5.kdenlive
    # davinci-resolve-studio
    # obs-studio

    # --------------------------------------------------------- #
    # Sync / Backups
    # --------------------------------------------------------- #
    # syncthing
    # rclone
    # rclone-browser
    # restic
    # borgbackup
    # veracrypt
    # cryptomator

    # --------------------------------------------------------- #
    # Remote
    # --------------------------------------------------------- #
    freerdp
    # remmina
    # rustdesk
    # scrcpy
    # qtscrcpy

    # --------------------------------------------------------- #
    # Engineering
    # --------------------------------------------------------- #
    # freecad
    # kicad
    # openscad
    # cura-appimage
    # orca-slicer
    # arduino-ide
  ];
}
