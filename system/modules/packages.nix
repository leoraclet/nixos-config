{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ###################################################
    # Dev
    ###################################################

    conda # Conda is a package manager for Python
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
    devenv # Fast, Declarative, Reproducible, and Composable Developer Environments
    direnv # Shell extension that manages your environment
    ghdl-llvm # VHDL 2008/93/87 simulator
    iverilog # Icarus Verilog compiler
    scrcpy # Display and control Android devices over USB or TCP/IP

    ###################################################
    # AI
    ###################################################

    ollama # Get up and running with large language models locally

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
    texliveFull # TeX Live environment
    bottom # System monitor
    impala # TUI for managing wifi
    wlsunset # Day/night gamma adjustments for Wayland
    mosh # Mobile shell (ssh replacement)
    xh # Friendly and fast tool for sending HTTP requests
    gh # GitHub CLI tool
    killall # Like pkill but better

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

    thunderbird
    qbittorrent
    obsidian
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    spotify
    tor-browser
    vlc
    vscodium
    firefox
    xfce.thunar
    signal-desktop
    orca-slicer
    whatsie
    onionshare-gui
    inkscape
    obs-studio
    libreoffice-fresh
    qalculate-gtk

    ###################################################
    # Hyprland
    ###################################################

    appimage-run
    clipse
    networkmanagerapplet
    hypridle
    hyprlock
    hyprpicker
    hyprpaper
    kitty
    libnotify
    dunst
    wlogout
    wl-clipboard
    rofi-wayland
    waybar

    ###################################################
    # Hacking
    ###################################################

    #wireshark
    #burpsuite
    #nmap
    #sqlmap
    #metasploit
    #sage
    #aircrack-ng
    #scalpel
    #hashcat
    #hashcat-utils
    #john
    #radare2
    #cutter
    #ghidra
    #ida-free
    #metasploit
    #nth
    #theharvester
    imagemagick
    exiftool
  ];
}
