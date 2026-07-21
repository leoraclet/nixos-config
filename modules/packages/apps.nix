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
    # qbittorrent
    # motrix
    # persepolis

    # --------------------------------------------------------- #
    # Utilities
    # --------------------------------------------------------- #
    qalculate-gtk # GUI Calculator
    flameshot # Screenshot tool
    espanso-wayland # Text Expander
    hunspell
    # blanket
    # xremap
    # pdfsam-basic

    # --------------------------------------------------------- #
    # Office
    # --------------------------------------------------------- #
    onlyoffice-desktopeditors # Office suite
    # libreoffice-qt
    # zotero
    # foliate
    # jitsi-meet

    # --------------------------------------------------------- #
    # Editors
    # --------------------------------------------------------- #
    zed-editor-fhs
    notepad-next
    joplin
    vscodium
    # lapce

    # --------------------------------------------------------- #
    # Files
    # --------------------------------------------------------- #
    localsend
    file-roller
    nemo-with-extensions

    # --------------------------------------------------------- #
    # Images
    # --------------------------------------------------------- #
    # pinta
    # krita
    # gimp
    # inkscape
    # rawtherapee
    # darktable
    # digikam

    # --------------------------------------------------------- #
    # Videos & Audio
    # --------------------------------------------------------- #
    # libsForQt5.kdenlive
    # shotcut
    # davinci-resolve-studio
    # obs-studio
    # losslesscut-bin
    # audacity
    # lmms
    # ardour
    # handbrake

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
