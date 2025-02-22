{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ###################################################
    # Developement
    ###################################################

    conda # Conda is a package manager for Python
    gnumake # Tool to control the generation of non-source files from sources
    cmake # Cross-platform, open-source build system generator
    git # Distributed version control system
    lazygit # Simple terminal UI for git commands
    neovim # Vim text editor fork focused on extensibility and agility
    alejandra # Uncompromising Nix Code Formatter
    helix # Post-modern modal text editor
    helix-gpt # Code completion LSP for Helix with support for Copilot + OpenAI
    devenv # Fast, Declarative, Reproducible, and Composable Developer Environments
    direnv # Shell extension that manages your environment

    ###################################################
    # AI
    ###################################################

    ollama # Get up and running with large language models locally
    aichat # Use GPT-4(V), Gemini, LocalAI, Ollama and other LLMs in the terminal
    aider-chat # AI pair programming in your terminal
    searxng # Fork of Searx, a privacy-respecting, hackable metasearch engine

    ###################################################
    # GAMING
    ###################################################

    /*
    mangohud # Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
    gamemode # Optimise Linux system performance on demand
    protonup-ng # CLI program and API to automate the installation and update of GloriousEggroll's Proton-GE
    gamescope # SteamOS session compositing window manager
    lutris # Open Source gaming platform for GNU/Linux
    bottles # Easy-to-use wineprefix manager
    */

    ###################################################
    # CLI
    ###################################################

    tmux # Terminal multiplexer
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
    ffmpeg # FFMPEG utility
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    btop # Monitor of resources
    zsh # Z shell
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
    bottom # System monitor
    impala # TUI for managing wifi
    wlsunset # Day/night gamma adjustments for Wayland
    mosh # Mobile shell (ssh replacement)
    xh # Friendly and fast tool for sending HTTP requests
    gh # GitHub CLI tool
    killall # Like pkill but better
    hyperfine # Command-line benchmarking tool
    udiskie # Removable disk automounter for udisks
    imagemagick # Software suite to create, edit, compose, or convert bitmap images
    chafa # Terminal graphics for the 21st century
    pokemon-colorscripts-mac # Pokémon colorscripts for the terminal
    openssl # Cryptographic library that implements the SSL and TLS protocols
    topgrade # Upgrade all the things
    tre-command # Tree command, improved
    ouch # Command-line utility for easily compressing and decompressing files and directories
    geoclue2 # Geolocation framework and some data providers
    samba # Standard Windows interoperability suite of programs for Linux and Unix

    ###################################################
    # NixOS utils
    ###################################################

    nh # Nix helper
    nvd # Nix/NixOS package version diff tool
    nix-output-monitor # Processes output of Nix commands to show helpful and pretty information
    home-manager # Nix-based user environment configurator

    ###################################################
    # Fetch everything
    ###################################################

    onefetch # Git repository summary on your terminal
    starfetch # CLI star constellations displayer
    neofetch # System information
    fastfetch # Faster ... :)

    ###################################################
    # GUI apps
    ###################################################

    thunderbird
    qbittorrent
    obsidian
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
      withTTS = true;
    })
    spotify
    tor-browser
    vlc
    vscodium
    firefox
    nemo
    signal-desktop
    orca-slicer
    whatsie
    onionshare-gui
    inkscape
    gimp
    obs-studio
    libreoffice-fresh
    qalculate-gtk
    libqalculate

    ###################################################
    # Robotics
    ###################################################

    kicad # Open Source Electronics Design Automation suite
    openscad # 3D parametric model compiler
    turbocase # Generate an OpenSCAD case template from a KiCAD PCB

    ###################################################
    # Backup
    ###################################################

    rclone # Sync files and directories to and from major cloud storage
    rclone-browser # Graphical Frontend to Rclone written in Qt

    ###################################################
    # Hyprland
    ###################################################

    ags
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
    wttrbar # Weather addon for waybar

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
    exiftool

    ###################################################
    # TEST
    ###################################################
  ];
}
