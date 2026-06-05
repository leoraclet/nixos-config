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
    lazygit # Simple terminal UI for git commands
    alejandra # Uncompromising Nix Code Formatter
    evil-helix # Post-modern modal text editor, with vim keybindings
    devenv # Fast, Declarative, Reproducible, and Composable Developer Environments
    direnv # Shell extension that manages your environment
    devbox # Instant, easy, predictable shells and containers
    license-generator # Command-line tool for generating license files
    git-ignore # Quickly and easily fetch .gitignore templates from gitignore.io

    # Languages
    uv # Extremely fast Python package installer and resolver, written in Rust
    go # Go programming language
    lua # Powerful, fast, lightweight, embeddable scripting language
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

    zellij # Terminal workspace with batteries included
    unzip # Extraction utility for archives compressed in .zip format
    dust # Disk analyzer
    dua # Disk usage analyzer
    yazi # Terminal file manager
    duf # Disk Usage/Free Utility
    grim # Wayland image grabber
    slurp # Wayland region selector
    poppler # PDF rendering library
    atuin # Sqlite bash history
    delta # Syntax-highlighting pager for git
    tealdeer # Very fast implementation of tldr (aka man) in Rust
    swappy # Snapshot editing tool
    imv # Image viewer
    mpv # Media player
    bat # Like cat, but WAY betters
    eza # Like ls, but better
    zoxide # A better cd
    cava # Console-based Audio Visualizer for Alsa
    playerctl # Player control
    brightnessctl # Screen control
    pulseaudio # Audio control
    usbutils # USB utilities
    fd # File finder
    jq # JSON parser
    sd # Intuitive find and replace (sed alternative)
    file # File Command
    fzf # Fuzzy finder
    skim # fzf, but in Rust
    ripgrep # Text search
    ffmpeg # FFMPEG utility
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    btop # Monitor of resources
    cmatrix # Terminal matrix effect
    hexyl # Command-line hex viewer
    pandoc # Conversion between documentation formats
    zathura # PDF viewer
    rsclock # Terminal clock
    procs # Like ps, but cooler
    starship # Cross-shell prompt
    avizo # Notification deamon for multimedia keys
    pamixer # PulseAudio command line mixer
    bluez-tools # Set of tools to manage bluetooth devices
    texliveFull # TeX Live environment
    gh # GitHub CLI tool
    killall # Like pkill but better
    udiskie # Removable disk automounter for udisks
    imagemagickBig # Software suite to create, edit, compose, or convert bitmap images
    ghostscript # PostScript interpreter
    pdftk # PDF toolbox
    chafa # Terminal graphics for the 21st century
    openssl # Crptographic library that implements the SSL and TLS protocols
    tre-command # Tree command, improved
    ouch # Command-line utility for easily compressing and decompressing files and directories
    gzip # GNU zip compression program
    zip # Compressor/archiver for creating and modifying zipfiles
    unrar # Utility for RAR archives
    broot # Interactive tree view, a fuzzy search, a balanced BFS descent and customizable commands
    samba # Standard Windows interoperability suite of programs for Linux and Unix
    libqalculate # Advanced calculator library
    calc # C-style arbitrary precision calculator
    fish # Smart and user-friendly command line shell
    xh # Friendly and fast tool for sending HTTP requests
    aria2 # Lightweight multi-protocol & multi-source command-line download utility
    mosh # Mobile shell that allows roaming, supports intermittent connectivity, and provides intelligent local echo
    openvpn3 # OpenVPN 3 Linux Client
    openvpn # Robust and highly flexible tunneling application
    inetutils # Collection of common network programs
    moreutils # Growing collection of the unix tools that nobody thought to write long ago when unix was young
    posting # Modern API client that lives in your terminal
    websocat # Command-line client for WebSockets (like netcat/socat)
    socat # Utility for bidirectional data transfer between two independent data channels
    fswatch # Cross-platform file change monitor with multiple backends
    gnupg # Modern release of the GNU Privacy Guard, a GPL OpenPGP implementation
    gum # Tasty Bubble Gum for your shell
    mprocs # TUI tool to run multiple commands in parallel and show the output of each command separately
    trashy # Simple, fast, and featureful alternative to rm and trash-cli
    kmon # Linux Kernel Manager and Activity Monitor
    dig # Domain name server

    ###################################################
    # GUI apps
    ###################################################

    thunderbird
    obsidian
    (discord-canary.override {
      withOpenASAR = true;
      withVencord = true;
      withTTS = true;
    })
    spotify
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
    pavucontrol
    kitty
    libnotify
    flameshot

    ###################################################
    ###################################################
  ];
}
