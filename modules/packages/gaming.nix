{pkgs, ...}: {
  ###################################################
  # GAMING & WINDOWS COMPATIBILITY
  ###################################################
  # https://www.youtube.com/watch?v=qlfm3MEbqYA
  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = false; # Open ports for Source Dedicated Server hosting
      gamescopeSession.enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamemode.enable = true;
  };

  environment.systemPackages = [
    # heroic # Native GOG, Epic, and Amazon Games Launcher for Linux, Windows and Mac
    # mangohud # Vulkan and OpenGL overlay for monitoring
    # gamemode # Optimise Linux system performance on demand
    # protonup-ng # CLI program and API to automate the installation and update of Proton-GE
    # gamescope # SteamOS session compositing window manager
    # lutris # Open Source gaming platform for GNU/Linux
    # bottles # Easy-to-use wineprefix manager
    # wine-wayland # Open Source implementation of the Windows API on top of X, OpenGL, and Unix
    # winetricks # Script to install DLLs needed to work around problems in Wine
  ];
}
