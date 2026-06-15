{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  environment.systemPackages = with pkgs; [
    ###################################################
    # Developement
    ###################################################

    # Tools
    gnumake # Tool to control the generation of non-source files from sources
    just # Handy way to save and run project-specific commands
    git # Distributed version control system
    git-credential-manager # Git credential manager for secure authentication
    alejandra # Uncompromising Nix Code Formatter
    evil-helix # Post-modern modal text editor, with vim keybindings
    direnv # Shell extension that manages your environment

    # Languages
    uv # Extremely fast Python package installer and resolver, written in Rust
    bun # Incredibly fast JavaScript runtime, bundler, transpiler and package manager
    jdk # Open-source Java Developement Kit
    gcc # GNU Compiler Collection, a set of compilers for various programming languages

    ###################################################
    # GAMING & WINDOWS COMPATIBILITY
    ###################################################

    # mangohud # Vulkan and OpenGL overlay for monitoring
    # gamemode # Optimise Linux system performance on demand
    # protonup-ng # CLI program and API to automate the installation and update of Proton-GE
    # gamescope # SteamOS session compositing window manager
    # lutris # Open Source gaming platform for GNU/Linux
    # bottles # Easy-to-use wineprefix manager
    # wine-wayland # Open Source implementation of the Windows API on top of X, OpenGL, and Unix
    # winetricks # Script to install DLLs needed to work around problems in Wine

    ###################################################
    # CLI
    ###################################################

    tmux # Terminal workspace with batteries included
    tesseract
    zbar
    dust # Disk analyzer
    dua # Disk usage analyzer
    duf # Disk Usage/Free Utility
    yazi # Terminal file manager
    poppler # PDF rendering library
    atuin # Sqlite bash history
    tealdeer # Very fast implementation of tldr (aka man) in Rust
    imv # Image viewer
    mpv # Media player
    bat # Like cat, but WAY betters
    eza # Like ls, but better
    zoxide # A better cd
    playerctl # Player control
    brightnessctl # Screen control
    pulseaudio # Audio control
    usbutils # USB utilities
    fd # File finder
    jq # JSON parser
    sd # Intuitive find and replace (sed alternative)
    file # File Command
    fzf # Fuzzy finder
    ripgrep # Text search
    ffmpeg # FFMPEG utility
    grim
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    btop # Monitor of resources
    hexyl # Command-line hex viewer
    pandoc # Conversion between documentation formats
    zathura # PDF viewer
    procs # Like ps, but cooler
    starship # Cross-shell prompt
    texliveFull # TeX Live environment
    killall # Like pkill but better
    udiskie # Removable disk automounter for udisks
    imagemagickBig # Software suite to create, edit, compose, or convert bitmap images
    ghostscript # PostScript interpreter
    pdftk # PDF toolbox
    chafa # Terminal graphics for the 21st century
    openssl # Crptographic library that implements the SSL and TLS protocols
    ouch # Command-line utility for easily compressing and decompressing files and directories
    gzip # GNU zip compression program
    zip # Compressor/archiver for creating and modifying zipfiles
    broot # Interactive tree view, a fuzzy search, a balanced BFS descent and customizable commands
    samba # Standard Windows interoperability suite of programs for Linux and Unix
    libqalculate # Advanced calculator library
    calc # C-style arbitrary precision calculator
    fish # Smart and user-friendly command line shell
    inetutils # Collection of common network programs
    moreutils # Growing collection of the unix tools that nobody thought to write long ago when unix was young
    socat # Utility for bidirectional data transfer between two independent data channels
    gnupg # Modern release of the GNU Privacy Guard, a GPL OpenPGP implementation
    trashy # Simple, fast, and featureful alternative to rm and trash-cli

    # unrar
    # unzip

    ###################################################
    # GUI apps
    ###################################################

    thunderbird
    obsidian
    spotify
    vesktop
    vlc
    vscodium
    firefox
    nemo
    onlyoffice-desktopeditors
    qalculate-gtk
    brave # A chromium based browser as an alternative if needed
    freerdp
    sublime4
    localsend
    zed-editor-fhs

    # tor-browser
    # obs-studio
    # inkscape
    # gimp
    # syncthing
    # cryptomator
    # veracrypt
    # cryptpad
    # jitsi-meet-electron
    # remmina
    # rustdesk
    # insomnia
    # libsForQt5.kdenlive

    ###################################################
    # Backup (not used now)
    ###################################################

    # rclone # Sync files and directories to and from major cloud storage
    # rclone-browser # Graphical Frontend to Rclone written in Qt

    ###################################################
    # Hyprland
    ###################################################

    networkmanagerapplet
    hyprpolkitagent
    hyprpicker
    cliphist
    wlsunset
    wl-clipboard
    wl-screenrec
    wl-mirror
    pavucontrol
    kitty
    libnotify
    flameshot

    ###################################################
    ###################################################
  ];
}
