{...}: {
  ###################################################
  # GAMING & WINDOWS COMPATIBILITY
  ###################################################

  environment.systemPackages = [
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
