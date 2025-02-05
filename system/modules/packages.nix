{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Dev
    gnumake
    cmake
    gcc
    go
    lua
    zig
    clang
    git
    lazygit
    neovim
    alejandra

    # AI
    ollama
    oterm

    # CLI
    tmux
    calc
    dust
    yazi
    thefuck
    dysk
    grim
    slurp
    poppler
    atuin
    delta
    tldr
    swappy
    imv
    mpv
    bat
    eza
    zoxide
    cava
    playerctl
    brightnessctl
    pulseaudio
    usbutils
    fd
    jq
    sd
    file
    fzf
    ripgrep
    ffmpeg-full
    wget
    neofetch
    btop
    zsh
    cmatrix
    tokei
    hexyl
    pandoc
    zathura
    rsclock
    procs
    starship

    # Fetch
    onefetch
    cpufetch
    ramfetch
    starfetch
    bottom

    # GUI apps
    libreoffice-qt6
    thunderbird
    qbittorrent
    obsidian
    vesktop
    spotify
    tor-browser
    vlc
    vscode
    inkscape
    gimp
    obs-studio
    steam
    librewolf
    xfce.thunar

    # Hyprland
    clipse
    networkmanagerapplet
    eww
    hypridle
    hyprlock
    hyprpaper
    kitty
    libnotify
    dunst
    qt5.qtwayland
    qt6.qtwayland
    wlogout
    wl-clipboard
    rofi-wayland
    waybar
    udiskie
  ];
}
