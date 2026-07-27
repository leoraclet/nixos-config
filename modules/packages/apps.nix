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
    # logseq

    # --------------------------------------------------------- #
    # Utilities
    # --------------------------------------------------------- #
    qalculate-gtk # GUI Calculator
    flameshot # Screenshot tool
    espanso-wayland # Text Expander
    hunspell
    bitwarden-cli
    # bitwarden-desktop
    # blanket
    # xremap
    # pdfsam-basic

    # --------------------------------------------------------- #
    # Office
    # --------------------------------------------------------- #
    onlyoffice-desktopeditors # Office suite
    # mattermost
    # teamspeak6-client
    # mumble
    # stoat-desktop
    # element-desktop
    # rocketchat-desktop
    # libreoffice-qt
    # zotero
    # foliate
    # jitsi-meet
    # focuswriter

    # --------------------------------------------------------- #
    # Editors
    # --------------------------------------------------------- #
    zed-editor-fhs
    notepad-next
    vscodium
    lapce

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
    vlc
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
    # stm32flash
    # stm32loader
    # stm32cubemx

    # --------------------------------------------------------- #
    # 3D
    # --------------------------------------------------------- #
    godot
    blender
  ];
}
