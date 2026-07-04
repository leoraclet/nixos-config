{pkgs, ...}: {
  ###################################################
  # TERMINAL APPS / CLIs
  ###################################################

  environment.systemPackages = with pkgs; [
    # Terminal mulitplexer
    tmux
    zellij

    # Shell
    nushell

    # Disk utilities
    dust # Disk analyzer
    dua # Disk usage analyzer
    duf # Disk Usage/Free Utility

    # Terminal apps
    kitty
    alacritty
    ghostty
    wezterm

    # Terminal file managers
    yazi
    superfile
    broot

    tesseract
    zbar
    xh
    delta
    poppler # PDF rendering library
    atuin # Sqlite bash history
    tealdeer # Very fast implementation of tldr (aka man) in Rust
    navi
    imv # Image viewer
    mpv # Media player
    bat # Like cat, but WAY betters
    eza # Like ls, but better
    zoxide # A better cd
    playerctl # Player control
    brightnessctl # Screen control
    fd # File finder
    jq # JSON parser
    sd # Intuitive find and replace (sed alternative)
    file # File Command
    fzf # Fuzzy finder
    skim
    ripgrep # Text search
    ffmpeg # FFMPEG utility
    grim
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    btop # Monitor of resources
    hexyl # Command-line hex viewer
    procs # Like ps, but cooler
    starship # Cross-shell prompt
    pdftk # PDF toolbox
    chafa # Terminal graphics for the 21st century
    openssl # Crptographic library that implements the SSL and TLS protocols
    ouch # Command-line utility for easily compressing and decompressing files and directories
    gzip # GNU zip compression program
    zip # Compressor/archiver for creating and modifying zipfiles
    samba # Standard Windows interoperability suite of programs for Linux and Unix
    libqalculate # Advanced calculator library
    fish # Smart and user-friendly command line shell
    inetutils # Collection of common network programs
    moreutils # Growing collection of the unix tools that nobody thought to write long ago when unix was young
    socat # Utility for bidirectional data transfer between two independent data channels
    trashy # Simple, fast, and featureful alternative to rm and trash-cli
  ];
}
