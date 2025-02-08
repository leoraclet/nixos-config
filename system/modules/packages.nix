{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ###################################################
    # Dev
    ###################################################

    gnumake # Make utility
    cmake # CMake utility
    gcc # GCC compiler
    go # GO programming language
    lua # LUA programming language
    zig # ZIG programming language
    bun # Incredibly fast JavaScript runtime, bundler, transpiler and package manager
    clang # C/C++ LLVM compiler
    git # Git utility
    lazygit # Git interface
    neovim # Modal text editor
    alejandra # Nix language formatter
    uv # Python package manager
    helix # Modern modal text editor

    ###################################################
    # AI
    ###################################################

    ollama # Get up and running with large language models locally
    oterm # Text-based terminal client for Ollama

    ###################################################
    # CLI
    ###################################################

    tmux # Terminal multiplexer
    calc # C-style arbitrary precision calculator
    dust # Disk analyzer
    dua # Disk usage analyzer
    yazi # Terminal file manager
    thefuck # Command correcter
    dysk # Filesystem information (like df but better)
    grim # Wayland image grabber
    slurp # Wayland region selector
    poppler # PDF rendering library
    atuin # Sqlite bash history
    delta # Syntax-highlighting pager for git
    tldr # Like man but better
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
    ripgrep # Text search
    ffmpeg-full # FFMPEG utility
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    neofetch # Fast, highly customizable system info script
    btop # Monitor of resources
    zsh # Z shell
    cmatrix # Terminal matrix effect
    tokei # Program that allows you to count your code, quickly
    hexyl # Command-line hex viewer
    pandoc # Conversion between documentation formats
    zathura # PDF viewer
    rsclock # Terminal clock
    procs # Like ps, but cooler
    starship # Cross-shell prompt
    avizo # Notification deamon for multimedia keys
    pamixer # PulseAudio command line mixer
    bluez-tools # Set of tools to manage bluetooth devices
    rsync # Fast incremental file transfer utility
    texliveFull # TeX Live environment
    wf-recorder # Screen recording
    bottom # System monitor
    impala # TUI for managing wifi

    ###################################################
    # NixOS utils
    ###################################################

    nh # Nix helper
    nvd # Nix/NixOS package version diff tool
    nix-output-monitor # Processes output of Nix commands to show helpful and pretty information

    ###################################################
    # Fetch everything
    ###################################################

    onefetch # Git repo
    cpufetch # Cpu
    ramfetch # Memory

    ###################################################
    # GUI apps
    ###################################################

    libreoffice-qt6
    thunderbird
    qbittorrent
    obsidian
    vesktop
    spotify
    tor-browser
    vlc
    vscodium
    firefox
    xfce.thunar
    signal-desktop
    orca-slicer
    whatsie

    ###################################################
    # Hyprland
    ###################################################

    clipse
    networkmanagerapplet
    hypridle
    hyprlock
    hyprpaper
    kitty
    libnotify
    dunst
    wlogout
    wl-clipboard
    rofi-wayland
    waybar
  ];
}
