{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    neovim # Vim text editor fork focused on extensibility and agility
    alejandra # Uncompromising Nix Code Formatter
    evil-helix # Post-modern modal text editor, with vim keybindings
    devenv # Fast, Declarative, Reproducible, and Composable Developer Environments
    direnv # Shell extension that manages your environment
    pari # Computer algebra system for high-performance number theory computations
    devbox # Instant, easy, predictable shells and containers
    ansible # Radically simple IT automation
    terraform # Tool for building, changing, and versioning infrastructure
    license-generator # Command-line tool for generating license files
    git-ignore # Quickly and easily fetch .gitignore templates from gitignore.io

    # Languages
    uv # Extremely fast Python package installer and resolver, written in Rust
    go # Go programming language
    lua # Powerful, fast, lightweight, embeddable scripting language
    bun # Incredibly fast JavaScript runtime, bundler, transpiler and package manager
    jdk # Open-source Java Developement Kit
    gcc # GNU Compiler Collection, a set of compilers for various programming languages
    clang # C, C++, and Objective-C compiler
    lld # LLVM linker, a drop-in replacement for GNU ld
    lldb # LLVM debugger, a drop-in replacement for GNU gdb
    musl # Lightweight, fast, and simple C standard library implementation
    zig # General-purpose programming language designed for robustness, optimality, and clarity
    nim # Nim programming language, a statically typed compiled systems programming language
    rustup # Toolchain installer for the Rust programming language
    nodejs_24 # JavaScript runtime built on Chrome's V8 JavaScript engine
    python312 # Python programming language, version 3.12

    ###################################################
    # AI
    ###################################################

    ollama # Get up and running with large language models locally
    aichat # Use GPT-4(V), Gemini, LocalAI, Ollama and other LLMs in the terminal
    aider-chat # Code assistant/chat directly in the terminal
    alpaca # GUI LLM client with markdown support
    fabric-ai # AI agent framework for building autonomous agents

    ###################################################
    # GAMING
    ###################################################

    /*
    mangohud # Vulkan and OpenGL overlay for monitoring
    gamemode # Optimise Linux system performance on demand
    protonup-ng # CLI program and API to automate the installation and update of Proton-GE
    gamescope # SteamOS session compositing window manager
    lutris # Open Source gaming platform for GNU/Linux
    bottles # Easy-to-use wineprefix manager
    */

    ###################################################
    # CLI
    ###################################################

    zellij # Terminal workspace with batteries included
    tmux # Terminal multiplexer
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
    openssl # Cryptographic library that implements the SSL and TLS protocols
    tre-command # Tree command, improved
    ouch # Command-line utility for easily compressing and decompressing files and directories
    samba # Standard Windows interoperability suite of programs for Linux and Unix
    libqalculate # Advanced calculator library
    fish # Smart and user-friendly command line shell
    xh # Friendly and fast tool for sending HTTP requests
    hyperfine # Command-line benchmarking tool
    aria2 # Lightweight multi-protocol & multi-source command-line download utility
    mosh # Mobile shell that allows roaming, supports intermittent connectivity, and provides intelligent local echo

    # Monitoring
    iotop # Display I/O usage by processes
    iftop # Display bandwidth usage on an interface

    ###################################################
    # NixOS utils
    ###################################################

    nh # Nix helper

    ###################################################
    # Fetch everything
    ###################################################

    onefetch # Git repository summary on your terminal
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
    inkscape
    gimp
    obs-studio
    onlyoffice-desktopeditors
    qalculate-gtk
    brave # A chromium based browser as an alternative if needed
    cryptpad
    freerdp
    telegram-desktop # Telegram Desktop messaging app
    blender
    godot

    ###################################################
    # Robotics (not used now)
    ###################################################

    kicad # Open Source Electronics Design Automation suite
    freecad # General purpose Open Source 3D CAD/MCAD/CAx/CAE/PLM modeler
    openscad # OpenSCAD is a software for creating solid 3D CAD objects

    ###################################################
    # Backup (not used now)
    ###################################################

    rclone # Sync files and directories to and from major cloud storage
    rclone-browser # Graphical Frontend to Rclone written in Qt
    megacmd # MEGA Command Line Interactive and Scriptable Application

    ###################################################
    # Hyprland
    ###################################################

    ags_1
    clipse
    networkmanagerapplet
    hyprpolkitagent
    hypridle
    hyprlock
    hyprpicker
    hyprsunset
    hyprpaper
    pyprland
    pavucontrol
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
    #mitmproxy

    # Utilities
    exiftool
    macchanger

    ###################################################
    # TEST APPS
    ###################################################
  ];
}
