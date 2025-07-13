{pkgs, ...}: {
  users.users.leonne = {
    isNormalUser = true;
    description = "leonne";
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

  xdg.mime = {
    enable = true;
    defaultApplications = {
      # PDF
      "application/pdf" = "org.pwmt.zathura.desktop";

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
