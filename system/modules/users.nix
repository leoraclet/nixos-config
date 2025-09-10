{pkgs, ...}: {
  users.users.leonne = {
    # FIXME
    isNormalUser = true;
    description = "leonne";
    # To avoid being locked out after first install of the system
    # Because by default a new user don't have a password if not set with Nix
    initialPassword = "nixos"; # FIXME: Change user password after first login
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "qemu"
      "kvm"
      "libvirtd"
      "input"
      "video"
      "audio"
      "scanner"
      "lp"
    ];
    shell = pkgs.fish;
    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.fish;
  # Allows to change the initial password to a more robust one after firt login.
  users.mutableUsers = true;

  xdg.mime = {
    enable = true;
    defaultApplications = {
      # PDF
      "application/pdf" = "firefox.desktop";

      # Web
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";

      # Images
      "image/bmp" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/webp" = "imv.desktop";

      # Videos
      "video/mp4" = "umpv.desktop";
    };
  };
}
