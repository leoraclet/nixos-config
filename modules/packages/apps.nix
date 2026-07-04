{pkgs, ...}: {
  ###################################################
  # GUI apps
  ###################################################

  environment.systemPackages = with pkgs; [
    thunderbird
    espanso-wayland # Text Expander
    obsidian
    spotify
    vesktop
    vscodium
    nemo
    onlyoffice-desktopeditors
    qalculate-gtk
    brave # A chromium based browser as an alternative if needed
    freerdp
    sublime4
    localsend
    zed-editor-fhs
    flameshot
    file-roller

    # tor-browser
    # obs-studio
    # inkscape
    # gimp
    # pinta
    # syncthing
    # cryptomator
    # veracrypt
    # cryptpad
    # jitsi-meet-electron
    # remmina
    # rustdesk
    # insomnia
    # libsForQt5.kdenlive
    # davinci-resolve-studio
  ];
}
